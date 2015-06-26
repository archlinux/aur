# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=codeviz
pkgver=1.0.12
_gccver=4.6.4
pkgrel=1
pkgdesc="A call graph generation utility for C/C++"
arch=('i686' 'x86_64')
url="http://www.csn.ul.ie/~mel/projects/codeviz/"
license=('GPL2')
depends=('perl' 'graphviz')
# unset the C(XX)FLAGS because they would break the compilation if they contained
# options not supported in $_gccver
options=('!buildflags')
source=(http://www.csn.ul.ie/~mel/projects/codeviz/codeviz-$pkgver.tar.gz \
        ftp://ftp.gnu.org/pub/gnu/gcc/gcc-$_gccver/gcc-${_gccver}.tar.gz)
noextract=(gcc-${_gccver}.tar.gz)
install=codeviz.install
md5sums=('31bb56aeccc8eefb24f23073bf523c48'
         'a8f15fc233589924ccd8cc8140b0ca3c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # disable problematic flags, solution by ftschindler from gcc46
  CPPFLAGS=${CPPFLAGS//-D_FORTIFY_SOURCE=?/}
  export CPPFLAGS
  CFLAGS=${CFLAGS//-fstack-protector-strong/-fstack-protector}
  export CFLAGS
  CXXFLAGS=${CXXFLAGS//-fstack-protector-strong/-fstack-protector}
  export CXXFLAGS

  # update for gcc 4.6.4 instead of 4.6.2
  find . -type f -exec sed -i 's|4\.6\.2|4\.6\.4|g' '{}' ';'
  mv compilers/install_gcc-4.6.2.sh compilers/install_gcc-${_gccver}.sh
  mv compilers/gcc-patches/gcc-4.6.2-cdepn.diff compilers/gcc-patches/gcc-${_gccver}-cdepn.diff

  # link the downloaded sources so the configure script doesn't download them again
  ln -sf "$SRCDEST/gcc-${_gccver}.tar.gz" compilers/gcc-${_gccver}.tar.gz

  ./configure --gcc=4.6.4 --prefix=/usr --gccgraph=/opt/gccgraph
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
