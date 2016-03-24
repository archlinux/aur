# Maintainer: camb <cyrilbur@gmail.com>
# The aarch64-linux-gnu PKGBUILD was used as a template for this PKGBUILD

_target=powerpc64-linux-gnu
pkgname=$_target-binutils
pkgver=2.25.1
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the powerpc64 target'
arch=(i686 x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(glibc)
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2)
sha256sums=('b5b14added7d78a8d1ca70b5cb75fef57ce2197264f4f5835326b0df22ac9f22')

prepare() {
  cd binutils-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-$pkgver
  ./configure --target=$_target \
              --enable-targets=powerpc64-linux,powerpc64le-linux \
              --program-prefix=$_target- \
              --prefix=/usr \
              --enable-shared \
              --disable-multilib \
              --disable-nls \
              --with-lib-path=/usr/lib/binutils/$_target \
              --with-local-prefix=/usr/lib/$_target \
              --with-sysroot=/usr/$_target \
              --disable-werror

  make configure-host
  make
}

check() {
  cd binutils-$pkgver
  #Tests don't appear to do anything. Will look into it
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,nlmconv,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -rf "$pkgdir"/usr/share/info
}
