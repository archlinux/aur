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
pkgver=2.41
pkgrel=2
pkgdesc="GNU C Library"
arch=('any')
url="https://www.gnu.org/software/libc/"
license=(GPL LGPL)
depends=("${_target}-linux-api-headers>=6.10")
makedepends=("${_target}-gcc-stage2>=14.2.0" python)
provides=("${_target}-glibc-headers=${pkgver}" "${_target}-eglibc")
conflicts=("${_target}-glibc-headers" "${_target}-eglibc")
replaces=("${_target}-glibc-headers")
options=(!buildflags !strip lto staticlibs)
source=(https://ftp.gnu.org/gnu/glibc/glibc-${pkgver}.tar.xz{,.sig}
        sdt.h sdt-config.h
        xldd)
validpgpkeys=(35B17DF5752577CA0C541CEB94BFDF4484AD142F # Andreas K. Huettel
              BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar
sha256sums=('a5a26b22f545d6b7d7b3dd828e11e428f24f4fac43c934fb071b6a7d0828e901'
            'SKIP'
            '1ecf90005ff5a65374c7266acb164fa265aff92328593bdca2352acf5dab240d'
            'cdc234959c6fdb43f000d3bb7d1080b0103f4080f5e67bcfe8ae1aaf477812f0'
            '96aaa6baacd84f8cd517e5b31d575b766a7af5a3be6fad3c8707da796e8f8ca7')

prepare() {
  mkdir -p glibc-build
}

build() {
  cd glibc-build

  echo "slibdir=/lib" >> configparms
  echo "rtlddir=/lib" >> configparms
  echo "sbindir=/bin" >> configparms
  echo "rootsbindir=/bin" >> configparms

  # remove fortify for building libraries
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}

  CFLAGS="${CFLAGS/-fno-plt/} -O2"
  CXXFLAGS="${CXXFLAGS/-fno-plt/} -O2"
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
    --prefix=/usr \
    --libdir=/lib \
    --libexecdir=/lib \
    --includedir=/include \
    --with-headers=/usr/${_target}/include \
    --enable-add-ons \
    --enable-bind-now \
    --enable-cet \
    --enable-fortify-source \
    --enable-lock-elision \
    --enable-stack-protector=strong \
    --enable-stackguard-randomization \
    --enable-systemtap \
    --enable-crypt \
    --enable-obsolete-rpc \
    --enable-kernel=2.6.32 \
    --disable-multi-arch \
    --disable-profile \
    --disable-werror

  echo "build-programs=no" >> configparms
  make
}

package() {
  cd glibc-build

  make install_root="${pkgdir}"/usr/"${_target}" install

  # provide famous ldd script
  install -Dm755 "${srcdir}"/xldd "${pkgdir}"/usr/bin/"${_target}"-ldd

  # remove not required files
  rm -r "$pkgdir"/usr/$_target/{etc,usr/share,var}

  # provide tracing probes to libstdc++ for exceptions, possibly for other
  # libraries too. Useful for gdb's catch command.
  install -Dm644 "${srcdir}"/sdt.h "${pkgdir}"/usr/"${_target}"/include/sys/sdt.h
  install -Dm644 "${srcdir}"/sdt-config.h "${pkgdir}"/usr/"${_target}"/include/sys/sdt-config.h

  # strip it manually to prevent makepkg complaining about srcdir references
  find "${pkgdir}"/ -type f -exec /usr/bin/"${_target}"-strip --strip-unneeded {} \; 2>/dev/null || true
}
