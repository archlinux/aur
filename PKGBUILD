# Maintainer: Martchus <martchus@gmx.net>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=mingw-w64-jasper
pkgver=3.0.4
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
        0002-Fix-building-for-mingw-w64-target.patch
        0003-Fix-filename-buffer-overflow.patch)
sha512sums=('1846d5c5c263ea9f3279a33e9be50350d2e91ea91271af5e6423b3fd87e069abc51290196f0e4ef72e54b0e727171d66562c0b855396afbed06dc9b0bb7bef04'
            '0eb2588a54e154ca93977088a63b7261bed605047e51ae0e9d537b0abbb5846a94f47f3e5df7cfd753d12c80273b922c74a752578938d3ba4da81f3b756b0ffb'
            'bd61f586bc910fd698d5f3e66a7892a63ee85eabc6c2802672d607d1b7b3fda6e412973f5bcc7b47db2c80b3c627f679dd45cbe2d13b08f8520314d4d29e2468'
            '31d900b6c160205151cbfac9f36fa0e5243dc87b0b8eab159cfa0b6935d87dd08119a52a0f853e6c2f3f754ca6c0030ec229379deb68ba16befd5f99983112ad')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/jasper-version-$pkgver"
  patch -p1 -i "${srcdir}"/0001-Fix-exports.patch
  patch -p1 -i "${srcdir}"/0002-Fix-building-for-mingw-w64-target.patch
  patch -p1 -i "${srcdir}"/0003-Fix-filename-buffer-overflow.patch
}

build() {
  cd "$srcdir/jasper-version-$pkgver"
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
    ${_arch}-cmake ${options[@]} -DJAS_ENABLE_SHARED=OFF ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ${options[@]} -DJAS_ENABLE_SHARED=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/jasper-version-${pkgver}/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/jasper-version-${pkgver}/build-${_arch}"
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
