# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=qcc
pkgver=0.7
pkgrel=1
epoch=1
pkgdesc="C Library and tools used to communicate with Crypta Labs QRNG devices."
arch=(x86_64)
url="https://cryptalabs.com/qrng-driver-downloads/"
license=(LicenseRef-unknown)
depends=(glibc)
makedepends=(cmake)
source=(
    $pkgname-$pkgver.tar.gz::https://cryptalabs.com/support/releases/qcc/source/qcc-source.zip
    license-unknown.txt
)
b2sums=('8aae2a1827eeac05e5337a6035e06a595c49003ab85c433af3700045efc54010e0ebed99d467378f105a19b0342b5fca0bb3787c623b832a9b78ebf1c3ea5539'
        '900dfce730c0f29b0cd5fafdf5ed6bc08a3ca245c3bbee12878c7e183951e0a55e33205da747d1666baded6133473fa8506dea252a2bc23f6f7555ebfa500d54')

pkgver() {
    version=$(grep QCC_VERSION $pkgname/qcc.h | cut -d " " -f 3)
    major=$((16#${version:2:5}))
    minor=$((16#${version:5}))
    echo $major.$minor
}

prepare() {
    # Remove insecure RUNPATH
    sed -i '3 a set(CMAKE_SKIP_RPATH TRUE)' $pkgname/CMakeLists.txt
}

build() {
    cmake -B build -S $pkgname \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    install -D -m0755 build/qcc-cli "$pkgdir"/usr/bin/qcc-cli
    install -D -m0755 build/libqcc.so "$pkgdir"/usr/lib/libqcc.so
    install -D -m0644 $pkgname/qcc.h "$pkgdir"/usr/include/qcc/qcc.h
    install -D -m0644 $pkgname/qcc_errno.h "$pkgdir"/usr/include/qcc/qcc_errno.h
    install -D -m0644 $pkgname/QCC.md "$pkgdir"/usr/share/doc/qcc/README.md
    install -D -m0644 license-unknown.txt "$pkgdir"/usr/share/licenses/$pkgname/license-unknown.txt
}
