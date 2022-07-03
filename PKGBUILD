# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libtre-git
pkgver=r128.6fb7206
pkgrel=2
arch=(any)
pkgdesc="The approximate regex matching library and agrep command line tool (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-gettext')
makedepends=('mingw-w64-configure' 'mingw-w64-pkg-config' 'git')
provides=('mingw-w64-libtre' 'mingw-w64-regex')
conflicts=('mingw-w64-libtre' 'mingw-w64-regex')
options=(!strip !buildflags staticlibs)
license=("BSD")
url="https://github.com/laurikari/tre"
source=("libtre"::"git+https://github.com/laurikari/tre.git#commit=6fb7206"
        001-autotools.patch
        002-pointer-cast.patch)
md5sums=('SKIP'
         '02e5246a85cec643b651527ad934f8da'
         'eb7c4c23c61b59bdb9a2257e13244110')

pkgver() {
  cd "$srcdir/libtre"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libtre"
  patch -p1 -i "${srcdir}/001-autotools.patch"
  patch -p1 -i "${srcdir}/002-pointer-cast.patch"
  mv ChangeLog{.old,}
  autoreconf -fiv
}

build() {
  cd "${srcdir}/libtre"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-shared \
      --enable-static \
      --without-libintl-prefix
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libtre/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    install -Dm644 "${srcdir}/libtre/LICENSE" "${pkgdir}/usr/${_arch}/share/licenses/libtre/LICENSE"
  done
}
