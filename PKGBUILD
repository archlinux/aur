# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=codeviz
pkgver=1.0.12
_pkgver=8e597959959c4e812742e9d68c1ea4c4db63a39d
_gccver=4.6.4
pkgrel=2
pkgdesc="A call graph generation utility for C/C++"
arch=('i686' 'x86_64')
url="https://github.com/petersenna/codeviz"
license=('GPL2')
depends=('perl' 'graphviz')
# unset the C(XX)FLAGS because they would break the compilation if they contained
# options not supported in $_gccver
options=('!buildflags')
source=("$pkgname-$pkgver.tar.gz::https://github.com/petersenna/codeviz/archive/$_pkgver.tar.gz"
        ftp://ftp.gnu.org/pub/gnu/gcc/gcc-$_gccver/gcc-${_gccver}.tar.gz
        autopatch.diff gcc-$_gccver-disable_texinfo.diff)
noextract=(gcc-${_gccver}.tar.gz)
install=codeviz.install
md5sums=('d74dbb67020f3508e9a75e22486bc443'
         'a8f15fc233589924ccd8cc8140b0ca3c'
         'e7065b30ef76518d3e8936b124289da4'
         '37f408fb79cd87f15d1a0fa4574e29c8')

prepare() {
  cd "$srcdir/$pkgname-$_pkgver"

  # modify the script for building gcc to automatically apply patches
  patch -Np1 < "$srcdir/autopatch.diff"

  # add patch to disable building of documentation
  ln -sf "$srcdir/gcc-$_gccver-disable_texinfo.diff" compilers/gcc-patches/

  # update for gcc 4.6.4 instead of 4.6.2
  find . -type f -exec sed -i 's|4\.6\.2|4\.6\.4|g' '{}' ';'
  mv compilers/install_gcc-4.6.2.sh compilers/install_gcc-${_gccver}.sh
  mv compilers/gcc-patches/gcc-4.6.2-cdepn.diff compilers/gcc-patches/gcc-${_gccver}-cdepn.diff

  # link the downloaded sources so the configure script doesn't download them again
  ln -sf "$SRCDEST/gcc-${_gccver}.tar.gz" compilers/gcc-${_gccver}.tar.gz
}

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  # disable problematic flags, solution by ftschindler from gcc46
  CPPFLAGS=${CPPFLAGS//-D_FORTIFY_SOURCE=?/}
  export CPPFLAGS
  CFLAGS=${CFLAGS//-fstack-protector-strong/-fstack-protector}
  export CFLAGS
  CXXFLAGS=${CXXFLAGS//-fstack-protector-strong/-fstack-protector}
  export CXXFLAGS

  # link the downloaded sources so the configure script doesn't download them again
  ln -sf "$SRCDEST/gcc-${_gccver}.tar.gz" compilers/gcc-${_gccver}.tar.gz

  ./configure --gcc=4.6.4 --prefix=/usr --gccgraph=/opt/gccgraph
  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
