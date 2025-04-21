# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname='slxfig-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=0.2.0-138
_prever="pre$_pkgver"
pkgver="${_pkgver//-/.}"
pkgrel=3
pkgdesc='Xfig-based publication quality plotting package for the S-Lang interpreter (development snapshot)'
arch=('aarch64' 'x86_64')
url='https://jedsoft.org/snapshots/'
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
depends=('glibc' 'slang')
makedepends=('slsh')
provides=('slxfig')
conflicts=("${provides[@]}")
options=('!makeflags')
source=("${url}${_pkgname}-$_prever.tar.gz")
md5sums=('254b43911f88cd2c02d81c7eb982f085')               # Taken from $url
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
changelog="$pkgname.changelog"

build() {
  cd "$_pkgname-$_prever"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$_pkgname-$_prever"

  make DESTDIR="$pkgdir" install

  # Change permissions of the gcontour module: 0644 → 0755
  chmod -v 0755 "$pkgdir/usr/lib/slang/v2/modules/gcontour-module.so"

  # Install extra documentation
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    changes.txt INSTALL README TODO doc/text/slxfig.txt

  cp -vfax examples "$pkgdir/usr/share/doc/$pkgname/"

  # Byte-compile S-Lang files
  cd "$pkgdir/usr/share/slsh/local-packages/"
  # shellcheck disable=SC2016
  slsh -e '
    for ($1=0; $1<__argc; $1++) {
      $2 = __argv[$1];
      () = printf("Byte-compiling %s …", $2);
      byte_compile_file($2, 0);
      () = printf("\n");
    }
  ' ./*.sl ./*/*.sl
}

b2sums=(
  '8819329e3ec2da03e690a0b3c85369b33210b2a95e5a4480a536148593790b83a0e0f0c301ee962ddd55ec9bb01034fb757c8aefc6dd048a7051702d05200c89'
)

# eof
