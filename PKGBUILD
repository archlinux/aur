# Maintainer: jakob <grandchild@gmx.net>

_pkgname=civetweb
pkgname=mingw-w64-$_pkgname
pkgver=1.16
pkgrel=2
pkgdesc="Embedded C/C++ web server (mingw-w64)"
arch=(any)
url="https://github.com/civetweb/civetweb"
license=("MIT")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake)
optdepends=("mingw-w64-openssl: SSL support")
options=(!strip staticlibs !buildflags)
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/civetweb/civetweb/archive/v$pkgver.tar.gz"
    0001-Add-cast-for-interlockedincrement-for-32bit.patch
)
sha256sums=(
    f0e471c1bf4e7804a6cfb41ea9d13e7d623b2bcc7bc1e2a4dd54951a24d60285
    1a9e332cd695365b16d2c6240c4b801df8781e698d96c514117c7afda8d15bb8
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p0 < ../0001-Add-cast-for-interlockedincrement-for-32bit.patch

    for _arch in ${_architectures}; do
        mkdir -p "${srcdir}/${_pkgname}-${pkgver}/output/${_arch}"
        cd "${srcdir}/${_pkgname}-${pkgver}/output/${_arch}"

        ${_arch}-cmake \
            -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
            -DWINSOCK_ROOT="/usr/${_arch}" \
            -DCIVETWEB_ENABLE_CXX=YES \
            -DBUILD_SHARED_LIBS=YES \
            -DCIVETWEB_BUILD_TESTING=NO \
            -DCIVETWEB_ENABLE_WEBSOCKETS=YES \
            -DCIVETWEB_ENABLE_SERVER_STATS=YES \
            -DCIVETWEB_SSL_OPENSSL_API_1_1=YES \
            "${srcdir}/${_pkgname}-${pkgver}" \
            #
        make
    done
}

# check() {
#     for _arch in ${_architectures}; do
#         cd "${srcdir}/${_pkgname}-${pkgver}/output/${_arch}"
#         make test
#     done
# }

package() {
    for _arch in ${_architectures}; do
        cd "${srcdir}/${_pkgname}-${pkgver}/output/${_arch}"
        ${_arch}-strip --strip-unneeded src/*.dll
        ${_arch}-strip -g src/*.dll.a
        make install DESTDIR="${pkgdir}"
    done
}
