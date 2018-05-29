# Maintainer: CupIvan <mail@cupivan.ru>

pkgname=kadnode
pkgver=2.2.3
pkgrel=1

pkgdesc="A P2P based DNS resolver"
arch=('x86_64' 'i686')
url="http://github.com/mwarning/KadNode"
license=('MIT')
depends=('mbedtls')

source=("https://github.com/mwarning/KadNode/archive/v${pkgver}.tar.gz")
md5sums=('996c1e279242e556505d823815847257')

backup=('etc/kadnode/kadnode.conf' 'etc/kadnode/peers.txt')
install="kadnode.install"

build()
{
	cd ${srcdir}/KadNode-${pkgver}
	make clean
	make FEATURES="tls bob cmd lpd nss"
}

package() {
	cd ${srcdir}/KadNode-${pkgver}

	install -Dm755 build/kadnode ${pkgdir}/usr/bin/kadnode
	install -Dm755 build/kadnode-ctl ${pkgdir}/usr/bin/kadnode-ctl

	install -Dm644 build/libnss_kadnode.so.2 ${pkgdir}/usr/lib/libnss_kadnode.so.2

	# package systemd units go to /usr/lib/systemd, /etc is for admin override
	install -Dm644 archlinux/kadnode.service ${pkgdir}/usr/lib/systemd/system/kadnode.service
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm 644 misc/manpage ${pkgdir}/usr/share/man/man1/kadnode.1

	install -Dm644 misc/kadnode.conf ${pkgdir}/etc/kadnode/kadnode.conf
	install -Dm644 misc/peers.txt ${pkgdir}/etc/kadnode/peers.txt
}
