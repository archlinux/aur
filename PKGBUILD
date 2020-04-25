pkgname=mingw-w64-h5hut
pkgver=2.0.0rc6
pkgrel=1
pkgdesc='High-Performance I/O Library for Particle-based Simulations (mingw-w64)'
url='https://gitlab.psi.ch/H5hut/src/wikis/home'
arch=('any')
license=('BSD')
depends=('mingw-w64-hdf5' 'mingw-w64-zlib')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://gitlab.psi.ch/H5hut/src/-/archive/H5hut-${pkgver}/src-H5hut-${pkgver}.tar.gz")
sha256sums=('ca09b2b0637966f8b48572610071549fe874accc83caaf5c1e45a21eddf09a6f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/src-H5hut-${pkgver}"
  ./autogen.sh
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CFLAGS="-DH5_USE_110_API" ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/src-H5hut-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
