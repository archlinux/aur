# Maintainer: envolution
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Denis Tikhomirov <dvtikhomirov@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=minicom-git
_pkgname=minicom
pkgver=2.9+r378+ga7ee7dc3d
pkgrel=1
pkgdesc='A serial communication program'
arch=('x86_64')
url='https://salsa.debian.org/minicom-team/minicom'
license=('GPL-2.0-or-later')
depends=('bash')
makedepends=('git' automake perl)
optdepends=('lrzsz: for xmodem, ymodem and zmodem file transfer protocols')
provides=("minicom=$pkgver")
conflicts=('minicom')
backup=('etc/minirc.dfl')
source=("git+https://salsa.debian.org/minicom-team/minicom.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  _version=$(git describe --tags --abbrev=0)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  cd "${_pkgname}"
  sed -i 's/aclocal-[^ ]*/aclocal/g; s/automake-[^ ]*/automake/g' autogen.sh #strip version suffixes since we don't need them
  ./autogen.sh
  echo 'CHECK_MACRO_VERSION = true' >> po/Makefile.in.in
}

build() {
  cd "${_pkgname}"
  ./configure --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 doc/minirc.dfl ${pkgdir}/etc/minirc.dfl
}
# vim:set ts=2 sw=2 et:
