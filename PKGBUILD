# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=lib32-ncurses-git
pkgver=6.2
pkgrel=1
pkgdesc="System V Release 4.0 curses emulation library (32-bit)"
arch=('x86_64')
url="https://www.gnu.org/software/ncurses/"
license=('MIT')
depends=('lib32-glibc' 'ncurses')
provides=(lib32-ncurses)
conflicts=(lib32-ncurses)
source=(git+https://github.com/ThomasDickey/ncurses-snapshots.git)
sha512sums=('SKIP')

pkgver() {
  cd "ncurses-snapshots"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

build() {
  cd ncurses-snapshots

  export CC="gcc -m32"
  export CXX="g++ -m32"

  ./configure --prefix=/usr --mandir=/usr/share/man \
     --with-pkg-config-libdir=/usr/lib32/pkgconfig \
     --with-shared --with-normal --without-debug --without-ada \
     --enable-widec --libdir=/usr/lib32 --with-manpage-format=normal
  make
}

package() {
  cd ncurses-snapshots
  make DESTDIR="${pkgdir}" install

  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in curses ncurses form panel menu; do
    echo "INPUT(-l${lib}w)" >"${pkgdir}"/usr/lib32/lib${lib}.so
    ln -sf lib${lib}w.a "${pkgdir}"/usr/lib32/lib${lib}.a
  done
  ln -sf libncurses++w.a "${pkgdir}"/usr/lib32/libncurses++.a

  for lib in tic tinfo; do
    echo "INPUT(libncursesw.so.${pkgver:0:1})" > "${pkgdir}/usr/lib32/lib${lib}.so"
    ln -s libncursesw.so.${pkgver:0:1} "${pkgdir}/usr/lib32/lib${lib}.so.${pkgver:0:1}"
  done

  # some packages look for -lcurses during build
  rm -f "${pkgdir}"/usr/lib32/libcursesw.so
  echo "INPUT(-lncursesw)" >"${pkgdir}"/usr/lib32/libcursesw.so
  ln -sf libncurses.so "${pkgdir}"/usr/lib32/libcurses.so
  ln -sf libncursesw.a "${pkgdir}"/usr/lib32/libcursesw.a
  ln -sf libncurses.a "${pkgdir}"/usr/lib32/libcurses.a

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "${pkgdir}/usr/share/licenses"
  ln -s lib32-ncurses "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: set et ts=2 sw=2:
