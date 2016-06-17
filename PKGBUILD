pkgname=mingw-w64-fontconfig
pkgver=2.12.0
pkgrel=2
pkgdesc="A library for configuring and customizing font access (mingw-w64)"
arch=(any)
url="http://www.fontconfig.org/release"
license=("custom")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-expat mingw-w64-freetype2)
options=(staticlibs !strip !buildflags)
source=("http://www.fontconfig.org/release/fontconfig-$pkgver.tar.bz2"
"0001-fix-config-linking.all.patch"
"0007-pkgconfig.mingw.patch")
sha256sums=('b433e4efff1f68fdd8aac221ed1df3ff1e580ffedbada020a703fe64017d8224'
            '1266d4bbd8270f013fee2401c890f0251babf50a175a69d681d3a6af5003c899'
            'af373531873da46d0356305da5444c1ec74f443cd2635ea2db6b7dadd1561f5b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd fontconfig-$pkgver
	patch -p1 -i ${srcdir}/0001-fix-config-linking.all.patch
	patch -p1 -i ${srcdir}/0007-pkgconfig.mingw.patch
	autoreconf -fi
}

build() {
	cd fontconfig-$pkgver
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-arch=${_arch%-w64-mingw32}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/fontconfig-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.def' | xargs rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/"{etc,share}
  done
}
