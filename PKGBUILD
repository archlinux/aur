# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-ncurses
pkgver=6.2
epoch=1
pkgrel=1
pkgdesc="System V Release 4.0 curses emulation library (mingw-w64)"
arch=('any')
url="https://www.gnu.org/software/ncurses/"
license=('MIT')
makedepends=('mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
depends=('mingw-w64-crt' 'mingw-w64-libgnurx')
options=('!strip' '!buildflags' 'staticlibs')
source=("ncurses-${pkgver}.tar.gz"::"https://ftp.gnu.org/pub/gnu/ncurses/ncurses-${pkgver}.tar.gz"
        "001-use-libsystre.patch")
sha256sums=('30306e0c76e0f9f1f0de987cf1c82a5c21e1ce6568b9227f7da5b71cbea86c9d'
            '46a084b47458366877a0cf59f73ad3a05c944fa9db16fec4aa21e3f0d5237e20')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/ncurses-${pkgver}"
  patch -N -i "${srcdir}/001-use-libsystre.patch"
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
