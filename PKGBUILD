# Maintainer: Iván Zaera Avellón <ivan.zaera@posteo.net>
pkgname=restic-launcher
pkgver=0.0.3
pkgrel=1
pkgdesc='A very simple restic launcher to make full system backups every hour.'
arch=('pentium4' 'x86_64')
url='https://codeberg.org/ivan.zaera/restic-launcher'
license=('GPL-3.0-or-later')
depends=(
	'bash'
	'coreutils'
	'grep'
	'restic'
	'sed'
	'sudo'
)
makedepends=(
	'scdoc'
)
backup=(
	etc/restic-launcher/config
	etc/restic-launcher/includes
	etc/restic-launcher/excludes
)
install='install.sh'

source=(
	"$pkgname-$pkgver.tar.gz::https://codeberg.org/ivan.zaera/$pkgname/archive/$pkgver.tar.gz"
)
sha256sums=("44cd906f9b7e5c1bcd85f292f8742d7260d34f8b2c44f62d29ff81e9b65337a3")

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

	cp -arv root/* $pkgdir
	# cp -arv arch/root/* $pkgdir

	mkdir -p $pkgdir/usr/bin
	cp -a bash/restic-launcher.sh $pkgdir/usr/bin/restic-launcher

	chown -R 952:952 $pkgdir/etc/restic-launcher
	chmod -R o-rx $pkgdir/etc/restic-launcher

	mkdir -p $pkgdir/usr/share/man/man1
	cp -arv man/build/restic-launcher.1.gz $pkgdir/usr/share/man/man1
}
