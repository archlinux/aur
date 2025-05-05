# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=netpad-player
pkgver=1.6.5
pkgrel=1
pkgdesc="网络画板，用核心技术赋能智慧数学教育"
arch=(any)
url="https://www.netpad.net.cn/"
license=('custom')
depends=(bash electron)
makedepends=(asar)
source=(
	$pkgname.desktop
	"https://www.netpad.net.cn/download/NetpadPlayer-${pkgver}.exe")
sha256sums=('6dbdb46f4ed3388b2ec5b7c90ca566c59a39bbef15e9cad5e1e9884df178d1be'
            '2f6aa71b2050bf789c5f5c0eee16e991c80101a131693d3580651a2769064733')
options=(!emptydirs)
prepare() {
	find $srcdir -name app.asar -print -exec asar e {} ./app \;
	find . -type f -path "*/darwin/*" -printf "rm %p\n" -delete
	find . -name "*.rar" -printf "rm %p\n" -delete
	find . -path "*/bin/*.js" -delete
	find . -name "*.js.map" -printf "rm %p\n" -delete
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -av app $pkgdir/opt/$pkgname/
	printf "#!/bin/bash
set -eux -o pipefail
exec electron /opt/$pkgname/app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/netpad-player
	find $srcdir -name icon.png -print -exec install -Dm644 {} $pkgdir/usr/share/pixmaps/$pkgname.png \;
	install -vDm644 $pkgname.desktop -t $pkgdir/usr/share/applications/
}
