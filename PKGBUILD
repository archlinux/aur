# Maintainer: Farzin Monsef <farzin [at] inphraz [dot] ir>

pkgname=lib60870
pkgver=2.3.2
pkgrel=1
pkgdesc="lib60870 library for IEC 60870-5 based protocols in C"
arch=('x86_64' 'i686')
url="https://www.mz-automation.de"
license=('GPLv3')
makedepends=('mbedtls')
_mbedtls_pkgver=2.28.3
_mbedtls_shortver=2.28
_mbedtls=mbedtls-${_mbedtls_pkgver}
_srcname=${pkgname}-${pkgver}/lib60870-C
source=("https://github.com/Mbed-TLS/mbedtls/archive/refs/tags/v$_mbedtls_pkgver.tar.gz"
    "https://github.com/mz-automation/lib60870/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('bdf7c5bbdc338da3edad89b2885d4f8668f9a6fffeba6ec17a60333e36dade6f'
    'c63f170dc2dd25f7ec85d873be522f23d46838a84b072c8afda4118dfd5fc94d')

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
