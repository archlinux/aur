# Maintainer: Tobias Heider <me@tobhe.de>
# Maintainer: T.J. Townsend <tj@openbsd.org>

pkgname=openiked
pkgver=7.1
pkgrel=3
pkgdesc="Free implementation of the IKEv2 protocol"
arch=('x86_64')
url="https://www.openiked.org"
license=('ISC')
depends=('glibc' 'libevent' 'openssl')
makedepends=('linux-headers' 'bison' 'cmake')
provides=('iked' 'ikectl')
conflicts=('iked' 'ikectl')
source=("https://cdn.openbsd.org/pub/OpenBSD/OpenIKED/openiked-${pkgver}.tar.gz"{,.asc}
        'openiked.service'
        'sysusers.conf')
sha256sums=('382f45ddd593bdcaaaaaf0b6c52668a6115d7b2d3b44c6408f976d36343659c2'
            'SKIP'
            '692eca0595a26e33b3d305909a4b70b2b62913118386117e91c81c2f85c3e612'
            '0b9806bc8e75fdc473db71d12b9096b6016cc0023835c84f83e36316e594847b')
validpgpkeys=('8E3FC7EC8089D4892BF3DBAAFBC5853596D16718')

build() {
	cmake -B build -S "openiked-${pkgver}" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_SKIP_RPATH=TRUE \
		-Wno-dev
	cmake --build build
}

check() {
	cd build/regress/dh
	./dhtest
}

package() {
	cd openiked-${pkgver}
	install -Dm644 ../openiked.service -t "${pkgdir}"/usr/lib/systemd/system/
	install -Dm644 ../sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/openiked.conf

	./setup_config.sh "${pkgdir}/etc/iked"
	install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
	install -Dm600 iked.conf -t "${pkgdir}"/usr/lib/tmpfiles.d/

	install -Dm644 iked/iked.8 ikectl/ikectl.8 -t "${pkgdir}"/usr/share/man/man8/
	install -Dm644 iked/iked.conf.5 "${pkgdir}"/usr/share/man/man5/iked.conf.5

	install -Dm755 ../build/iked/iked "${pkgdir}"/usr/bin/iked
	install -Dm755 ../build/ikectl/ikectl "${pkgdir}"/usr/bin/ikectl
}
