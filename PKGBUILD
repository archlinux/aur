# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=aws-c-io-git
pkgver=0.13.21.r3.g4dc663c0
pkgrel=1
pkgdesc='AWS SDK module to handle all IO and TLS work for application protocols'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-io'
license=(Apache)
depends=(aws-c-common aws-c-cal s2n-tls)
makedepends=(cmake)
conflicts=(aws-c-io)
provides=(aws-c-io)
source=("${pkgname}::git+https://github.com/awslabs/aws-c-io#branch=main")
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

    cmake --build build --target install -- DESTDIR="$pkgdir/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
