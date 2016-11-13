pkgname=mingw-w64-graphite
pkgver=1.3.9
pkgrel=1
arch=(any)
pkgdesc="reimplementation of the SIL Graphite text processing engine (mingw-w64)"
license=("LGPL" "GPL" "custom")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake python2)
options=(staticlibs !strip !buildflags)
url="https://github.com/silnrsi/graphite"
source=("https://github.com/silnrsi/graphite/releases/download/${pkgver}/graphite2-${pkgver}.tgz"
"001-graphite2-1.3.8-win64.patch"
"002-graphite2-1.2.1-pkgconfig.patch"
"003-graphite2-1.3.8-staticbuild.patch"
"004-graphite2-1.3.8-dllimport-fix.patch")
sha1sums=('0693e9eef87edf1792db247dd38794211666a1b9'
          '68c7b3c1c9e38f357a95e5b3b266d4afcfe78329'
          '4460d61e238892c421ae7771e3b36dc0b21d682c'
          'da2c20e50cd50a6cac422fd69459060a02311988'
          'd872ba0db6040865cfb1227e83f0f02cbdbe083a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd graphite2-$pkgver
	patch -p1 -i "${srcdir}"/001-graphite2-1.3.8-win64.patch
  patch -p1 -i "${srcdir}"/002-graphite2-1.2.1-pkgconfig.patch
  patch -p1 -i "${srcdir}"/003-graphite2-1.3.8-staticbuild.patch
  patch -p1 -i "${srcdir}"/004-graphite2-1.3.8-dllimport-fix.patch
  sed -i "s:\/usr\/bin\/python:\/usr\/bin\/python2:" tests/{corrupt.py,defuzz,fnttxtrender,fuzzbidi,fuzztest,hbspeeds,jsoncmp}
}

build() {
	cd graphite2-$pkgver
	for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DGRAPHITE2_COMPARE_RENDERER=OFF \
      ..
    make
    popd
  done
}

package() {
	for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}2-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
