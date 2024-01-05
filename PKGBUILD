# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=netpad-player
pkgver=1.5.9
pkgrel=1
pkgdesc="网络画板，用核心技术赋能智慧数学教育"
arch=(x86_64 aarch64)
url="https://www.netpad.net.cn/"
license=('custom')
depends=(bash electron)
makedepends=(asar)
source=(
	$pkgname.desktop
	"https://www.netpad.net.cn/download/NetpadPlayer-${pkgver}.exe")
sha256sums=('6dbdb46f4ed3388b2ec5b7c90ca566c59a39bbef15e9cad5e1e9884df178d1be'
            '92cb05015d2bb70b88740ad817f9bb6cbcb8401f5090903119611f4fdbfaccfd')

prepare() {
	find $srcdir -name app.asar -exec asar e {} ./app \;
	find . -type f -path "*/darwin/*" -print -delete
	find . -name "*.rar" -print -delete
	find . -name "js-yaml.js" -path "*/bin/js-yaml.js" -delete
	find . -name "semver.js" -path "*/bin/semver.js" -delete
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -av app $pkgdir/opt/$pkgname/
	printf "#!/bin/sh
exec electron /opt/$pkgname/app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/netpad-player
	find $srcdir -name icon.png -print -exec install -Dm644 {} $pkgdir/usr/share/pixmaps/$pkgname.png \;
	install -vDm644 $pkgname.desktop -t $pkgdir/usr/share/applications/
	find $pkgdir -type d -empty -delete
}
