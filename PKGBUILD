# Maintainer: Tony Lambiris <tony@criticalstack.com>
pkgname=aws-sdk-cpp-git
pkgver=1.7.28.r0.g7bc5b426e8
pkgrel=1
pkgdesc="AWS SDK for C++"
arch=(any)
url="https://github.com/aws/aws-sdk-cpp"
license=('BSD')
depends=('cmake')
makedepends=('openssl' 'curl' 'zlib' 'libutil-linux')
source=("${pkgname}::git+https://github.com/aws/aws-sdk-cpp")
sha256sums=('SKIP')

pkgver() {
	cd ${pkgname}

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${pkgname}

    CMAKE_FLAGS="-Wno-dev \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_INSTALL_INCLUDEDIR=/usr/include \
		-DCMAKE_BUILD_TYPE=Release \
		-DENABLE_TESTING=OFF \
		-DSTATIC_LINKING=1 \
		-DNO_HTTP_CLIENT=1 \
		-DMINIMIZE_SIZE=ON \
		-DBUILD_SHARED_LIBS=OFF"
    cmake $CMAKE_FLAGS .

	make ${MAKEFLAGS}
}

package() {
	cd ${pkgname}

	make DESTDIR="${pkgdir}" install
}
