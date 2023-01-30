# Maintainer: Qian Yicheng <qsp2020@outlook.com>

_target=x86_64-pc-openbsd7
pkgname=x86_64-pc-openbsd7-binutils
pkgver=2.40
pkgrel=2
pkgdesc='A set of programs to assemble and manipulate binary and object files for the FreeBSD target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib libelf)
source=(https://mirrors.ustc.edu.cn/gnu/binutils/binutils-$pkgver.tar.bz2)
sha1sums=('SKIP')
sha256sums=('SKIP')
#validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  cd binutils-$pkgver
#  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-$pkgver

  if [ "${CARCH}" != "i686" ];
  then
    # enabling gold linker at i686 makes the install fail
    enable_gold=''
  fi

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

  make -j$(nproc)
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
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so
  #rm "$pkgdir"/usr/etc/gprofng.rc
  #rm -r "$pkgdir"/usr/include
  #rm -r "$pkgdir"/usr/lib/gprofng/

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}
