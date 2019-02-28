# Maintainer: Tony Lambiris <tony@criticalstack.com>
pkgname=aws-checksums-git
pkgver=v0.1.2.r0.g78be31b
pkgrel=1
pkgdesc="Cross-Platform HW accelerated CRC32c and CRC32 with fallback to efficient SW implementations."
arch=('x86_64')
conflicts=('aws-checksums')
provides=('aws-checksums')
url="https://github.com/awslabs/aws-checksums"
license=('Apache')
depends=('cmake')
makedepends=('openssl' 'curl' 'zlib' 'libutil-linux')
source=("${pkgname}::git+https://github.com/awslabs/aws-checksums")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"

	mkdir -p build
	cd build

    CMAKE_FLAGS="-Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=OFF"
    cmake ${CMAKE_FLAGS} ..

	make ${MAKEFLAGS}
}

package() {
	cd "${srcdir}/${pkgname}"

	make -C build DESTDIR="${pkgdir}" install
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
