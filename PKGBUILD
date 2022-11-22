# Maintainer: SimPilotAdamT <adam_tazul@outlook.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=liboffsetfinder64-git
_pkgver=1
pkgver=1
pkgrel=2
pkgdesc="i64bit offsetfinder. It finds offsets, patches, parses Mach-O and even supports IMG4"
arch=('x86_64')
url="https://github.com/Cryptiiiic/liboffsetfinder64"
license=('LGPL-2.1')
makedepends=('libplist')
source=("git+https://github.com/Cryptiiiic/liboffsetfinder64.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  __pkgver=$(echo "$_pkgver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)" | rev | cut -c 2- | rev)
  echo "$__pkgver"
}

prepare() {
  cd "${srcdir}/liboffsetfinder64"

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
