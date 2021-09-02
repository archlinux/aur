# Maintainer: jakob <grandchild@gmx.net>

_pkgname=civetweb
pkgname=mingw-w64-$_pkgname
pkgver=1.15
pkgrel=1
pkgdesc="Embedded C/C++ web server (mingw-w64)"
arch=(any)
url="https://github.com/civetweb/civetweb"
license=("MIT")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake)
optdepends=("mingw-w64-openssl: SSL support")
options=(!strip staticlibs !buildflags)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/civetweb/civetweb/archive/v$pkgver.tar.gz")
sha256sums=('90a533422944ab327a4fbb9969f0845d0dba05354f9cacce3a5005fa59f593b9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    for _arch in ${_architectures}; do
        mkdir -p "${srcdir}/${_pkgname}-${pkgver}/output/build-${_arch}"
        cd "${srcdir}/${_pkgname}-${pkgver}/output/build-${_arch}"

        ${_arch}-cmake \
            -DWINSOCK_ROOT="/usr/${_arch}" \
            -DBUILD_SHARED_LIBS=YES \
            -DCIVETWEB_BUILD_TESTING=NO \
            -DCIVETWEB_ENABLE_WEBSOCKETS=YES \
            -DCIVETWEB_ENABLE_IPV6=YES \
            -DCIVETWEB_ENABLE_CXX=NO \
            -DCIVETWEB_ENABLE_SERVER_STATS=YES \
            -DCIVETWEB_SSL_OPENSSL_API_1_1=YES \
            "${srcdir}/${_pkgname}-${pkgver}"
        make \
            WITH_CPP=0 \
            WITH_IPV6=1 \
            WITH_WEBSOCKETS=1 \
            WITH_SERVER_STATS=1 \
            #
    done
}

# check() {
#     for _arch in ${_architectures}; do
#         cd "${srcdir}/${_pkgname}-${pkgver}/output/build-${_arch}"
#         make test
#     done
# }

package() {
    for _arch in ${_architectures}; do
        cd "${srcdir}/${_pkgname}-${pkgver}/output/build-${_arch}"
        ${_arch}-strip --strip-unneeded src/*.dll
        ${_arch}-strip -g src/*.dll.a
        make install DESTDIR="${pkgdir}"
    done
}
