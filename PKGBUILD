# $Id$
# Original Core Repo
# ==================
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

# build from head of release branch as bug fix releases are rare

# Modifications to Use Git Master Source
# ======================================
# Maintainer: James Harvey <jamespharvey20@gmail.com>
#    * This PKGFILE as closely as possible matches core's binutils 2.25-5
#    * Core's binutils 2.25-5 binutils-e9c1bdad.patch is omitted
#       * It is git commit e9c1bdad
#    * All namcap warnings and errors are identical, other than:
#       * Warning zlib is no longer a dependency
#          * Siding with caution, leaving it as a dependency
#       * Warning libraries libopcodes and libbfd are uninstalled dependencies
#          * It's hardcoded to look for a version in format 2.25.51.20150705.so, rather than 2.25.r842222.533edc1
#             * .51 is binutils' designation for their post-release development branch

pkgname=binutils-git
_pkgname=binutils-gdb
pkgver=2.25.r84222.533edc1
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (git master developmental version)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
groups=('base-devel')
depends=('glibc>=2.20' 'zlib')
makedepends=('git')
checkdepends=('dejagnu' 'bc')
provides=('binutils')
conflicts=('binutils-multilib' 'binutils')
replaces=('binutils-multilib')
options=('staticlibs' '!distcc' '!ccache')
install=binutils.install
source=(git://sourceware.org/git/binutils-gdb.git)
md5sums=('SKIP')

pkgver() {
   cd ${srcdir}/${_pkgname}
   echo $(cat binutils/configure | grep "PACKAGE_VERSION=" | sed "s|^PACKAGE_VERSION='||" | sed "s|'$||" | sed "s|\.51$||").r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd ${srcdir}/binutils-gdb

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  mkdir ${srcdir}/binutils-build
}

build() {
  cd ${srcdir}/binutils-build

  ${srcdir}/binutils-gdb/configure --prefix=/usr \
    --with-lib-path=/usr/lib:/usr/local/lib \
    --with-bugurl=https://bugs.archlinux.org/ \
    --enable-threads --enable-shared --with-pic \
    --enable-ld=default --enable-gold --enable-plugins \
    --disable-werror --disable-gdb

  # check the host environment and makes sure all the necessary tools are available
  make configure-host

  make tooldir=/usr
}

check() {
  cd ${srcdir}/binutils-build
  
  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # ignore failures in gold testsuite...
  make -k LDFLAGS="" check || true
}

package() {
  cd ${srcdir}/binutils-build
  make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install

  # Remove unwanted files
  rm ${pkgdir}/usr/share/man/man1/{dlltool,nlmconv,windres,windmc}*

  # No shared linking to these files outside binutils
  rm ${pkgdir}/usr/lib/lib{bfd,opcodes}.so
}
