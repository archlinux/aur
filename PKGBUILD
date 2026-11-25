# Maintainer: Iván Zaera Avellón <ivan.zaera@posteo.net>
pkgname=peter
pkgver=0.0.3
pkgrel=2
pkgdesc='A USB based keys manager which integrates with PAM and SSH.'
arch=('pentium4' 'x86_64')
url='https://codeberg.org/ivan-zaera/peter'
license=('GPL-3.0-or-later')
depends=(
	'bash'
	'coreutils'            # cat, date
	'systemd'
	'util-linux'           # mount, setpriv
	'x11-ssh-askpass'      # /usr/lib/ssh/ssh-askpass
)
optdepends=(
	'openssh: integration with ssh-agent'
	'pam: integration with pam_exec.so'
)
makedepends=(
	'coreutils'
	'scdoc'
)
install='install.sh'

source=(
	"$pkgname-$pkgver.tar.gz::https://codeberg.org/ivan.zaera/$pkgname/archive/$pkgver.tar.gz"
)
sha256sums=("eecf00129ddc32c92e7a3da230e4cd36f7e2e0c2c84c7254cb6aeff0bde8a675")

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
	cp -arv rust/target/release/peter $pkgdir/usr/bin

	mkdir -p $pkgdir/usr/lib/peter
	cp -arv bash/*.bash $pkgdir/usr/lib/peter

	mkdir -p $pkgdir/usr/share/man/man1
	cp -arv man/build/peter.1.gz $pkgdir/usr/share/man/man1
}
