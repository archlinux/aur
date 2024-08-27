# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Maintainer: Stefan Schmidt <thrimbor.github@gmail.com>

_target="powerpc64-linux-gnu"
pkgname=${_target}-glibc-headers
pkgver=2.40
pkgrel=1
pkgdesc="GNU C Library headers (${_target})"
arch=('any')
url="http://www.gnu.org/software/libc/"
license=(GPL LGPL)
depends=("${_target}-linux-api-headers>=4.16.1-1")
makedepends=("${_target}-gcc-stage1>=8.1.0-1")
provides=(${_target}-glibc)
conflicts=(${_target}-glibc)
options=(!buildflags !strip staticlibs)
source=(https://ftp.gnu.org/gnu/libc/glibc-$pkgver.tar.xz{,.sig}
        PATCH-nscd-Do-not-rebuild-getaddrinfo-bug-30709.patch)
sha256sums=('19a890175e9263d748f627993de6f4b1af9cd21e03f080e4bfb3a1fac10205a2'
            'SKIP'
            'e749a59ef980a77cf6433c87ed7b5020d65c7a3e2900c577b8a7880386ec670f')
validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8  # "Carlos O'Donell <carlos@systemhalted.org>"
              BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar

prepare() {
  mkdir -p glibc-build
  cd glibc-$pkgver
  patch -Np1 < ../PATCH-nscd-Do-not-rebuild-getaddrinfo-bug-30709.patch
}

build() {
  local _configure_flags=(
      --prefix=/
      --with-headers=/usr/${_target}/include
      --enable-add-ons
      --enable-bind-now
      --enable-lock-elision
      --disable-multi-arch
      --enable-stack-protector=strong
      --enable-stackguard-randomization
      --disable-profile
      --disable-werror
  )

  cd glibc-build

  echo "slibdir=/lib" >> configparms
  echo "rtlddir=/lib" >> configparms
  echo "sbindir=/bin" >> configparms
  echo "rootsbindir=/bin" >> configparms
  # build failure
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib

  ${srcdir}/glibc-$pkgver/configure \
      --libdir=/lib \
      --libexecdir=/lib \
      ${_configure_flags[@]} \
      --target=${_target} \
      --host=${_target} \
      --build=${CHOST}

  # make some libs and stubs
  make csu/subdir_lib
}

package() {
  cd glibc-build

  make install_root="$pkgdir/usr/$_target" install-headers \
    install-bootstrap-headers=yes

  # glibc doesn't support eglibc's install-bootstrap-headers
  # Luckily a blank gnu/stubs.h is all we need
  touch "$pkgdir/usr/$_target/include/gnu/stubs.h"

  mkdir -p "$pkgdir/usr/$_target/lib"
  cp csu/crt1.o csu/crti.o csu/crtn.o "$pkgdir/usr/$_target/lib"

  # create stub lib
  ${_target}-gcc -nostdlib -nostartfiles -shared -x c /dev/null \
    -o "$pkgdir/usr/$_target/lib/libc.so"

  mkdir -p "$pkgdir/usr/$_target/usr"
  ln -s ../{include,lib} "$pkgdir/usr/$_target/usr"
}
