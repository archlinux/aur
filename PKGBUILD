# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-ncurses
_base_ver=6.1
_date_rev=20180908
pkgver=${_base_ver}.${_date_rev}
pkgrel=1
pkgdesc="System V Release 4.0 curses emulation library (mingw-w64)"
arch=('any')
url="https://www.gnu.org/software/ncurses/"
license=('MIT')
makedepends=('mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
depends=('mingw-w64-crt' 'mingw-w64-libsystre')
options=('!strip' '!buildflags' 'staticlibs')
source=("ncurses-${pkgver}.tar.gz"::"https://invisible-mirror.net/archives/ncurses/current/ncurses-${_base_ver}-${_date_rev}.tgz"
        001-use-libsystre.patch)
md5sums=('3b3bbfadd7ef719a0082788132cff8cb'
         'b669861903d0699b6535b7c6e028880d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/ncurses-${_base_ver}-${_date_rev}"
  patch -Np1 -i "${srcdir}/001-use-libsystre.patch"
}

build() {
  cd "${srcdir}/ncurses-${_base_ver}-${_date_rev}"
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
    cd "${srcdir}/ncurses-${_base_ver}-${_date_rev}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    cp -R ${pkgdir}/usr/${_arch}/include/ncursesw ${pkgdir}/usr/${_arch}/include/ncurses
    cp ${pkgdir}/usr/${_arch}/lib/libncursesw.a ${pkgdir}/usr/${_arch}/lib/libncurses.a
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
