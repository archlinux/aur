# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: armv7l-binutils -> armv7l-linux-api-headers -> armv7l-gcc-bootstrap -> armv7l-glibc -> armv7l-gcc -> armv7l-glibc (again)

_arch=armv7l
_target=$_arch-unknown-linux-gnueabihf
pkgname=$_arch-glibc
pkgver=2.36
pkgrel=2
_commit=be176490b818b65b5162c332eb6b581690b16e5c
pkgdesc="GNU C Library ARM (32bit) target"
arch=(any)
url='https://www.gnu.org/software/libc/'
license=('GPL' 'LGPL')
depends=($_arch-linux-api-headers)
makedepends=($_arch-binutils $_arch-gcc python)
options=(!strip staticlibs)
source=(https://ftp.gnu.org/gnu/libc/glibc-$pkgver.tar.xz{,.sig})
sha256sums=('1c959fea240906226062cb4b1e7ebce71a9f0e3c0836c09e7e3423d434fcfe75'
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
  
  #Use c/cxx-flags from Arch Linux ARM

  CFLAGS="-march=armv7-a -mfloat-abi=hard -mfpu=neon -O2 -pipe -fstack-protector-strong -fno-plt -fexceptions \
-Wformat -Werror=format-security \
-fstack-clash-protection"

  "$srcdir"/glibc-$pkgver/configure \
      --prefix=/usr \
      --host=$_target \
      --libdir=/usr/lib \
      --with-bugurl=https://aur.archlinux.org/packages/armv7l-glibc \
      --enable-add-ons \
      --enable-bind-now \
      --enable-lock-elision \
      --disable-multi-arch \
      --enable-stack-protector=strong \
      --enable-stackguard-randomization \
      --disable-profile \
      --disable-timezone-tools \
      --disable-werror

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
