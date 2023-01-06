# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: aarch64-binutils -> aarch64-linux-api-headers -> aarch64-gcc-bootstrap -> aarch64-glibc -> aarch64-gcc -> aarch64-glibc (again)

_arch=aarch64
_target=$_arch-unknown-linux-gnu
pkgname=$_arch-glibc
pkgver=2.36
pkgrel=2
_commit=be176490b818b65b5162c332eb6b581690b16e5c
pkgdesc="GNU C Library ARM64 target"
arch=(any)
url='https://www.gnu.org/software/libc/'
license=('GPL' 'LGPL')
depends=()
makedepends=($_arch-gcc $_arch-linux-api-headers python)
options=(!strip staticlibs)
source=(https://ftp.gnu.org/gnu/libc/glibc-$pkgver.tar.xz{,.sig})
sha256sums=('1c959fea240906226062cb4b1e7ebce71a9f0e3c0836c09e7e3423d434fcfe75'
            'SKIP')
validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8  # "Carlos O'Donell <carlos@systemhalted.org>"
              BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar

prepare() {
  mkdir -p glibc-build
}

build() {
  cd glibc-build
  echo "build-programs=no" > configparms
  echo "cross-compiling=yes" >> configparms
  echo "slibdir=/usr/lib" >> configparms
  echo "rtlddir=/usr/lib" >> configparms

#Use CFLAGS/CXXFLAGS from Arch Linux ARM
CFLAGS="-march=armv8-a -O2 -pipe -fstack-protector-strong -fno-plt -fexceptions \
-Wformat -Werror=format-security \
-fstack-clash-protection"

  ../glibc-$pkgver/configure \
      --prefix=/usr \
      --host=$_target \
      --libdir=/usr/lib \
      --with-bugurl=https://aur.archlinux.org/packages/aarch64-glibc \
      --enable-kernel=5.10 \
      --enable-add-ons \
      --enable-bind-now \
      --enable-lock-elision \
      --disable-multi-arch \
      --enable-stack-protector=strong \
      --enable-stackguard-randomization \
      --disable-profile \
      --disable-werror \
      --disable-timezone-tools

  make --jobserver-style=pipe
}

package() {
  cd glibc-build
  make --jobserver-style=pipe DESTDIR="$pkgdir"/usr/$_target/sys-root install 

  #we don't want static libraries. Only keep the one that we really need.
  find "$pkgdir"/usr/$_target/sys-root  -name '*.a' -and -not -name libc_nonshared.a -delete
  
  #Remove files we don't need in a cross compilation environment 
  rm -r "$pkgdir"/usr/$_target/sys-root/{etc,usr/share,var}

  #strip manually
  find "$pkgdir"/usr/$_target/sys-root -name '*.so' -and ! -name 'libc.so' -print0 | xargs -0 $_target-strip --strip-all

  #create symlink to the shared library since we don't have the static one (gcc needs this)
  ln -s libpthread.so.0 "$pkgdir"/usr/$_target/sys-root/usr/lib/libpthread.so
}
