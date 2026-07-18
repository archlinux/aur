# shellcheck shell=bash
# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='slang-snapshot'
_pkgname="${pkgname%-snapshot}"
pkgdesc='S-Lang is a powerful interpreted language (development snapshot)'
_pkgver=2.3.4-23
_prever="pre$_pkgver"
pkgver="${_pkgver//-/.}"
pkgrel=1
url='https://jedsoft.org/snapshots/'
changelog="$pkgname.changelog"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
depends=(
  'glibc'
  'libpng'
  'oniguruma'
  'pcre'
  'pcre2'
  'zlib'
)
provides=('libslang.so' 'slang' 'slsh')
conflicts=("${provides[@]}")
backup=('etc/slsh.rc')
source=("$url$_pkgname-$_prever.tar.gz")
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
# Taken from $url
md5sums=('e44eb4d1f189d52d608f532c992a53b5')

build() {
  cd "$_pkgname-$_prever"

  ./configure --prefix=/usr --sysconfdir=/etc

  make
}

check() {
  cd "$_pkgname-$_prever"

  test "Z$CARCH" != 'Zi686' && make check
}

package() {
  cd "$_pkgname-$_prever"

  make PREFIX=/usr DESTDIR="$pkgdir" install-all

  cd "$pkgdir/usr/share/slsh"

  # Let's byte-compile *.sl for greater goodness
  # shellcheck disable=SC2016
  ../../bin/slsh -e '
    for ($1=0; $1<__argc; $1++) {
      $2 = __argv[$1];
      () = printf("Byte-compiling %s …", $2);
      byte_compile_file($2, 0);
      () = printf("\n");
    }
  ' ./*.sl ./*/*.sl

  # We shouldn't have byte-compiled this, as it
  # contains both the client and the server code.
  rm -vf sldbsock.slc
}

# eof
