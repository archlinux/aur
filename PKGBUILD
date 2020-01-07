# Maintainer: Bruce Zhang
pkgname=picgo
_name=PicGo
pkgver=2.2.0
pkgrel=1
pkgdesc="A simple & beautiful tool for pictures uploading built by electron-vue"
arch=('x86_64' 'i686')
url="https://github.com/Molunerfinn/PicGo"
license=('MIT')
depends=('electron6')
makedepends=('npm')
provides=('picgo')
conflicts=('picgo-appimage')
source=(
	"$pkgname-$pkgver.src.tar.gz::https://github.com/Molunerfinn/PicGo/archive/v$pkgver.tar.gz"
)
sha256sums=('8ab151bdd3a9c80af4523984872317e7ef755a3e20a6fec18d3f9d1888d4ae9e')

prepare() {
	cd "$_name-$pkgver"
	electronDist="\/usr\/lib\/electron6"
	sed -i "s/productName: 'PicGo',/productName: 'PicGo', electronDist: '$electronDist',/" vue.config.js
	npm install
}

build() {
	cd "$_name-$pkgver"
	npm run electron:build -- --dir
}

package() {
	cd "$_name-$pkgver"

	# Install asar file
	install -Dm644 dist_electron/linux-unpacked/resources/app.asar "$pkgdir/usr/share/picgo/app.asar"

	# Install start script
	echo "#!/usr/bin/env sh
exec electron6 /usr/share/picgo/app.asar \$@
" > "$srcdir/picgo.sh"
	install -Dm755 "$srcdir/picgo.sh" "$pkgdir/usr/bin/picgo"

	# Install desktop file
	echo "[Desktop Entry]
Name=PicGo
Comment=Easy to upload your pic & copy to write
Exec=/usr/bin/picgo %U
Terminal=false
Type=Application
Icon=picgo
StartupWMClass=PicGo
X-AppImage-Version=2.1.2.38
Categories=Utility;
MimeType=x-scheme-handler/picgo
" > "$srcdir/picgo.desktop"
	install -Dm644 "$srcdir/picgo.desktop" "$pkgdir/usr/share/applications/picgo.desktop"

	# Install icons
	install -Dm644 build/icons/256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/picgo.png"
}
