# Maintainer: Ilya Obukhov <ilya.obukhov.bs@gmail.com>
# Rendered by deploy/scripts/release-aur.sh from packaging/aur/PKGBUILD.in — edit the template, not the AUR copy.
pkgname=io-workshop-act-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='ACT — a MyAnimeList client (desktop build)'
arch=('x86_64')
url='https://github.com/MustD/act'
license=('MIT')
# The bundled runtime brings its own JVM; these are what its AWT and Skia libraries link against.
depends=('alsa-lib' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'libglvnd' 'libx11' 'libxext' 'libxi' 'libxrender'
         'libxtst' 'xdg-utils')
options=('!strip')
_deb="io-workshop-act_${pkgver}_amd64.deb"
source=("$_deb::https://github.com/MustD/act/releases/download/$pkgver/$_deb" 'LICENSE')
noextract=("$_deb")
sha256sums=('f3520a59a42bb7816f2664dafa8ac5aeb9e129d4715b9636fac1dedf2999150b' '728f66fa204d52fb356bbd85728252f77f77ba61be57816b9b478d772c7bc914')

package() {
	# A .deb's maintainer scripts never run here, so the menu entry, icon and /usr/bin link are installed by hand.
	cd "$srcdir"
	bsdtar -xf "$_deb" 'data.tar.*'
	bsdtar -xf data.tar.* -C "$pkgdir" --no-same-owner

	install -dm755 "$pkgdir/usr/bin"
	ln -s /opt/io-workshop-act/bin/ACT "$pkgdir/usr/bin/io-workshop-act"

	install -Dm644 "$pkgdir/opt/io-workshop-act/lib/ACT.png" \
		"$pkgdir/usr/share/icons/hicolor/512x512/apps/io-workshop-act.png"

	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/io-workshop-act.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=ACT
Comment=MyAnimeList client
Exec=io-workshop-act
Icon=io-workshop-act
Terminal=false
Categories=Network;Utility;
DESKTOP

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# jpackage's own entry points at /opt paths and Categories=Unknown; ours replaces it.
	rm -f "$pkgdir/opt/io-workshop-act/lib/io-workshop-act-ACT.desktop"
}
