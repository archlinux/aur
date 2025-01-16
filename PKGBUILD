# Maintainer: a821 at (nospam) mail de
# Contributor: envolution
# Contributor: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Pierre Schmitz <pierre@archlinux.de> ([core] package)
# Contributor: François Charette <firmicus@gmx.net>
# Contributor: Stephanie Wilde-Hobbs <steph@rx14.co.uk>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=xz-git
pkgver=5.7.0alpha.r447.g51f038f8
pkgrel=1
pkgdesc='Library and command line tools for XZ and LZMA compressed files'
arch=('x86_64')
url='https://tukaani.org/xz/'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' '0BSD' 'LicenseRef-custom')
depends=('sh')
makedepends=('git' 'doxygen' 'po4a')
provides=('liblzma.so' "xz=${pkgver%%.r*}")
conflicts=(xz)
source=("$pkgname::git+https://github.com/tukaani-project/xz.git")
sha256sums=('SKIP')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org> https://tukaani.org/misc/lasse_collin_pubkey.txt

prepare() {
  cd $pkgname
  ./autogen.sh
}

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd $pkgname

  ./configure \
    --prefix=/usr \
    --disable-rpath \
    --enable-doxygen \
    --enable-werror
  make
}

check() {
  cd $pkgname
  make check
}

package_xz-git() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm755 COPYING{,.0BSD} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
