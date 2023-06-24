# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=netpad-player
pkgver=1.5.2
pkgrel=1
pkgdesc="网络画板，用核心技术赋能智慧数学教育"
arch=(x86_64 aarch64)
url="https://www.netpad.net.cn/"
license=('custom')
depends=(bash electron)
makedepends=(asar gendesk)
source=("https://www.netpad.net.cn/download/NetpadPlayer-${pkgver}.exe")
sha256sums=('9b8cc93f27c6ab8fa382564ef8e111a324fa9f1b19f86eb36619ce79017cd679')

prepare() {
	find $srcdir -name app.asar -exec asar e {} ./app \;
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -av app $pkgdir/opt/$pkgname/
	echo -e "#!/bin/sh\nelectron /opt/$pkgname/app" | install -Dm755 /dev/stdin $pkgdir/usr/bin/netpad-player
	find $srcdir -name icon.png -exec install -Dm644 {} $pkgdir/usr/share/pixmaps/$pkgname.png \;
	gendesk --name 网络画板离线播放器 --exec /usr/bin/netpad-player --pkgname $pkgname --icon $pkgname
	install -Dm644 $pkgname.desktop -t $pkgdir/usr/share/applications/
}
