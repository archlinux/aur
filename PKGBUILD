# Maintainer: Joey Dumont <joey.dumont@gmail.com>
_target=mips64-ultra-elf
pkgname=${_target}-gdb
_gdbver=13.1
pkgver=13.1_r171.c378110
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
sha256sums=('115ad5c18d69a6be2ab15882d365dda2a2211c14f480b3502c6eba576e2e95a0'
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
    --enable-tui \
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
