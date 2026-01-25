# Maintainer: AltoXorg <machinademoniko AT gmail DOT com>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Alex Bates <hi@imalex.xyz>

_target=mips-linux-gnu
pkgname=$_target-binutils
pkgver=2.45.1
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the MIPS target'
arch=('x86_64' 'aarch64')
url='http://www.gnu.org/software/binutils/'
license=('GPL')
depends=('zlib' 'libelf')
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2")
sha512sums=('a5934bc5ec5d6fac45fe6f9ab863e7aa0f0608348e32dc2794f2a4aebba703992d5d30b5107afee0571aecfd4788a73a5bb3b0ee1028249547765b5787dd0274')

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
