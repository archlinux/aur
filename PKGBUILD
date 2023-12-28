# Maintainer: Martchus <martchus@gmx.net>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=mingw-w64-jasper
pkgver=4.1.1
pkgrel=1
pkgdesc="A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard (mingw-w64)"
arch=(any)
url='https://www.ece.uvic.ca/~frodo/jasper/'
license=("custom:JasPer2.0")
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-libjpeg-turbo')
options=(staticlibs !strip !buildflags)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/mdadams/jasper/archive/version-${pkgver}.tar.gz
        0001-Fix-exports.patch
        0002-Fix-building-for-mingw-w64-target.patch)
sha512sums=('a15c196d7e448fb3c8b6512793d4b430e58ba6adf343b46392cac0880ae8c385cd75b43dd566c4a25baab983089cb95c00ae538dc0b84282cc98f2a9ce398d43'
            'ffa3b51509c626ba7e93375161c2d8d80fe27b54601a1f66bd93032f7c5d2125d8f3d7f8a48701ee9c7422c79035f769f8dd032242475d3628bbf2da27cdcf00'
            '643020a9f930d4bff0ea73f24c0801910b9bf34e5cc2feb9adbaf4b74965dd38739b957153393468f7d1d87c88232364ae5d3087e17c99b0f7c194febc825355')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/jasper-version-$pkgver"
  patch -p1 -i "${srcdir}"/0001-Fix-exports.patch
  patch -p1 -i "${srcdir}"/0002-Fix-building-for-mingw-w64-target.patch
}

build() {
  local options=(
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_BUILD_TYPE=Release
    -DJAS_ENABLE_OPENGL=OFF
    -DJAS_ENABLE_LIBJPEG=ON
    -DJAS_ENABLE_AUTOMATIC_DEPENDENCIES=OFF
    -DCMAKE_SKIP_RPATH=ON
    -DJAS_ENABLE_DOC=OFF
    -DJAS_STDC_VERSION=201112L
  )
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake ${options[@]} -DJAS_ENABLE_SHARED=OFF "$srcdir/jasper-version-$pkgver"
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ${options[@]} -DJAS_ENABLE_SHARED=ON "$srcdir/jasper-version-$pkgver"
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    if [[ $NO_EXECUTABLES ]]; then
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete
    fi
  done
}

# vim: ts=2 sw=2 et:
