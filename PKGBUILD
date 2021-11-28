# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Alex Bates <hi@imalex.xyz>

_target=mips-linux-gnu
pkgname=${_target}-binutils
pkgver=2.37
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the MIPS target'
arch=('x86_64')
url='http://www.gnu.org/software/binutils/'
license=('GPL')
depends=('zlib')
source=("https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2")
sha512sums=('b3f5184697f77e94c95d48f6879de214eb5e17aa6ef8e96f65530d157e515b1ae2f290e98453e4ff126462520fa0f63852b6e1c8fbb397ed2e41984336bc78c6')

prepare() {
  cd binutils-${pkgver}
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-${pkgver}

  ./configure --target=${_target} \
              --with-sysroot="/usr/${_target}" \
              --prefix='/usr' \
              --disable-multilib \
              --with-gnu-as \
              --with-gnu-ld \
              --disable-nls \
              --enable-ld='default' \
              --enable-plugins \
              --enable-deterministic-archives \
              --disable-werror

  make
}

check() {
  cd binutils-${pkgver}
  
  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make -k LDFLAGS="" check || true
}

package() {
  cd binutils-${pkgver}

  make DESTDIR="${pkgdir}" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "${pkgdir}"/usr/share/man/man1/${_target}-{dlltool,windres,windmc}*

  # Remove conflicting files

  # Remove info documents that conflict with host version
  rm -r "${pkgdir}/usr"/lib/bfd-plugins
  rm -r "${pkgdir}"/usr/share/info
    
  # Replace cross-directory hardlinks with symlinks
  local _file
  rm "${pkgdir}/usr/${_target}/bin"/*
  while read -r -d '' _file
  do
      ln -s "../../bin/${_file##*/}" "${pkgdir}/usr/${_target}/bin/${_file##*"${_target}-"}"
  done < <(find "${pkgdir}/usr/bin" -type f -print0)
}
