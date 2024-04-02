# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='timestampit'
pkgver=0.3.4
pkgrel=1
pkgdesc='Prefix each input line with a date/time stamp (formerly timestamp/stampit)'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url='https://codeberg.org/kas/timestampit'
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
depends=('glibc')
optdepends=('scdoc: for recompiling manual pages')
provides=('stampit' 'timestamp')
conflicts=('stampit' 'timestamp')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
options=('lto')

build() {
  cd "$pkgname"

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

  make -C src
}

package() {
  cd "$pkgname"

  make -C src PREFIX=/usr DESTDIR="$pkgdir" install
}

sha256sums=(
  '03b632c4e59d744949ab0876d2bfa7ef77e3194f220059b8da31bb59b2f35a27'
)
b2sums=(
  'ba7656f9a4040fcdbae8e013c49e21aea36311b0fef238d5093e7224f0b796414c322260a048b77da66a0381bab0294de138f28e01e59b53b0789ddfab4ce940'
)

# eof
