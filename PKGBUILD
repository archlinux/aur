# Maintainer: redfish <redfish@galactica.pw>

pkgname=randomx
_name=RandomX
pkgver=1.1.10
pkgrel=2
pkgdesc="RandomX: The proof of work algorithm based on random code execution"
arch=('x86_64')
url="https://github.com/tevador/RandomX"
license=('BSD')
makedepends=('cmake')
source=("https://github.com/tevador/RandomX/archive/v${pkgver}.tar.gz"
        "include-cstdint.patch")

_blddir=build

prepare() {
	cd "$srcdir/${_name}-${pkgver}"
	patch -p1 -i ../include-cstdint.patch

	mkdir -p ${_blddir}
	cd ${_blddir}
	cmake ..
}

build() {
	cd "$srcdir/${_name}-${pkgver}"
	cd ${_blddir}
	make
}

check() {
	cd "$srcdir/${_name}-${pkgver}/${_blddir}"
	./randomx-tests
}

package() {
	cd "$srcdir/${_name}-${pkgver}/${_blddir}"
	make DESTDIR="$pkgdir/" install
	install -Dm755 "randomx-benchmark" "${pkgdir}/usr/bin/randomx-benchmark"
	install -Dm755 "randomx-codegen" "${pkgdir}/usr/bin/randomx-codegen"
}

sha256sums=('051cee65700a10adef84e7946416068bc805757683378a854a1b168ec18da783'
            '4196ae10b1e0600914282e28a25f0f48a9a87277d2275521d7885214af264dc4')
