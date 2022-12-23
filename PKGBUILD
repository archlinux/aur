# Maintainer: Joey Dumont <joey.dumont@gmail.com>
_target=mips64-ultra-elf
pkgname=${_target}-binutils
_binutilsver=2.39
pkgver=2.39_r171.c378110
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files for ${_target}"
url="http://www.gnu.org/software/binutils/"
arch=('x86_64')
license=('GPL')
makedepends=('git')
depends=('libelf')
source=("ftp://ftp.gnu.org/gnu/binutils/binutils-${_binutilsver}.tar.xz"
        "git+https://github.com/glankk/n64.git#branch=n64-ultra"
)
sha256sums=('645c25f563b8adc0a81dbd6a41cffbf4d37083a382e02d5d3df4f65c09516d00'
            'SKIP')

pkgver() {
  cd "${srcdir}/n64/"
  printf "%s_r%s.%s" "${_binutilsver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/binutils-${_binutilsver}"

  # Hack - see native package for details
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  # -- Local variables.
  CP_DIR="${srcdir}/binutils-${_binutilsver}"

  # -- Copy files in binutils source.
  cd "${srcdir}/n64/"
  patch -d "${CP_DIR}/ld" -p 1 < "config/ld/ld.diff"
  cp "config/ld/emulparams/"* "${CP_DIR}/ld/emulparams"
  cp "config/ld/emultempl/"* "${CP_DIR}/ld/emultempl"
  cat "config/ld/configure.tgt.ultra" >> "${CP_DIR}/ld/configure.tgt"
  cd "${CP_DIR}"

  # -- Configure n64. Note that the sysroot dir is set to $(prefix)$/(target)
  # -- in the package itself.
  cd "$srcdir/n64"
  ./configure --prefix=/usr/

}

build() {

  cd "${srcdir}/binutils-${_binutilsver}"

  export CFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections"
  export CXXFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections"

  ./configure \
    --target=${_target} \
    --prefix=/usr \
    --with-sysroot=/usr/${_target}/n64-sysroot/ \
    --with-gnu-as \
    --with-gnu-ld \
    --enable-plugins \
    --disable-gold \
    --enable-multilib \
    --disable-nls \
    --disable-shared \
    --disable-werror

  make
}

check() {
  cd "binutils-${_binutilsver}"

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check || true
}

package() {
  cd "binutils-${_binutilsver}"

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -rf "$pkgdir"/usr/share/info
  rm -rf "$pkgdir"/usr/lib/bfd-plugins/libdep*

  # Install the library files in the sysroot.
  cd "$srcdir/n64"
  make DESTDIR="${pkgdir}" install-sys
}
