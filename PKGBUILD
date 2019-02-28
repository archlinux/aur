# Maintainer: Tony Lambiris <tony@criticalstack.com>
pkgname=aws-sdk-cpp-git
pkgver=1.7.59.r0.gcc21273299
pkgrel=1
pkgdesc="AWS SDK for C++"
arch=('x86_64')
url="https://github.com/aws/aws-sdk-cpp"
license=('Apache')
depends=('cmake')
makedepends=('openssl' 'curl' 'zlib' 'libutil-linux')
conclits=('aws-checksums-git')
_gitcommit='cc212732996dcabbf100404b9af773f85cfb1a42'
#source=("${pkgname}::git+https://github.com/aws/aws-sdk-cpp")
source=("${pkgname}::git+https://github.com/aws/aws-sdk-cpp#commit=${_gitcommit}")
sha256sums=('SKIP')

# disable until aws engineers can settle on their fucking build process
#pkgver() {
#	cd "${srcdir}/${pkgname}"
#
#	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
	cd "${srcdir}/${pkgname}"

	mkdir -p build
	cd build

    CMAKE_FLAGS="-Wno-dev \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_INSTALL_INCLUDEDIR=/usr/include \
		-DCMAKE_BUILD_TYPE=Release \
		-DENABLE_TESTING=OFF \
		-DSTATIC_LINKING=1 \
		-DNO_HTTP_CLIENT=1 \
		-DMINIMIZE_SIZE=ON \
		-DBUILD_SHARED_LIBS=OFF"
    cmake $CMAKE_FLAGS ..

	make ${MAKEFLAGS}
}

package() {
	cd "${srcdir}/${pkgname}"

	make -C build DESTDIR="${pkgdir}" install
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
