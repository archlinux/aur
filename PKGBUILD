# Maintainer: envolution
# Contributor: FirstAirBender <noblechuk5 [at] web [dot] de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=autotrace
pkgname="${_pkgname}-git"
pkgver=0.31.10+r709+g938616658
pkgrel=1
epoch=1
pkgdesc='AutoTrace is a utility for converting bitmap into vector graphics.'
arch=('i686' 'x86_64')
url='https://github.com/autotrace/autotrace.git'
license=('GPL' 'LGPL')
depends=('libpng' 'pstoedit' 'graphicsmagick' 'glib2')
makedepends=('intltool' 'git' 'autoconf' 'automake')
provides=(autotrace)
conflicts=('autotrace' 'autotrace-nomagick')
checkdepends=('procps-ng')
options=('!libtool')
source=("${_pkgname}::git+https://github.com/autotrace/autotrace.git#branch=master"
  '010-autotrace-fix-swf-output.patch'
)
sha256sums=('SKIP'
            'c0698678cb37b4a82d732f113ad4829d1b453d9db18001ffbe3044697b4852bc')

prepare() {
  cd "$_pkgname"
  #since we're rolling with git, don't break the package when updstream fixes this
  patch -Np1 -i "${srcdir}/010-autotrace-fix-swf-output.patch" || msg2 "*** Patch failed - mark package out of date please https://aur.archlinux.org/packages/autotrace-git ***"
  ./autogen.sh
}

pkgver() {
  cd "$_pkgname"
  _version=$(git tag --sort=-v:refname --list | grep '^[0-9.]*$' | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}
build() {
  cd "$_pkgname"
  export CFLAGS+=' -Wno-incompatible-pointer-types'
  ./configure \
    --prefix=/usr \
    --with-pstoedit \
    --disable-static \
    --with-magick \
    --with-png
  make
  sed -i "s|@MAGICK_LIBS@|$(pkg-config --libs ImageMagick)|" autotrace.pc
  sed -i "s|@MAGICK_CFLAGS@|$(pkg-config --cflags ImageMagick)|" autotrace.pc
}
check() {
  make -C "${_pkgname}" check
}
package() {
  cd "$_pkgname"
  DESTDIR="${pkgdir}" make install
}
# vim:set ts=2 sw=2 et:
