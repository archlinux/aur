# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Filip Dvorak <fila@pruda.com>
# Contributor: 3ED_0 (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=firehol-git
_gitname=firehol
pkgver=2013.10.23
pkgrel=1
pkgdesc="The iptables stateful packet filtering firewall builder."
url="http://firehol.org/"
arch=('any')
license=('GPL')
depends=('iptables' 'gawk' 'iproute')
makedepends=('git' 'dblatex')
provides=('firehol')
conflicts=('firehol')
backup=('etc/firehol/firehol.conf' 'etc/firehol/fireqos.conf')
install='firehol.install'
source=('git://github.com/ktsaou/firehol.git'
        'disable-kernel-vercheck.patch' 'firehol.service' 'fireqos.service')

pkgver() {
        cd "$_gitname"
        git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"

	# the sed command for minimum kernel version is broken, and since it
	# only ensures we are using a kernel > 2.3, we can safely skip it entirely
	# https://bugs.archlinux.org/task/25917
#	patch -p1 < "$srcdir/disable-kernel-vercheck.patch"

	./autogen.sh
	./configure --enable-maintainer-mode --prefix="/usr" --sysconfdir="/etc" --sbindir="/usr/bin"
	make
}

package() {
	cd "$srcdir/$_gitname"

	make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" sbindir="$pkgdir/usr/bin" install

	install -D -m644 $srcdir/firehol.service "$pkgdir/usr/lib/systemd/system/firehol.service"
	install -D -m644 $srcdir/fireqos.service "$pkgdir/usr/lib/systemd/system/fireqos.service"

	# backup does not work if the file is not contained in the package
	# plus, creating it in post_install will set 777 permissions and we dont want that
	touch "$pkgdir/etc/firehol/firehol.conf"
	chmod 600 "$pkgdir/etc/firehol/firehol.conf"
	touch "$pkgdir/etc/firehol/fireqos.conf"
	chmod 600 "$pkgdir/etc/firehol/fireqos.conf"
}

md5sums=('SKIP'
         '73a8ae701f82af98e56a4b2f436fb399'
         'd87f844ac0ef319fd0ea0adcb0a66905'
         'ea0b9238f494e4eeeac7a975346bcf3c')
