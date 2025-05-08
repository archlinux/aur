# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='slang-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=2.3.4-18
_prever="pre$_pkgver"
pkgver="${_pkgver//-/.}"
pkgrel=2
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
md5sums=('96faa6278e413b20fc64af3eb816626c')
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
  '8a1dd14afb72faa02bad1a66f7143586aafb7fe7309b7e87911dc2c73effc6192024499303eb6403790ea6c6442968f4627e9627e368ab98deca2fc104b214e6'
)

# eof
