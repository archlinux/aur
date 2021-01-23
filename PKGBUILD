# Maintainer: Tobias Heider <me@tobhe.de>
pkgname=openiked
pkgver=6.9.0
pkgrel=1
pkgdesc="Free implementation of the IKEv2 protocol"
arch=('x86_64')
url="https://www.openiked.org"
license=('ISC')
depends=('glibc' 'libevent' 'openssl')
makedepends=('linux-headers' 'bison' 'cmake' 'git')
provides=('iked' 'ikectl')
source=("https://github.com/openiked/openiked-portable/archive/refs/tags/v${pkgver}.tar.gz"
        'openiked.service'
        'sysusers.conf')
sha256sums=('091fb7bb3a1f708b8d620cb11dd5509091c0326293fb38f020a7b6c8909d19af'
            '692eca0595a26e33b3d305909a4b70b2b62913118386117e91c81c2f85c3e612'
            '0b9806bc8e75fdc473db71d12b9096b6016cc0023835c84f83e36316e594847b')

build() {
	cd openiked-portable-${pkgver}
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make
}

check() {
	cd openiked-portable-${pkgver}/build/regress/dh
	./dhtest
}

package() {
	cd openiked-portable-${pkgver}
	mkdir -p /var/empty
	install -Dm644 ../openiked.service -t "${pkgdir}"/usr/lib/systemd/system/
	install -Dm644 ../sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/openiked.conf

	./setup_config.sh "${pkgdir}/etc/iked"
	install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
	install -Dm600 iked.conf -t "${pkgdir}"/usr/lib/tmpfiles.d/

	install -Dm644 iked/iked.8 "${pkgdir}"/usr/share/man/man8/iked.8
	install -Dm644 iked/iked.conf.5 "${pkgdir}"/usr/share/man/man5/iked.conf.5
	install -Dm644 ikectl/ikectl.8 "${pkgdir}"/usr/share/man/man8/ikectl.8

	cd build
	install -Dm755 iked/iked "${pkgdir}"/usr/bin/iked
	install -Dm755 ikectl/ikectl "${pkgdir}"/usr/bin/ikectl
}
