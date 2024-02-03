# Maintainer: littzhch <2371050115@qq.com>

pkgname=picgo-electron-bin
_name=PicGo
pkgver=2.3.1
pkgrel=1
pkgdesc="A simple & beautiful tool for pictures uploading built by electron-vue, extract from pre-built appimage and use system electron"
arch=('any')
url="https://github.com/Molunerfinn/PicGo"
license=('MIT')
depends=('electron')
optdepends=('npm: plugin support')
provides=('picgo')
conflicts=('picgo')
source=(
	"https://github.com/Molunerfinn/PicGo/releases/download/v$pkgver/PicGo-$pkgver.AppImage"
	#"https://picgo-1251750343.cos.ap-chengdu.myqcloud.com/$pkgver/PicGo-$pkgver.AppImage"
	# if can't access github.com, use the second URL
)
sha256sums=('465581a6f775a4dbb0f5251a85dd3a87bbc466fe442fbe96dfb4f206bdb75a62')

prepare() {
	chmod +x "PicGo-$pkgver.AppImage"
	"./PicGo-$pkgver.AppImage" --appimage-extract
}

package() {
	cd squashfs-root

	install -Dm644 "./resources/app.asar" "$pkgdir/usr/share/picgo/app.asar"
	install -Dm644 "./resources/app-update.yml" "$pkgdir/usr/share/picgo/app-update.yml"
	install -Dm644 ./usr/share/icons/hicolor/256x256/apps/picgo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/picgo.png"

	install -d "$pkgdir/usr/share/applications"
	sed -e 's/Exec=.*/Exec=\/usr\/bin\/picgo/g' picgo.desktop > "$pkgdir/usr/share/applications/picgo.desktop"

	install -d "$pkgdir/usr/bin"
	echo "#!/bin/sh
	electron /usr/share/picgo/app.asar" > "$pkgdir/usr/bin/picgo"
	chmod 755 "$pkgdir/usr/bin/picgo"
}
