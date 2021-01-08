# Maintainer: Jesus Alonso <doragasu at hotmail dot com>
# NOTE: As I want these packages for Genesis/Megadrive development, they do
# only support the m68000 CPU. If you want to support other m68k variants,
# either modify _target_cpu to suit your needs, or go wild, remove the
# --with-cpu switches and change --disable-multilib with --enable-multilib.
# Be warned that multilib packages will take a lot more time to build, and
# will also require more disk space.

_target=m68k-elf
_target_cpu=m68000
pkgname=${_target}-gdb
pkgver=10.1
pkgrel=1
pkgdesc="The GNU Project Debugger (${_target})"
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.gnu.org/software/gdb/"
depends=("${_target}-binutils" "${_target}-gcc" 'zlib' 'guile')
PKGEXT="pkg.tar.zst"
source=("http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz"
        "http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz.sig")
        
sha256sums=(SKIP SKIP)
validpgpkeys=(F40ADB902B24264AA42E50BF92EDB04BFF325CF3)

prepare() {
  cd ${srcdir}/gdb-${pkgver}

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  mkdir ${srcdir}/gdb-build
}

build() {
  cd ${srcdir}/gdb-build

  ../gdb-${pkgver}/configure --prefix=/usr \
    --target=${_target} \
    --disable-multilib \
    --with-cpu=${_target_cpu}

  make
}

package() {
  cd ${srcdir}/gdb-build

  make DESTDIR=${pkgdir} install

  # Remove unwanted files
  rm -rf ${pkgdir}/usr/share
  rm -rf ${pkgdir}/usr/include
}

