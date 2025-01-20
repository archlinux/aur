# Maintainer: CupIvan <mail@cupivan.ru>
# Maintainer: Moritz Warning <moritzwarning@web.de>

pkgname=kadnode
pkgver=2.4.1
pkgrel=2

pkgdesc='A P2P based DNS resolver'
arch=('x86_64' 'i686')
url='http://github.com/mwarning/KadNode'
license=('MIT')
depends=('mbedtls' 'miniupnpc' 'libnatpmp')

backup=('etc/kadnode/kadnode.conf' 'etc/kadnode/peers.txt')

source=("https://github.com/mwarning/KadNode/archive/v${pkgver}.tar.gz")
md5sums=('95f0decced7bb0033478e03ad3cb24ba')

install="kadnode.install"

build() {
	cd ${srcdir}/KadNode-${pkgver}
	make clean
	make FEATURES="bob tls cmd lpd dns nss natpmp upnp"
}

package() {
	cd ${srcdir}/KadNode-${pkgver}

	install -Dm755 build/kadnode ${pkgdir}/usr/bin/kadnode
	install -Dm755 build/kadnode-ctl ${pkgdir}/usr/bin/kadnode-ctl

	install -Dm644 build/libnss_kadnode.so ${pkgdir}/usr/lib/libnss_kadnode.so.2

	# package systemd units go to /usr/lib/systemd, /etc is for admin override
	install -Dm644 archlinux/kadnode.service ${pkgdir}/usr/lib/systemd/system/kadnode.service
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm 644 misc/manpage ${pkgdir}/usr/share/man/man1/kadnode.1

	install -Dm644 misc/kadnode.conf ${pkgdir}/etc/kadnode/kadnode.conf
	install -Dm644 misc/peers.txt ${pkgdir}/etc/kadnode/peers.txt
}
