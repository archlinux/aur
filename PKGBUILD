# Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>
# Contributor: Joey Dumont <joey.dumont@gmail.com>

_target=mips64-elf
pkgname=${_target}-binutils
pkgver=2.42
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (${_target})"
url="http://www.gnu.org/software/binutils/"
arch=('x86_64')
license=('GPL')
depends=('libelf')
source=("ftp://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz")
sha256sums=('f6e4d41fd5fc778b06b7891457b3620da5ecea1006c6a4a41ae998109f85a800')

prepare() {
  cd binutils-${pkgver}

  # Hack - see native package for details
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-${pkgver}

  ./configure \
    --target=${_target} \
    --prefix=/usr \
    --with-sysroot=/usr/${_target} \
    --with-gnu-as \
    --with-gnu-ld \
    --enable-64-bit-bfd \
    --enable-multilib \
    --enable-plugins \
    --disable-gold \
    --disable-nls \
    --disable-shared \
    --disable-werror

  make
}

check() {
  cd binutils-${pkgver}

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check || true
}

package() {
  cd binutils-${pkgver}

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.a

  # Remove info documents that conflict with host version
  rm -rf "$pkgdir"/usr/share/info
}
