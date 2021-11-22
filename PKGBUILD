# Maintainer: Bruce Zhang (bruceutut)
pkgname=firecamp
pkgver=2.3.1
pkgrel=1
pkgdesc='API platform for your favorite API-style'
arch=('x86_64')
url='https://firecamp.io/download'
license=('custom: Firecamp')
makedepends=('p7zip')
depends=('electron12')
source=("$pkgname-$pkgver.orig.appimage::https://firecamp.ams3.digitaloceanspaces.com/versions/linux/Firecamp-$pkgver.AppImage")
sha256sums=('1fd581a94cc3f4f6a3978578e69c6312d69126a026dd0f559a557c72d7db9a66')

prepare() {
	7z x "$pkgname-$pkgver.orig.appimage" -ofirecamp
	cd firecamp/resources

	echo "#!/usr/bin/env sh
export ELECTRON_IS_DEV=0
exec electron12 /usr/lib/firecamp/app.asar --no-sandbox \$@
" > "$srcdir/firecamp.sh"

	echo "[Desktop Entry]
Name=Firecamp
Exec=/usr/bin/firecamp %U
Terminal=false
Type=Application
Icon=firecamp
StartupWMClass=Firecamp
X-AppImage-Version=2.3.1
Comment=One playstation for all your Request.
MimeType=x-scheme-handler/fc;
Categories=Development;
" > "$srcdir/firecamp.desktop"
}

package() {
	cd "$srcdir/firecamp/resources"
	install -vDm644 app.asar "$pkgdir/usr/lib/firecamp/app.asar"
	install -vDm644 app-update.yml "$pkgdir/usr/lib/firecamp/app-update.yml"
	cp -rv {services,node_modules,assets} "$pkgdir/usr/lib/firecamp/"
	install -vDm755 "$srcdir/firecamp.sh" "$pkgdir/usr/bin/firecamp"
	install -vDm644 "$srcdir/firecamp.desktop" "$pkgdir/usr/share/applications/firecamp.desktop"
	
	cd "$srcdir/firecamp"
	install -vDm644 usr/share/icons/hicolor/0x0/apps/firecamp.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/firecamp.png"
}
