# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='slang-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=2.3.4-20
_prever="pre$_pkgver"
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc='S-Lang is a powerful interpreted language (development snapshot)'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
provides=('libslang.so' 'slang' 'slsh')
conflicts=('libslang.so' 'slang' 'slsh')
url='https://jedsoft.org/snapshots/'
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
depends=(
  'glibc'
  'libpng'
  'oniguruma'
  'pcre'
  'zlib'
)
backup=('etc/slsh.rc')
options=('!makeflags')
source=("$url$_pkgname-$_prever.tar.gz")
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
# Taken from $url
md5sums=('105b3b6578fda3c0cedf9125d1c6ecba')
changelog="$pkgname.changelog"

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

# Calculated
b2sums=(
  'dd8a66c85f20625be9e496aac54cc8e1089b03d4c704ac83025bef85422e5f3de0e9ef3804ca922c486476b3337f62e711f12f899e12ba183f1c8ee3e8264e97'
)

# eof
