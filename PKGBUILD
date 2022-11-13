# Maintainer:  zhullyb <zhullyb [at] outlook [dot] com>
# Contributor: littzhch <2371050115@qq.com>
# Contributor: Bruce Zhang
pkgname=picgo-electron
_name=PicGo
pkgver=2.3.1
pkgrel=1
pkgdesc="A simple & beautiful tool for pictures uploading built by electron-vue, use electron16 of system."
arch=('x86_64' 'i686')
url="https://github.com/Molunerfinn/PicGo"
license=('MIT')
depends=('electron16')
makedepends=('yarn')
provides=('picgo')
conflicts=('picgo-appimage' 'picgo')
source=(
	"$pkgname-$pkgver.src.tar.gz::https://github.com/Molunerfinn/PicGo/archive/v$pkgver.tar.gz"
	"picgo-wrapper.sh"
)
md5sums=('9480101d84385c80259654920fa0d036'
         '7157d2f08c20efb07a8ec0d9add0b3bf')

prepare() {
	cd "$_name-$pkgver"
	yarn
}

build() {
	cd "$_name-$pkgver"
	yarn electron:build --dir
}

package() {
	cd "$_name-$pkgver"

	install -d "$pkgdir/usr/{bin,lib,share}"
	install -Dm755 ${srcdir}/picgo-wrapper.sh ${pkgdir}/usr/bin/picgo
	install -Dm644 ./dist_electron/linux-unpacked/resources/app.asar -t ${pkgdir}/usr/lib/picgo/

	# Install desktop file
	echo "[Desktop Entry]
Name=PicGo
Comment=Easy to upload your pic & copy to write
Exec=picgo %U
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
