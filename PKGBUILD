# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Alex Bates <hi@imalex.xyz>

_target=mips-linux-gnu
pkgname=$_target-binutils
pkgver=2.38
pkgrel=2
pkgdesc='A set of programs to assemble and manipulate binary and object files for the MIPS target'
arch=('x86_64')
url='http://www.gnu.org/software/binutils/'
license=('GPL')
depends=('zlib')
source=("https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2")
sha512sums=('7690b4158bd6587a85c6b98903980b9ac6f16b47f7fd1e60986b0a70388bedcfdc05d75597aa49c81fec1609ce24bed6c26583f76fd2471a9d63394fd9798afc')

prepare() {
  cd binutils-${pkgver}
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-${pkgver}

  if [ "${CARCH}" != "i686" ];
  then
    # enabling gold linker at i686 makes the install fail
    enable_gold='--enable-gold'
  fi

  ./configure --target=${_target} \
              --with-sysroot="/usr/${_target}" \
              --prefix='/usr' \
              --disable-multilib \
              --with-gnu-as \
              --with-gnu-ld \
              --disable-nls \
              --enable-ld='default' \
              $enable_gold \
              --enable-plugins \
              --enable-deterministic-archives \

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
  rm "${pkgdir}"/usr/lib/bfd-plugins/libdep.so

  # Remove info documents that conflict with host version
  rm -r "${pkgdir}"/usr/share/info
}
