#Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

_target=mips64-elf
pkgname=${_target}-binutils
pkgver=2.27
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (${_target})"
url="http://www.gnu.org/software/binutils/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('zlib')
source=("ftp://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2")
sha256sums=('369737ce51587f92466041a97ab7d2358c6d9e1b6490b3940eb09fb0a9a6ac88')

prepare() {
  cd binutils-${pkgver}

  # Hack - see native package for details
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

check() {
  cd binutils-$pkgver

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check
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
    --enable-plugins \
    --enable-static \
    --disable-gold \
    --disable-multilib \
    --disable-nls \
    --disable-shared \
    --disable-werror \

  make
}

package() {
  cd binutils-${pkgver}

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,nlmconv,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -rf "$pkgdir"/usr/share/info
}
