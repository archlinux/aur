# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Vyacheslav Razykov <v.razykov@gmail.com>
# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target=arm-linux-gnueabihf
pkgname=${_target}-glibc
pkgver=2.38
pkgrel=2
pkgdesc="GNU C Library"
arch=('any')
url="https://www.gnu.org/software/libc/"
license=(GPL LGPL)
depends=("${_target}-linux-api-headers>=6.1")
makedepends=("${_target}-gcc-stage2>=13.2.0" python)
provides=("${_target}-glibc-headers=${pkgver}" "${_target}-eglibc")
conflicts=("${_target}-glibc-headers" "${_target}-eglibc")
replaces=("${_target}-glibc-headers")
options=(!buildflags !strip !lto staticlibs)
source=(https://ftp.gnu.org/gnu/glibc/glibc-${pkgver}.tar.xz{,.sig}
        sdt.h sdt-config.h)
validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8 # Carlos O'Donell
              BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar
md5sums=('778cce0ea6bf7f84ca8caacf4a01f45b'
         'SKIP'
         '55e32bca61fcf621143090fc33cde970'
         '680df504c683640b02ed4a805797c0b2')

prepare() {
  mkdir -p glibc-build
}

build() {
  local _configure_flags=(
      --prefix=/
      --with-headers=/usr/${_target}/include
      --enable-add-ons
      --enable-bind-now
      --enable-lock-elision
      --enable-stack-protector=strong
      --enable-stackguard-randomization
      --enable-systemtap
      --disable-multi-arch
      --disable-profile
      --disable-werror
  )

  cd glibc-build

  echo "slibdir=/lib" >> configparms
  echo "rtlddir=/lib" >> configparms
  echo "sbindir=/bin" >> configparms
  echo "rootsbindir=/bin" >> configparms

  # remove fortify for building libraries
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}

  #
  CFLAGS="${CFLAGS/-fno-plt/} -g -O2"
  CXXFLAGS="${CXXFLAGS/-fno-plt/} -g -O2"
  LDFLAGS="${LDFLAGS/,-z,now/}"

  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib

  ../glibc-${pkgver}/configure \
    --target=${_target} \
    --host=${_target} \
    --build=${CHOST} \
    --libdir=/lib \
    --libexecdir=/lib \
    ${_configure_flags[@]}

  echo "build-programs=no" >> configparms
  make
}

package() {
  cd glibc-build

  make install_root="${pkgdir}"/usr/"${_target}" install

  mkdir -p "${pkgdir}"/usr/"${_target}"/usr
  ln -s ../{include,lib} "${pkgdir}"/usr/"${_target}"/usr

  # remove unneeded for compilation files
  rm -rf "${pkgdir}"/usr/"${_target}"/{bin,sbin,etc,share,var}

  # provide tracing probes to libstdc++ for exceptions, possibly for other
  # libraries too. Useful for gdb's catch command.
  install -Dm644 "${srcdir}"/sdt.h "${pkgdir}"/usr/"${_target}"/include/sys/sdt.h
  install -Dm644 "${srcdir}"/sdt-config.h "${pkgdir}"/usr/"${_target}"/include/sys/sdt-config.h

  # strip it manually to prevent makepkg complaining about srcdir references
  find "${pkgdir}"/usr/"${_target}"/lib -type f -exec /usr/bin/"${_target}"-strip --strip-unneeded {} \; 2>/dev/null || true
}
