# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-hunspell
pkgver=1.7.0
pkgrel=2
pkgdesc="Spell checker and morphological analyzer library and program (mingw-w64)"
arch=(any)
url="https://hunspell.github.io/"
license=("GPL" "LGPL" "MPL")
makedepends=('mingw-w64-configure' 'mingw-w64-readline' 'mingw-w64-wine')
depends=('mingw-w64-gettext' 'mingw-w64-pdcurses' 'mingw-w64-readline')
options=(!strip !buildflags staticlibs !debug !emptydirs)
source=("hunspell-${pkgver}.tar.gz"::"https://github.com/hunspell/hunspell/archive/v${pkgver}.tar.gz"
        "01-relocate.patch"
        "02-fix-link-with-pdcurses.patch")
sha256sums=('bb27b86eb910a8285407cf3ca33b62643a02798cf2eef468c0a74f6c3ee6bc8a'
            'b3a978749ef723481286e6237944729b6965bc57eacc5407b5f7fedf7d6aa8a1'
            '260432a8f01525e83124c79e375cc9f0692b1a6c97773add4c69b8efe081cf1d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/hunspell-${pkgver}"

  # Remove files created by patch
  rm -rf src/tools/pathtools.cxx src/tools/pathtools.hxx
  patch -Np1 -i ${srcdir}/01-relocate.patch
  patch -Np1 -i ${srcdir}/02-fix-link-with-pdcurses.patch
  autoreconf -fiv
}

build() {
  cd "${srcdir}/hunspell-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CPPFLAGS+=" -I/usr/${_arch}/include/pdcurses" \
    CFLAGS+=" -I/usr/${_arch}/include/pdcurses" \
    CXXFLAGS+=" -I/usr/${_arch}/include/pdcurses" \
    ${_arch}-configure \
      --disable-rpath \
      --with-ui \
      --with-readline
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/hunspell-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    ln -s "/usr/${_arch}/lib/libhunspell-${pkgver%.*}.a" "$pkgdir/usr/${_arch}/lib/libhunspell.a"
    ln -s "/usr/${_arch}/lib/libhunspell-${pkgver%.*}.dll.a" "$pkgdir/usr/${_arch}/lib/libhunspell.dll.a"
  done
}
