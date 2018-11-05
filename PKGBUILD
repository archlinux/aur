# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>
pkgname=mingw-w64-pteros-stable
pkgver=1
pkgrel=1
pkgdesc="C++ library for molecular modeling. (mingw-w64)"
arch=('any')
url='https://github.com/yesint/pteros'
license=('Artistic License 2.0')
depends=('mingw-w64-crt' 'mingw-w64-boost' 'mingw-w64-eigen')
makedepends=('mingw-w64-cmake' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgname%-stable}"'::git+https://github.com/yesint/pteros.git#branch=master')
sha1sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/${pkgname%-stable}"
  git checkout tags/v${pkgver}-stable
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DWITH_PYTHON=OFF -DWITH_OPENBABEL=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname%-stable}/build-${_arch}"
    make DESTDIR="${pkgdir}" install 
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
 
pkgver() {
  cd "$srcdir/${pkgname%-stable}"
  git tag --sort=-creatordate | grep 'stable' | head -n1 | sed 's/-stable//g; s/^v//g'
}
