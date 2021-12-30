pkgname=mingw-w64-rapidyaml
pkgver=0.3.0
pkgrel=1
pkgdesc='A library to parse and emit YAML, and do it fast (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='https://github.com/biojppm/rapidyaml'
license=('MIT')
source=("git+https://github.com/biojppm/rapidyaml.git#tag=v${pkgver}")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/rapidyaml
  git submodule update --force --init --recursive
  sed -i "s|Windows.h|windows.h|g" ext/c4core/src/c4/windows.hpp
}

build() {
  cd "$srcdir"/rapidyaml
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/rapidyaml/build-${_arch}
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
