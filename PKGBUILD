# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-brotli
_pkgname=brotli
_gitcommit=ed738e842d2fbdf2d6459e39267a633c4a9b2f5d
pkgver=1.1.0
pkgrel=2
pkgdesc='Brotli compression library (mingw-w64)'
arch=('any')
license=('MIT')
url='https://github.com/google/brotli.git'
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
    ${_arch}-cmake -DBUILD_SHARED_LIBS=ON ..
    make
    popd
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=/usr/$_arch/static ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    make -C "${srcdir}/${_pkgname}/build-${_arch}-static" DESTDIR="${pkgdir}" install
    make -C "${srcdir}/${_pkgname}/build-${_arch}" DESTDIR="${pkgdir}" install
    ln -s --verbose --relative --target-directory="$pkgdir"/usr/${_arch}/lib "$pkgdir"/usr/${_arch}/static/lib/*.a
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
