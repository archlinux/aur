# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target=arm-linux-gnueabihf
pkgname=${_target}-glibc-headers
pkgver=2.42+r3+gbc13db739377
_commit=bc13db73937730401d592b33092db6df806d193e
pkgrel=1
pkgdesc="GNU C Library headers"
arch=('any')
url="https://www.gnu.org/software/libc/"
license=(GPL-2.0-only LGPL-2.1-or-later)
depends=("${_target}-linux-api-headers>=6.15")
makedepends=("${_target}-gcc-stage1>=15.2.0" python)
conflicts=("${_target}-glibc" "${_target}-eglibc")
options=(!buildflags !strip !lto staticlibs)
source=(git+https://sourceware.org/git/glibc.git#commit=${_commit}
        sdt.h sdt-config.h)
validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8 # Carlos O'Donell
              BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar
sha256sums=('810cc48e09712524aa087c7122baaed15ace55ea9c52f918fa095e49734d8cd4'
            '1ecf90005ff5a65374c7266acb164fa265aff92328593bdca2352acf5dab240d'
            'cdc234959c6fdb43f000d3bb7d1080b0103f4080f5e67bcfe8ae1aaf477812f0')

pkgver() {
  cd "${srcdir}"/glibc
  git describe --abbrev=12 --tags | sed 's/[^-]*-//;s/[^-]*-/&r/;s/-/+/g'
}

prepare() {
  if [ -d "${srcdir}"/glibc-${pkgver} ]; then
    ln -s "${srcdir}"/glibc-${pkgver} "${srcdir}"/glibc
  fi
  mkdir -p "${srcdir}"/glibc-build
}

build() {
  cd "${srcdir}"/glibc-build

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

  "${srcdir}"/glibc/configure \
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
    --enable-lock-elision \
    --enable-stack-protector=strong \
    --enable-stackguard-randomization \
    --enable-crypt \
    --enable-obsolete-rpc \
    --enable-kernel=2.6.32 \
    --disable-multi-arch \
    --disable-profile \
    --disable-werror

  # make some libs and stubs
  make csu/subdir_lib
}

package() {
  cd "${srcdir}"/glibc-build

  make install_root="${pkgdir}"/usr/"${_target}" install-headers install-bootstrap-headers=yes

  # glibc doesn't support eglibc's install-bootstrap-headers
  # luckily a blank gnu/stubs.h is all we need
  touch "${pkgdir}"/usr/"${_target}"/include/gnu/stubs.h

  mkdir -p "${pkgdir}"/usr/"${_target}"/lib
  install -Dm644 "${srcdir}"/glibc-build/csu/crt*.o "${pkgdir}"/usr/"${_target}"/lib

  # create stub lib
  ${_target}-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o "${pkgdir}"/usr/"${_target}"/lib/libc.so

  # provide tracing probes to libstdc++ for exceptions, possibly for other
  # libraries too. Useful for gdb's catch command.
  install -Dm644 "${srcdir}"/sdt.h "${pkgdir}"/usr/"${_target}"/include/sys/sdt.h
  install -Dm644 "${srcdir}"/sdt-config.h "${pkgdir}"/usr/"${_target}"/include/sys/sdt-config.h

  # strip it manually to prevent makepkg complaining about srcdir references
  find "${pkgdir}"/usr/"${_target}"/lib -type f -exec /usr/bin/"${_target}"-strip --strip-unneeded {} \; 2>/dev/null || true
}
