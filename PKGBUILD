pkgname=mingw-w64-fontconfig
pkgver=2.12.3
pkgrel=1
_commit=690f822a1b26b089d86e9843746cab80f3c07fe3  # tags/2.12.3^0
pkgdesc="A library for configuring and customizing font access (mingw-w64)"
arch=(any)
url="https://www.freedesktop.org/wiki/Software/fontconfig/"
license=("custom")
makedepends=(mingw-w64-configure git autoconf-archive gperf python-lxml python-six)
depends=(mingw-w64-expat mingw-w64-freetype2)
options=(staticlibs !strip !buildflags)
source=("git+https://anongit.freedesktop.org/git/fontconfig#commit=$_commit"
"0001-fix-config-linking.all.patch"
"0007-pkgconfig.mingw.patch")
sha256sums=('SKIP'
            '1266d4bbd8270f013fee2401c890f0251babf50a175a69d681d3a6af5003c899'
            'af373531873da46d0356305da5444c1ec74f443cd2635ea2db6b7dadd1561f5b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd fontconfig
  git describe --tags | sed 's/-/+/g'
}

prepare() {
	cd fontconfig
	patch -p1 -i ${srcdir}/0001-fix-config-linking.all.patch
	patch -p1 -i ${srcdir}/0007-pkgconfig.mingw.patch
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd fontconfig
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-arch=${_arch%-w64-mingw32} \
      --disable-docs
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/fontconfig/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
