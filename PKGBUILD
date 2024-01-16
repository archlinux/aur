# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='slxfig-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=0.2.0-138
_prever="pre$_pkgver"
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc='Xfig-based publication quality plotting package for the S-Lang interpreter (development snapshot)'
arch=('aarch64' 'x86_64')
url='https://jedsoft.org/snapshots/'
license=('GPL-2.0-or-later')  # SPDX-License-Identifier: GPL-2.0-or-later
depends=('glibc' 'slang')
provides=('slxfig')
conflicts=('slxfig')
options=('lto' '!makeflags')
source=("${url}${_pkgname}-$_prever.tar.gz")
md5sums=('254b43911f88cd2c02d81c7eb982f085')               # Taken from $url
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
changelog="$pkgname.changelog"

build() {
  cd "$_pkgname-$_prever"

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "${CARCH:-unknown}" in
    'x86_64' | 'i386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname-$_prever"

  make DESTDIR="$pkgdir" install
  # Change permissions of the gcontour module: 0644 → 0755
  chmod 0755 "$pkgdir/usr/lib/slang/v2/modules/gcontour-module.so"

  # Install extra documentation
  for _doc in changes.txt INSTALL README TODO doc/text/slxfig.txt; do
    install -Dm0644 "$_doc" "$pkgdir/usr/share/doc/$pkgname/${_doc##*/}"
  done
  cp -fax examples "$pkgdir/usr/share/doc/$pkgname/"
}

sha256sums=(
  '7820457eb5961ef6619cf0319934f2d4e37bdf7bd195a759be1280510beaf0f1'
)
b2sums=(
  '8819329e3ec2da03e690a0b3c85369b33210b2a95e5a4480a536148593790b83a0e0f0c301ee962ddd55ec9bb01034fb757c8aefc6dd048a7051702d05200c89'
)

# eof
