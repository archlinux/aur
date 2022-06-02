# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=aws-sdk-cpp-git
pkgver=1.9.270.r0.g3c6705ee29
pkgrel=1
pkgdesc='AWS SDK for C++'
arch=(x86_64)
url='https://github.com/aws/aws-sdk-cpp'
license=(Apache)
depends=(openssl curl zlib util-linux-libs aws-c-common aws-c-event-stream libpulse aws-crt-cpp)
makedepends=(cmake ninja)
conflicts=(aws-sdk-cpp)
provides=(aws-sdk-cpp)
source=("${pkgname}::git+https://github.com/aws/aws-sdk-cpp#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
	cd "${srcdir}/${pkgname}"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCUSTOM_MEMORY_MANAGEMENT=OFF -DENABLE_TESTING=OFF -DBUILD_DEPS=OFF \
        -DCMAKE_MODULE_PATH=/usr/lib/cmake \
        -S . -B build -G Ninja
    ninja -C build -j 2 # the build is so heavy that it gets OOM killed even at powerful machines
}

package() {
	cd "${srcdir}/${pkgname}"

    DESTDIR="${pkgdir}" ninja -C build install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
