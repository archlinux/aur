# Maintainer: Tony Lambiris <tony@libpcap.net>
pkgname=aws-checksums-git
pkgver=0.1.14.r1.g9a0ff99
pkgrel=1
pkgdesc="Cross-Platform HW accelerated CRC32c and CRC32 with fallback to efficient SW implementations."
arch=('x86_64')
conflicts=('aws-checksums')
provides=('aws-checksums')
url="https://github.com/awslabs/aws-checksums"
license=('Apache')
depends=('aws-c-common')
makedepends=('cmake' 'openssl' 'curl' 'zlib' 'libutil-linux')
source=("${pkgname}::git+https://github.com/awslabs/aws-checksums#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
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
