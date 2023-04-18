# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_target=powerpc64-linux-gnu
pkgname=$_target-binutils
pkgver=2.39
pkgrel=2
pkgdesc='A set of programs to assemble and manipulate binary and object files for the PPC64 target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib libelf)
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2{,.sig})
sha1sums=('d9028547385694d61d98fb4e2882a2b9c40ce7e9'
          'SKIP')
sha256sums=('da24a84fef220102dd24042df06fdea851c2614a5377f86effa28f33b7b16148'
            'SKIP')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  cd binutils-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-$pkgver

  if [ "${CARCH}" != "i686" ];
  then
    # enabling gold linker at i686 makes the install fail
    enable_gold='--enable-gold'
  fi
  echo $CC
  echo $CXX
  ./configure --target=$_target \
              --with-sysroot=/usr/$_target \
              --prefix=/usr \
              --disable-multilib \
              --with-gnu-as \
              --with-gnu-ld \
              --disable-nls \
              --enable-ld=default \
              $enable_gold \
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
  rm -f "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*
  rm -f "$pkgdir"/usr/lib/bfd-plugins/libdep.so
  rm -f "$pkgdir"/usr/etc/gprofng.rc
  rm -rf "$pkgdir"/usr/include
  rm -rf "$pkgdir"/usr/lib/gprofng/

  # Remove info documents that conflict with host version
  rm -rf "$pkgdir"/usr/share/info
}
