# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Filip Dvorak <fila@pruda.com>
# Contributor: 3ED_0 (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=firehol-git
_gitname=firehol
pkgver=v3.1.3.r1.ga436004
pkgrel=1
epoch=1
pkgdesc="The iptables stateful packet filtering firewall builder."
url="http://firehol.org/"
arch=('any')
license=('GPL')
depends=('iptables' 'gawk' 'iproute' 'iprange' 'ipset' 'traceroute')
makedepends=('git' 'dblatex' 'pandoc')
provides=('firehol')
conflicts=('firehol')
backup=('etc/firehol/firehol.conf' 'etc/firehol/fireqos.conf')
install='firehol.install'
source=("$_gitname::git+https://github.com/firehol/firehol"
        'firehol.service' 'fireqos.service')

pkgver() {
	cd "$_gitname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_gitname"

	./autogen.sh
	./configure \
		--enable-maintainer-mode \
		--prefix="/usr" \
		--sysconfdir="/etc" \
		--sbindir="/usr/bin" \
		--libexecdir="/usr/lib"

	# Documents are created in certain order
	# thus parallel processing must be disabled:
	MAKEFLAGS="-j1" make
}

package() {
	cd "$_gitname"

	make install DESTDIR="$pkgdir"

	install -D -m644 $srcdir/firehol.service "$pkgdir/usr/lib/systemd/system/firehol.service"
	install -D -m644 $srcdir/fireqos.service "$pkgdir/usr/lib/systemd/system/fireqos.service"

	# backup does not work if the file is not contained in the package
	# plus, creating it in post_install will set 777 permissions and we don't want that
	touch "$pkgdir/etc/firehol/firehol.conf"
	chmod 600 "$pkgdir/etc/firehol/firehol.conf"
	touch "$pkgdir/etc/firehol/fireqos.conf"
	chmod 600 "$pkgdir/etc/firehol/fireqos.conf"

}

md5sums=('SKIP'
         'd87f844ac0ef319fd0ea0adcb0a66905'
         'ea0b9238f494e4eeeac7a975346bcf3c')
