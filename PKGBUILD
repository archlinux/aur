# Maintainer: Anatol Pomozov
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

_target=powerpc64-linux-gnu
pkgname=$_target-glibc
pkgver=2.37
pkgrel=1
pkgdesc="GNU C Library PPC64 target"
arch=(any)
url='https://www.gnu.org/software/libc/'
license=('GPL' 'LGPL')
depends=($_target-gcc $_target-linux-api-headers)
conflicts=($_target-glibc-headers)
provides=($_target-glibc-headers)
makedepends=(python)
options=(!buildflags !strip staticlibs)
source=(https://ftp.gnu.org/gnu/libc/glibc-$pkgver.tar.xz{,.sig})
sha256sums=('2257eff111a1815d74f46856daaf40b019c1e553156c69d48ba0cbfc1bb91a43'
            'SKIP')
validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8  # "Carlos O'Donell <carlos@systemhalted.org>"
              BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar

prepare() {
  mkdir -p glibc-build
}

build() {
  cd glibc-build

  echo 'slibdir=/lib' >> configparms
  echo 'rtlddir=/lib' >> configparms
  echo 'sbindir=/bin' >> configparms
  echo 'rootsbindir=/bin' >> configparms

  # remove hardening options for building libraries
  export CFLAGS="-U_FORTIFY_SOURCE -mbig-endian -O2"
  export CPPFLAGS="-U_FORTIFY_SOURCE -O2"
  unset LD_LIBRARY_PATH

  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib

  ../glibc-$pkgver/configure \
      --prefix=/usr \
      --target=$_target \
      --host=$_target \
      --build=$CHOST \
      --includedir=/include \
      --libdir=/lib \
      --libexecdir=/lib \
      --with-headers=/usr/$_target/include \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-add-ons \
      --enable-obsolete-rpc \
      --enable-kernel=2.6.32 \
      --enable-bind-now \
      --disable-profile \
      --enable-stackguard-randomization \
      --enable-lock-elision \
      --enable-multi-arch \
      --disable-werror

  echo 'build-programs=no' >> configparms
  make
}

package() {
  cd glibc-build

  make install_root="$pkgdir"/usr/$_target install

  rm -rf "$pkgdir"/usr/$_target/{etc,usr/share,var}
}
