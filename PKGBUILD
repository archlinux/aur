# Original Core Repo
# ==================
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

# Modifications to Use Git Master Source
# ======================================
# Maintainer: James Harvey <jamespharvey20 at gmail dot com>
#    * This PKGFILE as closely as possible matches core's binutils 2.28.0-1
#    * All namcap warnings and errors are identical, other than:
#       * Warning zlib is no longer a dependency
#          * Siding with caution, leaving it as a dependency
#       * Warning libraries libopcodes and libbfd are uninstalled dependencies
#          * This is referencing itself, and the -git version is not installed in a chroot build because binutils is already installed, and it defaults to 'no' for the conflict
#          * It's hardcoded to look for a version in format 2.28.51.20170308.so, rather than 2.28.r89848.5f4d108508
#             * .51 is binutils' designation for their post-release development branch

pkgname=binutils-git
_pkgname=binutils-gdb
pkgver=2.28.r89982.ad36c6ce7c
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (git master developmental version)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
groups=('base-devel')
depends=('glibc>=2.25' 'zlib')
makedepends=('git')
checkdepends=('dejagnu' 'bc')
provides=('binutils=${pkgver}')
conflicts=('binutils-multilib' 'binutils')
replaces=('binutils-multilib')
options=('staticlibs' '!distcc' '!ccache')
source=(git+https://sourceware.org/git/binutils-gdb.git)
md5sums=('SKIP')

pkgver() {
  cd binutils-gdb
  echo $(cat binutils/configure | grep "PACKAGE_VERSION=" | sed "s|^PACKAGE_VERSION='||" | sed "s|'$||" | sed "s|\.51$||").r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd binutils-gdb

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  mkdir ${srcdir}/binutils-build
}

build() {
  cd binutils-build

  ../binutils-gdb/configure \
    --prefix=/usr \
    --with-lib-path=/usr/lib:/usr/local/lib \
    --with-bugurl=https://bugs.archlinux.org/ \
    --enable-threads \
    --enable-shared \
    --enable-ld=default \
    --enable-gold \
    --enable-plugins \
    --enable-deterministic-archives \
    --with-pic \
    --disable-werror \
    --disable-gdb

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
  make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install

  # Remove unwanted files
  rm ${pkgdir}/usr/share/man/man1/{dlltool,nlmconv,windres,windmc}*

  # No shared linking to these files outside binutils
  rm ${pkgdir}/usr/lib/lib{bfd,opcodes}.so
  echo "INPUT ( /usr/lib/libbfd.a -liberty -lz -ldl )" > "$pkgdir"/usr/lib/libbfd.so
  echo "INPUT ( /usr/lib/libopcodes.a -lbfd )" > "$pkgdir"/usr/lib/libopcodes.so
}
