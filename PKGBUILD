# Maintainer: Farzin Monsef <farzin [at] inphraz [dot] ir>

pkgname=lib60870
pkgver=2.3.4
pkgrel=1
pkgdesc="lib60870 library for IEC 60870-5 based protocols in C"
arch=('x86_64' 'i686')
url="https://www.mz-automation.de"
license=('GPLv3')
makedepends=('cmake' 'mbedtls')
_mbedtls_pkgver=3.6.2
_mbedtls_shortver=3.6
_mbedtls=mbedtls-${_mbedtls_pkgver}
_srcname=${pkgname}-${pkgver}/lib60870-C
source=("https://github.com/Mbed-TLS/mbedtls/releases/download/$_mbedtls/$_mbedtls.tar.bz2"
        "https://github.com/mz-automation/lib60870/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('8b54fb9bcf4d5a7078028e0520acddefb7900b3e66fec7f7175bb5b7d85ccdca'
            '09a2acd3241168c23e0d6653a0cde689d2b6f4b22d7c0e3b18b38c7a728ad77d')

prepare()
{
    # CMake automatically builds with TLS support if mbedtls is present.
    mv --force ${_mbedtls} ${_srcname}/dependencies/mbedtls-${_mbedtls_shortver}
}

build() {
    mkdir -p ${_srcname}/build
    cd ${_srcname}/build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTS=OFF

    make
}

#Install prefix set by cmake
package() {
    cd ${_srcname}/build
    make install
}
