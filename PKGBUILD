# Maintainer: Martin Zeller <mz DOT bremerhaven AT gmail DOT com>

_target="arm-linux-gnueabihf"
_pkgname=ncurses
pkgname=${_target}-${_pkgname}
pkgver=6.0
pkgrel=2
_gccver=6.1.1
pkgdesc="System V Release 4.0 curses emulation library (${_target})"
arch=('i686' 'x86_64')
url='http://invisible-island.net/ncurses/ncurses.html'
license=('MIT')
depends=('arm-linux-gnueabihf-glibc')
makedepends=("${_target}-gcc" 'glibc' 'gcc-libs')
source=(ftp://invisible-island.net/ncurses/ncurses-${pkgver/_/-}.tar.gz{,.asc})
options=('!strip')
md5sums=('ee13d052e1ead260d7c28071f46eefb1'
         'SKIP')
validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB')  # Thomas Dickey
_sysroot="/usr/lib/gcc/${_target}/${_gccver}"

build() {
  cd ${_pkgname}-${pkgver/_/-}

  export CFLAGS="-O2 -pipe -fstack-protector-strong"
  export CXXFLAGS=${CFLAGS}
  #export TARGET=${_target}
  export BUILD_CC='gcc'
  export CC="${_target}-gcc"
  export LD="${_target}-ld"
  export AS="${_target}-as"

  ./configure --prefix=${_sysroot} --target=${_target} --host=${_target} \
     --with-shared --with-normal --without-debug \
	 --without-ada --enable-widec --enable-pc-files --with-cxx-binding \
	 --with-cxx-shared --enable-ext-colors --enable-ext-mouse --enable-overwrite
  make
}

package() {
  export CFLAGS="-O2 -pipe -fstack-protector-strong"
  export CXXFLAGS=${CFLAGS}
  
  cd ${_pkgname}-${pkgver/_/-}
  make DESTDIR="$pkgdir" install

  # I have no idea why it ends up in /usr/share...
  mv "$pkgdir/usr/share/pkgconfig" "$pkgdir${_sysroot}/lib"

  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in ncurses ncurses++ form panel menu; do
    echo "INPUT(-l${lib}w)" > "$pkgdir${_sysroot}"/lib${lib}.so
    ln -s ${lib}w.pc "$pkgdir${_sysroot}"/lib/pkgconfig/${lib}.pc
  done

  # some packages look for -lcurses during build
  echo "INPUT(-lncursesw)" > "$pkgdir${_sysroot}"/lib/libcursesw.so
  ln -s libncurses.so "$pkgdir${_sysroot}"/lib/libcurses.so

  # install license, rip it from the readme
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  grep -B 100 '$Id' README > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
