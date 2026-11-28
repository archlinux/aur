# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Comtributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname='ngs-lang-git'
_pkgname="${pkgname/-git}"
pkgdesc='NGS: Next Generation Shell (development version)'
pkgver=0.3.0.r0.g98aee950
pkgrel=2
epoch=1
url='https://github.com/ngs-lang/ngs'
changelog="$_pkgname.changelog"
arch=('aarch64' 'x86_64')
license=('GPL-3.0-or-later')
makedepends=(
  'cmake'
  'git'
  'pandoc'
  'peg'
  'uthash'
)
depends=(
  'gc'
  'glibc'
  'json-c'
  'libffi'
  'pcre2'
)
provides=('ngs' "$_pkgname")
conflicts=("${provides[@]}")
source=('git+https://github.com/ngs-lang/ngs.git')
sha256sums=('SKIP')

pkgver() {
  cd 'ngs'

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

prepare() {
  cd 'ngs'

  sed -i 's@^link_directories@#link_directories@g'       CMakeLists.txt
  sed -i 's@/usr/local/include /opt/homebrew/include@@g' CMakeLists.txt

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
}

build() {
  make PREFIX=/usr -C 'ngs/build'
}

check() {
  cd 'ngs/build'

  ctest || true
}

package() {
  cd 'ngs/build'

  make install

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    ../{CHANGELOG,readme}.md ../one-liners.txt

  cd "$pkgdir"

  rm -rf usr/share/doc/NGS

  cd "$pkgdir/usr/share/doc" && {
    ln -sr "$pkgname"  ngs
    ln -sr "$pkgname" "$_pkgname"
  }
}

# vim: ts=2 sw=2 et:
