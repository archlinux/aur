# Maintainer: Julian Hofmann <aur at julianh dot de>

## links
# https://crossonic.org
# https://github.com/juho05/crossonic

_pkgname="crossonic-bin"
pkgname="$_pkgname"
pkgver=0.2.2
pkgrel=1
pkgdesc="An OpenSubsonic compatible cross-platform music client"
arch=('x86_64')
url="https://github.com/juho05/crossonic"
license=("AGPL-3.0-or-later")

depends=(
	'gtk3'
	'mpv'
	'libayatana-appindicator'
	'libayatana-indicator'
	'ayatana-ido'
	'fontconfig'
	'cairo'
	'glib2'
	'glibc'
	'gcc-libs'
	'at-spi2-core'
	'pango'
	'libepoxy'
	'harfbuzz'
	'libdbusmenu-glib'
	'zlib'
	'gdk-pixbuf2'
)
makedepends=('patchelf')

_pkgsrc="Crossonic-$pkgver-linux-x86-64"
_pkgext="tar.gz"
source=(
	"$_pkgsrc.$_pkgext"::"$url/releases/download/v$pkgver/$_pkgsrc.$_pkgext"
)
noextract=("$_pkgsrc.$_pkgext")
sha256sums=(
	'fb6cd4804d4f8db79e417f4487bf68edc99fd42bc4a66809b80a6c33f1ef5c51'
)


package() {
	mkdir "$_pkgsrc"
	bsdtar -xf "$_pkgsrc.$_pkgext" -C "$_pkgsrc"
	mv "$_pkgsrc/Crossonic" "$_pkgsrc/${pkgname%-bin}"

	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/lib/${pkgname%-bin}"

	install -m755 "$_pkgsrc/${pkgname%-bin}" "$pkgdir/usr/lib/${pkgname%-bin}/"
	cp -r "$_pkgsrc/data" "$_pkgsrc/lib" "$pkgdir/usr/lib/${pkgname%-bin}/"

	find "$pkgdir"/usr/lib/"${pkgname%-bin}"/lib -type f -name "*.so" | while read -r lib; do
		patchelf --set-rpath '$ORIGIN' "$lib"
	done
	patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/usr/lib/${pkgname%-bin}/${pkgname%-bin}"


	ln -s "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"

	install -Dm644 "$_pkgsrc/data/flutter_assets/assets/icon/desktop/crossonic-512.png" "$pkgdir/usr/share/pixmaps/${_pkgname%-bin}.png"

	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/org.crossonic.app.desktop" << END
[Desktop Entry]
Type=Application
Name=Crossonic
Comment=$pkgdesc
Exec=env CROSSONIC_DISABLE_VERSION_CHECK=1 ${_pkgname%-bin}
Icon=${_pkgname%-bin}
SingleMainWindow=true
StartupWMClass=org.crossonic.app
Terminal=false
Categories=Multimedia
END
}
