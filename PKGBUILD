# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-ncurses
pkgver=6.1
epoch=1
pkgrel=1
pkgdesc="System V Release 4.0 curses emulation library (mingw-w64)"
arch=('any')
url="https://www.gnu.org/software/ncurses/"
license=('MIT')
makedepends=('mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
depends=('mingw-w64-crt' 'mingw-w64-libsystre')
options=('!strip' '!buildflags' 'staticlibs')
source=("ncurses-${pkgver}.tar.gz"::"https://ftp.gnu.org/pub/gnu/ncurses/ncurses-${pkgver}.tar.gz"
        "001-use-libsystre.patch")
sha256sums=('aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17'
            'eb28949297a4c1eda67da49cfbed1d60f181b83101a0b3715552a4564bd90ff3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/ncurses-${pkgver}"
  patch -Np1 -i "${srcdir}/001-use-libsystre.patch"
}

build() {
  cd "${srcdir}/ncurses-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --without-ada \
      --with-cxx \
      --without-shared \
      --without-pthread \
      --enable-pc-files \
      --disable-rpath \
      --enable-colorfgbg \
      --enable-ext-colors \
      --enable-ext-mouse \
      --disable-symlinks \
      --enable-warnings \
      --enable-assertions \
      --disable-home-terminfo \
      --enable-database \
      --enable-sp-funcs \
      --enable-term-driver \
      --enable-interop \
      --enable-widec
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/ncurses-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    cp -R ${pkgdir}/usr/${_arch}/include/ncursesw ${pkgdir}/usr/${_arch}/include/ncurses
    cp ${pkgdir}/usr/${_arch}/lib/libncursesw.a ${pkgdir}/usr/${_arch}/lib/libncurses.a
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
