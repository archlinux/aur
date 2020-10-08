# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-brotli
_pkgname=brotli
_gitcommit=e61745a6b7add50d380cfd7d3883dd6c62fc2c71
pkgver=1.0.9
pkgrel=3
pkgdesc='Brotli compression library (mingw-w64)'
arch=('any')
license=('MIT')
url='https://github.com/google/brotli'
depends=('mingw-w64-gcc')
makedepends=('mingw-w64-cmake' 'git')
options=('!buildflags' '!strip' 'staticlibs')
source=(${_pkgname}::"git+${url}#commit=${_gitcommit}")
sha512sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd ${_pkgname} 
  git describe --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/${_pkgname}
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec ${_arch}-strip --strip-all {} \;
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    if [[ $NO_EXECUTABLES ]]; then
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete
    fi
  done
  for file in "${pkgdir}"/usr/*/lib/pkgconfig/*.pc; do
    sed -i 's| -R${libdir}||g' "$file"
  done
}

# vim: ts=2 sw=2 et:
