# $Id: PKGBUILD 144850 2011-12-08 12:17:07Z allan $
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=binutils-tune-bfd-hash
_pkgname=binutils
pkgver=2.22
pkgrel=3
_date=20111201
pkgdesc="A set of programs to assemble and manipulate binary and object files. 'ld' is patched for using with GHC, see http://www.haskell.org/pipermail/glasgow-haskell-users/2010-April/018722.html ."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
groups=('base-devel')
depends=('glibc>=2.14' 'zlib')
checkdepends=('dejagnu')
options=('!libtool' '!distcc' '!ccache')
install=binutils.install
source=(ftp://ftp.archlinux.org/other/${_pkgname}/${_pkgname}-${pkgver}_${_date}.tar.bz2
        binutils-2.22-tune-bfd-hash.patch)
md5sums=('77c15027ac112c65fd5f73ca91b0651c'
         "900535c217e97cb8113d4c43c0f11f22")
provides=("binutils=$pkgver")
conflicts=('binutils')

mksource() {
  mkdir ${_pkgname}-${_date}
  cd ${_pkgname}-${_date}
  export _TAG=binutils-2_22-branch
  export 'CVSROOT=:pserver:anoncvs@sourceware.org:/cvs/src'
  cvs -z9 co -r $_TAG binutils || return 1
  mv src binutils
  tar -cvjf ../binutils-${pkgver}_${_date}.tar.bz2 binutils/*
}

build() {
  cd ${srcdir}/${_pkgname}
  patch -p1 < ${srcdir}/binutils-2.22-tune-bfd-hash.patch || return 1
  cd ${srcdir}
  mkdir binutils-build && cd binutils-build

  [[ $CARCH == "x86_64" ]] && CONFIGFLAG="--enable-64-bit-bfd --disable-multilib"

  ${srcdir}/binutils/configure --prefix=/usr \
    --enable-ld=default --enable-gold \
    --enable-plugins --enable-threads \
    --enable-shared $CONFIGFLAG

  # check the host environment and makes sure all the necessary tools are available
  make configure-host

  make tooldir=${pkgdir}/usr
}

check() {
  cd ${srcdir}/binutils-build

  # do not abort on errors - manually check log files
  make -k -j1 check || true
}

package() {
  cd ${srcdir}/binutils-build
  install -m755 -d ${pkgdir}/usr/lib ${pkgdir}/usr/include
  make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install

  # Rebuild libbfd.a with -fPIC
  make -C bfd clean
  make CFLAGS="$CFLAGS -fPIC" -C bfd

  # Rebuild libiberty.a with -fPIC
  make -C libiberty clean
  make CFLAGS="$CFLAGS -fPIC" -C libiberty

  # Rebuild libbfd.a with -fPIC
  make -C bfd clean
  # hidden visability prevent 3rd party shared libraries exporting bfd non-stable API
  make CFLAGS="$CFLAGS -fPIC -fvisibility=hidden" -C bfd

  install -m644 libiberty/libiberty.a ${pkgdir}/usr/lib
  install -m644 bfd/libbfd.a ${pkgdir}/usr/lib

  # Add some useful headers
  install -m644 ${srcdir}/binutils/include/libiberty.h ${pkgdir}/usr/include
  install -m644 ${srcdir}/binutils/include/demangle.h ${pkgdir}/usr/include

  # Remove Windows/Novell specific man pages
  rm -f ${pkgdir}/usr/share/man/man1/{dlltool,nlmconv,windres,windmc}*

  # Remove these symlinks, they are not ABI stable.
  # Programs should compile static to the .a file.
  rm -f ${pkgdir}/usr/lib/lib{bfd,opcodes}.so
  echo "INPUT ( /usr/lib/libbfd.a -liberty -lz )" >${pkgdir}/usr/lib/libbfd.so
  echo "INPUT ( /usr/lib/libopcodes.a -lbfd )" >${pkgdir}/usr/lib/libopcodes.so
}
