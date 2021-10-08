# Maintainer: Tony Lambiris <tony@libpcap.net>
pkgname=aws-c-common-git
pkgver=v0.6.11.r4.g73067c19
pkgrel=1
pkgdesc="AWS SDK for C++"
arch=(x86_64)
url='https://github.com/awslabs/aws-c-common'
license=(Apache)
depends=(glibc)
makedepends=(cmake)
conflicts=(aws-c-common)
provides=(aws-c-common)
source=("${pkgname}::git+https://github.com/awslabs/aws-c-common#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	git submodule update --init --recursive --force --remote
    #git submodule update --recursive --init
    #git submodule update --init --recursive
    #patch -p1 < "${srcdir}/fix_null.patch"
}

build() {
	cd "${srcdir}/${pkgname}"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON -S . -B build
    cmake --build build
}

check() {
	cd "${srcdir}/${pkgname}"

    cmake --build build --target test
}

package() {
	cd "${srcdir}/${pkgname}"

    cmake --build build --target install -- DESTDIR="${pkgdir}/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}







#build() {
#	cd "${srcdir}/${pkgname}"
#
#    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCUSTOM_MEMORY_MANAGEMENT=OFF -DENABLE_TESTING=OFF -DBUILD_DEPS=OFF \
#        -DCMAKE_PREFIX_PATH="/usr/lib/cmake" \
#        -S . -B build -G Ninja
#    ninja -C build -j 2 # the build is so heavy that it gets OOM killed even at powerful machines
#}
#
#package() {
#	cd "${srcdir}/${pkgname}"
#
#    DESTDIR="${pkgdir}" ninja -C build install
#    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
#}


#prepare() {
#	cd "${srcdir}/${pkgname}"
#
#	git submodule update --init --recursive
#}
#
#build() {
#	cd "${srcdir}/${pkgname}"
#
#	mkdir -p build
#	cd build
#
#	export CC="/usr/bin/gcc" CXX="/usr/bin/g++"
#	CMAKE_FLAGS="-Wno-dev \
#		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
#		-DCMAKE_INSTALL_INCLUDEDIR=/usr/include \
#		-DCMAKE_INCLUDE_PATH=/usr/lib/openssl-1.0 \
#		-DCMAKE_LIBRARY_PATH=/usr/include/openssl-1.0 \
#		-DCMAKE_BUILD_TYPE=Release \
#		-DENABLE_TESTING=OFF \
#		-DSTATIC_LINKING=1 \
#		-DNO_HTTP_CLIENT=1 \
#		-DMINIMIZE_SIZE=ON \
#		-DCMAKE_VERBOSE_MAKEFILE=ON \
#		-DBUILD_SHARED_LIBS=OFF"
#	cmake $CMAKE_FLAGS ..
#
#	make ${MAKEFLAGS}
#}
#
#package() {
#	cd "${srcdir}/${pkgname}"
#
#	make -C build DESTDIR="${pkgdir}" install
#	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
#}
