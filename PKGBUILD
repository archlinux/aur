# Maintainer: littzhch <2371050115@qq.com>
# Contributor: Bruce Zhang
pkgname=picgo
_name=PicGo
pkgver=2.3.1
pkgrel=1
pkgdesc="A simple & beautiful tool for pictures uploading built by electron-vue"
arch=('x86_64' 'i686')
url="https://github.com/Molunerfinn/PicGo"
license=('MIT')
depends=()
optdepends=('npm: plugin support')
makedepends=('yarn')
provides=('picgo')
conflicts=('picgo')
source=(
	"$pkgname-$pkgver.src.tar.gz::https://github.com/Molunerfinn/PicGo/archive/v$pkgver.tar.gz"
)
sha256sums=('c88f748973300bfea33e13c3f42b2096a520b5102e14ff96a531fab2700c796d')

prepare() {
	cd "$_name-$pkgver"
	yarn
}

build() {
	cd "$_name-$pkgver"
	NODE_OPTIONS=--openssl-legacy-provider yarn electron:build --dir
}

package() {
	cd "$_name-$pkgver"

	install -d "$pkgdir/usr/share/picgo"
	install -d "$pkgdir/usr/bin"
	cp -r dist_electron/linux-unpacked/* "$pkgdir/usr/share/picgo"
	ln -s "../share/picgo/picgo" "$pkgdir/usr/bin/picgo"

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
