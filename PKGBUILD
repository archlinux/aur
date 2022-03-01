# Maintainer: Tim Schumacher <timschumi@gmx.de>

_target=mipsr5900el-unknown-linux-gnu
pkgname=$_target-binutils
pkgver=2.34
pkgrel=3
pkgdesc="A set of programs to assemble and manipulate binary and object files ($_target)"
arch=(x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2{,.sig})
sha1sums=('361566c9ab5e90bd847d06f46fb9f18ec6c3ecf0'
          'SKIP')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F')  # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  cd binutils-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-$pkgver

  ./configure --target=$_target \
              --prefix=/usr \
              --disable-nls \
              --enable-shared \
              --enable-plugins \
              --enable-deterministic-archives

  make
}

check() {
  cd binutils-$pkgver
  
  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make -k LDFLAGS="" check || true
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*
  rm -r "$pkgdir"/usr/share/info
  rm "$pkgdir"/usr/lib/libctf*
  rm "$pkgdir"/usr/include/ctf{,-api}.h
}
