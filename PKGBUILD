# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libmng
pkgver=2.0.3
pkgrel=2
pkgdesc="A collection of routines used to create and manipulate MNG format graphics files (mingw-w64)"
arch=(any)
depends=(mingw-w64-lcms2)
makedepends=(mingw-w64-cmake)
options=(staticlibs !buildflags !strip)
license=("custom")
url="http://www.libmng.com/"
source=("https://downloads.sourceforge.net/libmng/libmng-${pkgver}.tar.xz"{,.asc}
        "libmng-1.0.9-dont-leak-zlib-streams.diff"
        "libmng-1.0.10-mingw.patch"
        "no-undefined.patch"
        "libmng-2.0.3-cmake-versioning.patch"
        "fix-mng-version-cmake.patch"
        "pkg-config-extra-flags.patch")
sha256sums=('4a462fdd48d4bc82c1d7a21106c8a18b62f8cc0042454323058e6da0dbb57dd3'
            'SKIP'
            'e91c1f852fbbcecec40b365bc71c1b15346442018c92b41af0d29d32bfbbb895'
            'f21bd32a9e4453e1334aa32faea3a13c6829bb247ffc4a4c48c75c58769c94e3'
            '9ee540e6b375223285db286b0a04fc618d9f8d991bddd6a2ee1001fad16f3584'
            '5981d90392a4c7e7ad52e3720604f8158ac62420eec61f96e98a1b90a47631df'
            'f5c66278bceb8a252de265e0024953a364ac778d1e1b7f2c8ed45bc4db70f961'
            '6f64379c773d1b88af85ae9ac78259e1d32501eba39a8139a90d9399d9e70855')
validpgpkeys=('8048643BA2C840F4F92A195FF54984BFA16C640F')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libmng-${pkgver}"
  patch -p0 -i "$srcdir"/libmng-1.0.9-dont-leak-zlib-streams.diff
  patch -p1 -i "$srcdir"/libmng-1.0.10-mingw.patch
  patch -p1 -i "$srcdir"/no-undefined.patch
  patch -p1 -i "$srcdir"/libmng-2.0.3-cmake-versioning.patch
  patch -p1 -i "$srcdir"/fix-mng-version-cmake.patch
  patch -p1 -i "$srcdir"/pkg-config-extra-flags.patch
}

build() {
  cd "${srcdir}/libmng-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=RELEASE \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_STATIC_LIBS=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libmng-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/usr/${_arch}/share"
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
