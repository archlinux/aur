# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: armv7l-binutils -> armv7l-linux-api-headers -> armv7l-gcc-bootstrap -> armv7l-glibc -> armv7l-gcc -> armv7l-glibc (again)

_arch=armv7l
_target=$_arch-unknown-linux-gnueabihf
pkgname=$_arch-glibc
pkgver=2.34
pkgrel=1
_commit=be176490b818b65b5162c332eb6b581690b16e5c
pkgdesc="GNU C Library ARM (32bit) target"
arch=(any)
url='https://www.gnu.org/software/libc/'
license=('GPL' 'LGPL')
depends=()
makedepends=($_arch-gcc $_arch-linux-api-headers)
options=(!strip staticlibs)
source=(https://ftp.gnu.org/gnu/libc/glibc-$pkgver.tar.xz{,.sig})
sha256sums=('44d26a1fe20b8853a48f470ead01e4279e869ac149b195dda4e44a195d981ab2'
            'SKIP')
validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8  # "Carlos O'Donell <carlos@systemhalted.org>"
              BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar

build() {
  mkdir -p glibc-build
  cd glibc-build

  echo "build-programs=no" > configparms
  echo "cross-compiling=yes" >> configparms
  echo "slibdir=/usr/lib" >> configparms
  echo "rtlddir=/usr/lib" >> configparms

  #hack - Having CPPFLAGS defined makes the build barf. Workaround it like this:
  unset CFLAGS 
  
  "$srcdir"/glibc-$pkgver/configure \
      --prefix=/usr \
      --host=$_target \
      --libdir=/usr/lib \
      --with-bugurl=https://bugs.archlinux.org \
      --enable-kernel=5.10 \
      --enable-bind-now \
      --enable-stack-protector=strong \
      --enable-stackguard-randomization \
      --disable-timezone-tools \
      --enable-multi-arch CFLAGS="-O2 -pipe" 

  make
}

package() {
  cd glibc-build
  make DESTDIR="$pkgdir"/usr/$_target/sys-root install 

  #we don't want static libraries. Only keep the one that we really need.
  find "$pkgdir"/usr/$_target/sys-root  -name '*.a' -and -not -name libc_nonshared.a -delete
  
  #Remove files we don't need in a cross compilation environment 
  rm -r "$pkgdir"/usr/$_target/sys-root/{etc,usr/share,var}

  #strip manually
  find "$pkgdir"/usr/$_target/sys-root -name '*.so' -and ! -name 'libc.so' -print0 | xargs -0 $_target-strip --strip-all

  #fix missing symlink
  ln -s libpthread.so.0 "$pkgdir"/usr/$_target/sys-root/usr/lib/libpthread.so

}
