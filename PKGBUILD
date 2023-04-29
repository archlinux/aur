# Maintainer: Tony Lambiris <tony@libpcap.net>
pkgname=aws-c-common-git
pkgver=0.8.19.r1.g9848a8cf
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

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	git submodule update --init --recursive --force --remote
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
