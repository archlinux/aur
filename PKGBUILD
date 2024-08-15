# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: armv7l-binutils -> armv7l-linux-api-headers -> armv7l-gcc-bootstrap -> armv7l-glibc -> armv7l-gcc -> armv7l-glibc (again)
_arch=armv7l
_target=$_arch-unknown-linux-gnueabihf
pkgname=$_arch-glibc
pkgver=2.40
pkgrel=1
_commit=3d1aed874918c466a4477af1da35983ab036690e
pkgdesc="GNU C Library for armv7l"
arch=(any)
url='https://www.gnu.org/software/libc/'
license=('GPL' 'LGPL')
depends=()
makedepends=(git $_arch-binutils $_arch-gcc $_arch-linux-api-headers python)
options=(!buildflags !strip staticlibs)
source=(git+https://sourceware.org/git/glibc.git#commit=${_commit})

validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8  # "Carlos O'Donell <carlos@systemhalted.org>"
              BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar
b2sums=('b68f571cdedb6c9cdb5cd041aa3575ad74b78e2fb4d4f8867c1d1c1a03cfd0bc641b5d446224d3448099fdfad3fc8a109c97b04d57bc4718a2e31ad6421b4b6d')

prepare() {
  mkdir -p glibc-build
}

build() {
  cd glibc-build
  echo "build-programs=no" > configparms
  echo "cross-compiling=yes" >> configparms
  echo 'slibdir=/lib' >> configparms
  echo 'rtlddir=/lib' >> configparms
  echo 'sbindir=/bin' >> configparms
  echo 'rootsbindir=/bin' >> configparms

  # remove hardening options for building libraries
  #export CFLAGS="-U_FORTIFY_SOURCE -mlittle-endian -O2"
  #export CPPFLAGS="-U_FORTIFY_SOURCE -O2"
  unset LD_LIBRARY_PATH

  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib

unset CFLAGS CXXFLAGS
#Use CFLAGS/CXXFLAGS from Arch Linux ARM
CFLAGS="-march=armv7-a -mfloat-abi=hard -mfpu=neon -O2 -pipe -fstack-protector-strong -fno-plt -fexceptions \
-Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security \
-fstack-clash-protection \
-fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"
CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"

  ../glibc/configure \
      --prefix=/usr \
      --host=$_target \
      --libdir=/lib \
      --with-bugurl=https://aur.archlinux.org/packages/armv7l-glibc \
      --enable-kernel=6.6 \
      --enable-bind-now \
      --disable-multi-arch \
      --enable-stack-protector=strong \
      --disable-profile \
      --disable-werror \
      --disable-timezone-tools 

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

  #create symlink to the shared library since we don't have the static one (gcc needs this)
  ln -s libpthread.so.0 "$pkgdir"/usr/$_target/sys-root/lib/libpthread.so
}
