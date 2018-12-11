#Contributor: mathieu.clabaut <mathieu.clabaut@gmail.com>

pkgname=gnatcoverage-git
pkgver=r4612.aefb23f8
pkgrel=1
pkgdesc="Source and object coverage analysis tool"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gnatcoverage"
license=('GPL3')
provides=('gnatcoverage')
conflict=()
makedepends=('git' 'gnatcoll-core-git' 'gcc-ada' 'binutils' 'valgrind'
'gnat_util')
depends=()
optdeps=()
source=(gnatcoverage::git://github.com/AdaCore/gnatcoverage
https://ftp.gnu.org/gnu/binutils/binutils-2.31.1.tar.xz)

md5sums=('SKIP')

prepare() {
  cd $srcdir/binutils-2.31.1

  ./configure \
    --prefix=/usr \
    --enable-targets=all\
    --disable-gdb \
    --disable-werror \
    --disable-sim \
    --disable-ld \
    --disable-lquadmath \
    --disable-readline \
    --without-zlib

  make
}

build() {
  cd $srcdir/gnatcoverage/tools/gnatcov
  # 
  sed -i -e 's/\(Pragma_Acc_.*\)/-- \1/' sc_obligations.ads
  make bin adapters VALGRIND_PREFIX=/usr \
                                  BINUTILS_SRC_DIR=$srcdir/binutils-2.31.1
}

package() {
  cd $srcdir/gnatcoverage/tools/gnatcov
  make PREFIX=$pkgdir/usr VALGRIND_PREFIX=$pkgdir/usr \
                                  install-bin install-examples \
                                  install-adapters
#  cd $srcdir/notifymuch
#  python setup.py install --root=$pkgdir || return 1
#  install -m755  -d $pkgdir/usr/share/icons/hicolor/512x512/apps/
#  install -m644  $srcdir/notifymuch.png $pkgdir/usr/share/icons/hicolor/512x512/apps/
#  install -m755 -d  $pkgdir/usr/share/applications/
#  install -m644 $srcdir/notifymuch.desktop  $pkgdir/usr/share/applications/
}

pkgver() {
  cd "gnatcoverage"
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

md5sums=('SKIP'
         '5b7c9d4ce96f507d95c1b9a255e52418'
         'SKIP')
md5sums=('SKIP'
         '5b7c9d4ce96f507d95c1b9a255e52418')
