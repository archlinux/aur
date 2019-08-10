# Maintainer: Bruce Zhang
pkgname=picgo
_name=PicGo
pkgver=2.1.2
pkgrel=3
pkgdesc="A simple & beautiful tool for pictures uploading built by electron-vue"
arch=('x86_64' 'i686')
url="https://github.com/Molunerfinn/PicGo"
license=('MIT')
depends=('electron4')
makedepends=('npm')
provides=('picgo')
conflicts=('picgo-appimage')
source=(
	"$pkgname-$pkgver.src.tar.gz::https://github.com/Molunerfinn/PicGo/archive/v$pkgver.tar.gz"
)
sha256sums=('d16ac1a82eea84ddb5a4a52706e7b8cfd2133f241fc3f65db0603138493886fc')

prepare() {
	cd "$_name-$pkgver"
	electronDist="\/usr\/lib\/electron4"
	sed -i '/"electron": ".*/d' package.json
	sed -i "s/\"productName\": \"PicGo\",/\"productName\": \"PicGo\",\"electronDist\": \"$electronDist\",/" package.json
	npm install
}

build() {
	cd "$_name-$pkgver"
	npm run build:dir
}

package() {
	cd "$_name-$pkgver"

	# Install asar file
	install -Dm644 build/linux-unpacked/resources/app.asar "$pkgdir/usr/share/picgo/app.asar"

	# Install start script
	echo "#!/usr/bin/env sh
exec electron4 /usr/share/picgo/app.asar \$@
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
X-AppImage-BuildId=1K4XPrqocUxoYupASgBlqlIw6p6
" > "$srcdir/picgo.desktop"
	install -Dm644 "$srcdir/picgo.desktop" "$pkgdir/usr/share/applications/picgo.desktop"

	# Install icons
	install -Dm644 build/icons/256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/picgo.png"
}
