# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Maintainer: Stefan Schmidt <thrimbor.github@gmail.com>

_target="powerpc-linux-gnu"
pkgname=${_target}-binutils
pkgver=2.46.0
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (${_target})"
arch=(i686 x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(glibc zlib)
options=(staticlibs !distcc !ccache)
source=(http://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz{,.sig})
validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F)
md5sums=('81bb6810bcd1119819dc0804956e1c92'
         'SKIP')

prepare() {
  mkdir -p binutils-build

  #cd binutils-gdb
  cd binutils-$pkgver

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-build

  "$srcdir/binutils-$pkgver/configure" \
	--target=$_target \
	--with-sysroot=/usr/$_target \
	--prefix=/usr \
	--disable-gprofng \
	--disable-multilib \
	--disable-werror \
	--with-gnu-as \
	--with-gnu-ld \
	--disable-nls \
	--enable-gold \
	--enable-ld=default \
	--enable-plugins \
	--enable-deterministic-archives \
       	--enable-new-dtags

  make
}


package() {
  cd binutils-build

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}

