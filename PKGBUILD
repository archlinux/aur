# Maintainer: Farzin Monsef <farzin [at] inphraz [dot] ir>
# Contributor: Henrik Juul Pedersen <henrikjuul AT gmail>

pkgname=libiec61850
pkgver=1.6.1
pkgrel=1
pkgdesc="libIEC61850 provides a server and client library for IEC 61850"
arch=('x86_64' 'i686')
url="http://libiec61850.com/"
license=('GPLv3')
makedepends=('cmake')
_mbedtls_pkgver=3.6.0
_mbedtls=mbedtls-${_mbedtls_pkgver}
_srcname=${pkgname}-${pkgver}
source=("https://github.com/Mbed-TLS/mbedtls/archive/refs/tags/v$_mbedtls_pkgver.tar.gz"
        "https://github.com/mz-automation/libiec61850/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('32c500e73ee878e193e7d66bf5e4c34fb42bb968a6c9f9488aa466b16f6f3bff'
            '64113483eea8aec4f18cef9f8bb3c872585b2c67566824c4373db257bcc7bf8e')

prepare()
{
    # CMake automatically builds with TLS support if mbedtls is present.
    mv --force ${_mbedtls} ${_srcname}/third_party/mbedtls/
}

build() {
    mkdir -p ${_srcname}/build
    cd ${_srcname}/build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ \
        -DBUILD_EXAMPLES=OFF

    make
}

#Install prefix set by cmake
package() {
    cd ${_srcname}/build
    make install
}
