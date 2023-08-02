# Maintainer: Vyacheslav Razykov <v.razykov@gmail.com>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>

_target="arm-linux-gnueabihf"
pkgname=${_target}-glibc
pkgver=2.36
pkgrel=1
pkgdesc="GNU C Library (${_target})"
arch=('any')
url="https://www.gnu.org/software/libc/"
license=(GPL LGPL)
depends=("${_target}-linux-api-headers>=5.14.9-1")
makedepends=("${_target}-gcc-stage2>=12.1.0-1" python gperf)
provides=("${_target}-glibc-headers=${pkgver}" "${_target}-eglibc")
conflicts=("${_target}-glibc-headers" "${_target}-eglibc")
replaces=("${_target}-glibc-headers")
options=(!buildflags !strip !lto staticlibs)
source=(https://ftp.gnu.org/gnu/glibc/glibc-${pkgver}.tar.xz{,.sig}
        sdt.h sdt-config.h
        reenable_DT_HASH.patch)
validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8 # Carlos O'Donell
              BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar
md5sums=('00e9b89e043340f688bc93ec03239b57'
         'SKIP'
         '91fec3b7e75510ae2ac42533aa2e695e'
         '680df504c683640b02ed4a805797c0b2'
         '4a3e4243338481bb5e70b74281347ae8')

prepare() {
  mkdir -p glibc-build

  [[ -d glibc-${pkgver} ]] && ln -s glibc-${pkgver} glibc
  cd glibc

  local i; for i in ${source[@]}; do
    case ${i%::*} in
      *.patch)
        echo "Applying ${i}"
        patch -p1 -i "${srcdir}/${i}"
        ;;
    esac
  done
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
      --enable-systemtap
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
  LDFLAGS=${LDFLAGS/,-z,now/}

  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib

  "${srcdir}/glibc-${pkgver}/configure" \
      --libdir=/lib \
      --libexecdir=/lib \
      ${_configure_flags[@]} \
      --target=${_target} \
      --host=${_target} \
      --build=${CHOST}

  echo "build-programs=no" >> configparms
  make
}

package() {
  cd glibc-build

  make install_root="${pkgdir}/usr/${_target}" install

  mkdir -p "${pkgdir}/usr/${_target}/usr"
  ln -s ../{include,lib} "${pkgdir}/usr/${_target}/usr"

  # Remove unneeded for compilation files
  rm -rf "${pkgdir}/usr/${_target}/"{bin,sbin,etc,share,var}

  # Provide tracing probes to libstdc++ for exceptions, possibly for other
  # libraries too. Useful for gdb's catch command.
  install -Dm644 "${srcdir}/sdt.h" "${pkgdir}/usr/${_target}/include/sys/sdt.h"
  install -Dm644 "${srcdir}/sdt-config.h" "${pkgdir}/usr/${_target}/include/sys/sdt-config.h"
}
