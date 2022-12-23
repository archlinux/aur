# Maintainer: Joey Dumont <joey.dumont@gmail.com>
_target=mips64-ultra-elf
pkgname=${_target}-gdb
_gdbver=12.1
pkgver=12.1_r171.c378110
pkgrel=1
pkgdesc="The GNU Debugger (${_target})"
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/gdb/'
makedepends=(git)
options=(!emptydirs)
depends=(zstd gdb-common mpfr guile libelf)
source=("https://ftp.gnu.org/gnu/gdb/gdb-${_gdbver}.tar.xz"
        "git+https://github.com/glankk/n64.git#branch=n64-ultra")
sha256sums=('0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed'
            'SKIP')

pkgver() {
  cd "${srcdir}/n64/"
  printf "%s_r%s.%s" "${_gdbver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/gdb-${_gdbver}"
  mkdir "${srcdir}"/build-gdb

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd build-gdb

  export CFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections"
  export CXXFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections"

  "${srcdir}"/gdb-${_gdbver}/configure \
    --prefix=/usr \
    --libdir=/usr/${_target}/lib \
    --libexecdir=/usr/${_target}/lib \
    --target=${_target} \
    --with-sysroot=/usr/${_target}/n64-sysroot/ \
    --with-newlib \
    --enable-multilib \
    --disable-nls \
    --disable-sim
  make
}

package() {
  cd build-gdb

  make DESTDIR="${pkgdir}" install

  # Following files conflict with 'gdb'/'gdb-common' packages
  rm -r "$pkgdir"/usr/include/gdb/
  rm -r "$pkgdir"/usr/share/gdb/
  rm -r "$pkgdir"/usr/share/info/
  rm -r "$pkgdir"/usr/share/man/man5/
}
