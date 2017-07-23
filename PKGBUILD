# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=mingw-w64-xlnt-git
pkgver=0.9.5.r1024.9f9dfe7
pkgrel=1
pkgdesc='Cross-platform user-friendly xlsx library for C++14 (mingw-w64)'
url='https://github.com/tfussell/xlnt'
arch=('any')
license=('MIT')
makedepends=('git' 'mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('mingw-w64-xlnt')
provides=('mingw-w64-xlnt')
source=("git://github.com/tfussell/xlnt.git")
sha512sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd xlnt
  echo "$(grep project source/CMakeLists.txt | cut -d '(' -f2 | cut -d ')' -f1 | cut -d ' ' -f3).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DTESTS=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      ../xlnt
    make
    popd
  done
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DTESTS=OFF \
      -DSTATIC=ON \
      -DCMAKE_BUILD_TYPE=Release \
      ../xlnt
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
