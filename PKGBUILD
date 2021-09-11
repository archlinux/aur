# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-npth
_pkgname=npth
pkgver=1.6
pkgrel=1
pkgdesc="New portable threads library (mingw-w64)"
arch=('any')
url="http://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git"
license=('LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs' '!libtool')
source=("ftp://ftp.gnupg.org/gcrypt/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"{,.sig})
sha256sums=('1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  # link ssp (needed because mingw env's -fstack-protection)
  export LDFLAGS="${LDFLAGS} -lssp"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    # create ${pkgdir}/usr/${_arch} dir, or install will complain due to def file not being installed
    mkdir -p ${pkgdir}/usr/${_arch}/{bin,include,lib}
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
