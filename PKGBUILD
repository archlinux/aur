# Maintainer: Jean Pierre Cimalando <jp-dev@inbox.ru>

pkgname=mingw-w64-libuv0.10
_pkgname=libuv
pkgver=0.10.37
pkgrel=1
pkgdesc="Multi-platform support library with a focus on asynchronous I/O (legacy) (mingw-w64)"
arch=('any')
url="https://github.com/libuv/libuv"
license=('custom')
makedepends=('mingw-w64-gcc')
depends=('mingw-w64-crt')
provides=("mingw-w64-libuv=${pkgver}")
conflicts=("mingw-w64-libuv")
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/libuv/libuv/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'libuv.pc.in'
        'https://github.com/libuv/libuv/pull/2294.diff')
sha512sums=('02bfdd0c449effdb494c2441bb9e83f46dcc4c1cd77e7085593cffbe65233c31ac20e18706fc37659b7dd413014c77d3631d7008e40c80c11335bbe7bedafe4d'
            '9303ee2bbd7d5ee29fb80f3c157974a711c5103b97b0b37525f03f3b891117bc7db78c31cc30982de1764f7575b8db8397884204d47a4acbcfac9e5f9e34be5d'
            '8b177e7096f960ec449914b719c9cb9a9d2e67ea72e33cd778476bb2738da2f1949db8330a05f3dc68b5d2b850460a8658b6edad2eccec3e5380b576539f787b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/2294.diff"
}

build() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    cp -a "${_pkgname}-${pkgver}" build-${_arch}
    pushd build-${_arch}
    make PLATFORM=${_arch} PREFIX=${_arch}- CC=${_arch}-gcc
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    install -d "${pkgdir}/usr/${_arch}/lib/pkgconfig"
    cat "${srcdir}/libuv.pc.in" | sed "s/@ARCH@/${_arch}/g" | sed "s/@VERSION@/${pkgver}/g" > "${pkgdir}/usr/${_arch}/lib/pkgconfig/libuv.pc"
    cp -rf include "${pkgdir}/usr/${_arch}/"
    install -D -m644 libuv.a "${pkgdir}/usr/${_arch}/lib/libuv.a"
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/libuv.a"
  done
}
