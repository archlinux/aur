# Maintainer: Iván Zaera Avellón <ivan.zaera@posteo.net>
pkgname=bautista
pkgver=0.0.14
pkgrel=1
pkgdesc='A domotic butler bot'
arch=('pentium4' 'x86_64')
url='https://codeberg.com/ivan.zaera/bautista'
license=('GPL-3.0-or-later')
depends=(
	'nodejs'
)
makedepends=(
	'coreutils'
	'npm'
	'pkgconf'
	'rust'
	'shadow'
)
backup=(
	'etc/bautista/config.toml'
)
install='install.sh'

source=(
	"$pkgname-$pkgver.tar.gz::https://codeberg.org/ivan.zaera/$pkgname/archive/$pkgver.tar.gz"
)
sha256sums=("237e00e9ff26dfde72e2e355aef8120f1d298f03fc8ca2344f2bc60205f9793b")

build() {
	cd $srcdir/$pkgname
	make MODE=release build
}

check() {
	cd $srcdir/$pkgname
	make lint
	make test
}

package() {
	cd $srcdir/$pkgname

	cp -arv arch/root/* $pkgdir

	mkdir -p $pkgdir/usr/lib/bautista
	cp -arv rust/target/release/bautista-bot $pkgdir/usr/lib/bautista

	mkdir -p $pkgdir/usr/lib/bautista/node/meross-bridge
	cp -arv node/meross-bridge/*.js $pkgdir/usr/lib/bautista/node/meross-bridge
	cp -ar node/node_modules $pkgdir/usr/lib/bautista/node
}
