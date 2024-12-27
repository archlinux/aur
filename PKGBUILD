# Maintainer: envolution
# Contributor: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Pierre Schmitz <pierre@archlinux.de> ([core] package)
# Contributor: François Charette <firmicus@gmx.net>
# Contributor: Stephanie Wilde-Hobbs <steph@rx14.co.uk>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=xz-git
pkgver=5.6.3+r2714+gf7a248f56
pkgrel=2
pkgdesc='Library and command line tools for XZ and LZMA compressed files'
arch=('x86_64')
url='https://tukaani.org/xz/'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' '0BSD' 'LicenseRef-custom')
depends=('sh')
makedepends=('git' 'doxygen')
#provides=("liblzma.so=${pkgver%%+*}" "xz=${pkgver%%+*}")
provides=('liblzma.so' "xz=${pkgver%%+*}") #setting .so to pkgver breaks expected dependency version '5-64'
conflicts=(xz)
source=("$pkgname::git+https://github.com/tukaani-project/xz.git")
sha256sums=('SKIP')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org> https://tukaani.org/misc/lasse_collin_pubkey.txt

prepare() {
  cd $pkgname
  ./autogen.sh --no-po4a
}

pkgver() {
  cd $pkgname
  _version=$(git tag --sort=-v:refname --list | grep '^v[0-9.]*$' | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
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
  make DESTDIR=${pkgdir} install
  install -Dm644 README ${pkgdir}/usr/share/doc/${pkgname}/README
  install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
  cp -Rf COPYING* ${pkgdir}/usr/share/licenses/${pkgname}
}
# vim:set ts=2 sw=2 et:
