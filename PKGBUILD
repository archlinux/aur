# Maintainer (Arch): Allan McRae <allan@archlinux.org>
# Maintainer: André Silva <emulatorman@parabola.nu>
# Maintainer: Márcio Silva <coadde@parabola.nu>

pkgname=xtensa-unknown-elf-binutils
pkgver=2.27
_pkgverpatch=$pkgver
pkgrel=1
_commit=2870b1ba
pkgdesc="A set of programs to assemble and manipulate binary and object files"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
groups=('cross-devel')
depends=('glibc>=2.24' 'zlib')
makedepends=('git')
checkdepends=('dejagnu' 'bc')
options=('staticlibs' '!distcc' '!ccache')
source=(git://sourceware.org/git/binutils-gdb.git#commit=${_commit}
        https://repo.parabola.nu/other/binutils/$_pkgverpatch/binutils-xtensa.patch)
md5sums=('SKIP'
         'd3c1408246493c42fc2b78508571f584')

prepare() {
  cd binutils-gdb

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  # open-ath9k-htc-firmware patch
  patch -p1 -i ${srcdir}/binutils-xtensa.patch

  mkdir ${srcdir}/binutils-build
}

build() {
  cd binutils-build

  ../binutils-gdb/configure --prefix=/usr \
    --with-lib-path=/usr/lib:/usr/local/lib \
    --with-bugurl=https://labs.parabola.nu/ \
    --enable-threads --with-pic \
    --enable-ld=default --enable-gold --enable-plugins \
    --enable-deterministic-archives \
    --disable-werror --disable-gdb --disable-nls \
    --target=xtensa-unknown-elf --with-sysroot=/usr/xtensa-unknown-elf

  # check the host environment and makes sure all the necessary tools are available
  make configure-host

  make tooldir=/usr
}

check() {
  cd binutils-build
  
  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # ignore failures in gold testsuite...
  make -k LDFLAGS="" check || true
}

package() {
  cd binutils-build
  make prefix=${pkgdir}/usr install

  # Remove info documents that conflict with host version
  rm -rf ${pkgdir}/usr/share/info
}
