# Maintainer in AUR: drakkan <nicola.murino at gmail dot com>

# This version includes the static library as well (in contrast
# to the version found in the AUR).

pkgname=mingw-w64-brotli
_pkgname=brotli
pkgver=1.2.1
pkgrel=1
pkgdesc='Brotli compression library (mingw-w64)'
arch=('any')
license=('MIT')
url='https://github.com/google/brotli.git'
depends=('mingw-w64-gcc')
makedepends=('mingw-w64-cmake' 'git')
options=('!buildflags' '!strip' 'staticlibs')
source=(${_pkgname}::"git+${url}#tag=v${pkgver}")
sha512sums=('5b75c0bd67e47441aac8d8e67b4f2416f06c2f5e4fb09f1f213ccf313d00a9d08dfda42d59f5133884f980ea712509bbc6f26f4e942316352eb4150b2f16e964')

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
