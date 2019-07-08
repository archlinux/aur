# Maintainer: Joey Dumont <joey.dumont@gmail.com>

_target=mips64-ultra-elf
pkgname=${_target}-binutils
_binutilsver=2.32
pkgver=2.32_r100.c9c95e7
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files for ${_target}"
url="http://www.gnu.org/software/binutils/"
arch=('x86_64')
license=('GPL')
depends=('zlib')
source=("ftp://ftp.gnu.org/gnu/binutils/binutils-${_binutilsver}.tar.xz"
        "git+https://github.com/glankk/n64.git#branch=n64-ultra")
sha256sums=('0ab6c55dd86a92ed561972ba15b9b70a8b9f75557f896446c82e8b36e473ee04'
            'SKIP')

pkgver() {
  cd ${srcdir}/n64/
  printf "%s_r%s.%s" "${_binutilsver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/binutils-${_binutilsver}

  # Hack - see native package for details
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  # -- Local variables.
  CP_DIR=${srcdir}/binutils-${_binutilsver}

  # -- Copy files in binutils source.
  cd ${srcdir}/n64/
  cp "config/ld/emulparams/"* ${CP_DIR}/ld/emulparams
  cp "config/ld/emultempl/"* ${CP_DIR}/ld/emultempl
  cat "config/ld/configure.tgt.ultra" >> ${CP_DIR}/ld/configure.tgt
  cat "config/ld/Makefile.am.ultra" >> ${CP_DIR}/ld/Makefile.am
  rm -f ${CP_DIR}/ld/po/BLD-POTFILES.in
  autoreconf ${CP_DIR}/ld
  cd ${CP_DIR}

}

build() {

  cd ${srcdir}/binutils-${_binutilsver}

  export CFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections"
  export CXXFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections"

  ./configure \
    --target=${_target} \
    --prefix=/usr \
    --with-sysroot=/usr/${_target} \
    --with-gnu-as \
    --with-gnu-ld \
    --enable-64-bit-bfd \
    --enable-plugins \
    --disable-gold \
    --enable-multilib \
    --disable-nls \
    --disable-shared \
    --disable-werror

  make
}

check() {
  cd binutils-${_binutilsver}

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check || true
}

package() {
  cd binutils-${_binutilsver}

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -rf "$pkgdir"/usr/share/info
}
