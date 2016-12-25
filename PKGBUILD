# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Filip Dvorak <fila@pruda.com>
# Contributor: 3ED_0 (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=firehol-git
_gitname=firehol
pkgver=v3.1.0.r1.g1834342
pkgrel=2
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

	# https://github.com/firehol/firehol/issues/178
	rm "$pkgdir/usr/bin/"{vnetbuild,update-ipsets,fireqos,link-balancer,firehol}
	ln -s "/usr/lib/firehol/3.1.0/vnetbuild" "$pkgdir/usr/bin/vnetbuild"
	ln -s "/usr/lib/firehol/3.1.0/update-ipsets" "$pkgdir/usr/bin/update-ipsets"
	ln -s "/usr/lib/firehol/3.1.0/fireqos" "$pkgdir/usr/bin/fireqos"
	ln -s "/usr/lib/firehol/3.1.0/link-balancer" "$pkgdir/usr/bin/link-balancer"
	ln -s "/usr/lib/firehol/3.1.0/firehol" "$pkgdir/usr/bin/firehol"

}

md5sums=('SKIP'
         'd87f844ac0ef319fd0ea0adcb0a66905'
         'ea0b9238f494e4eeeac7a975346bcf3c')
