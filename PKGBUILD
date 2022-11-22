# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=liboffsetfinder64-git
_pkgver=1
pkgver=1
pkgrel=1
pkgdesc="i64bit offsetfinder. It finds offsets, patches, parses Mach-O and even supports IMG4"
arch=('x86_64')
url="https://github.com/Cryptiiiic/liboffsetfinder64"
license=('LGPL-2.1')
makedepends=('libplist')
source=("git+https://github.com/Cryptiiiic/liboffsetfinder64.git"
	"libgeneral.patch")
sha512sums=('SKIP'
            '8e055ce5021bc983e0a3bc459728b6035842f5a46706e4f047f22e0c55a7eeaf2a0581e904f9342b3baff34c394a7b7db644c474f7e59548f133e256e79ce695')

pkgver() {
  cd "$srcdir/$pkgname"
  __pkgver=$(echo "$_pkgver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)" | rev | cut -c 2- | rev)
  echo "$__pkgver"
}

prepare() {
  cd "${srcdir}/liboffsetfinder64"
  git submodule update --init external/libgeneral

  # Remove img4tool and libplist from build chain,
  # since we can add those to the dependency list
  sed -i 's|external/libplist external/img4tool ||g' Makefile.am
  sed -i "28,33 s/# *//" autogen.sh

  # Fix compile errors, add missing headers
  # see: https://github.com/tihmstar/liboffsetfinder64/issues/5#issuecomment-538371315
  sed -i '9i#include <string.h>' liboffsetfinder64/vsegment.cpp
  sed -i '9i#include <algorithm>' liboffsetfinder64/vmem.cpp

  # Disable machopatchfinder64 and kernelpatchfinder64,
  # not working on Linux systems
  sed -i '14,15d' liboffsetfinder64/Makefile.am

  # Applying libgeneral.patch
  # see: https://github.com/tihmstar/liboffsetfinder64/issues/5#issuecomment-538143482
  cd external/libgeneral
  patch -p1 -i "${srcdir}/libgeneral.patch"
}

build() {
  cd "${srcdir}/liboffsetfinder64"
  ./autogen.sh
  make
}

package() {
  cd "${srcdir}/liboffsetfinder64"
  make prefix="/usr" DESTDIR="${pkgdir}" install
}
