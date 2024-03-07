# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='timestampit'
pkgver=0.3.3.3
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
  '97d34cc5cde29cecef2ddf67b1b75401a58084b68493e669ec5dfb0a2f20da15'
)
b2sums=(
  '741b629856a57a0a760afe423faf94dd742875d658f8d341b4681d086952798bc7be2ea1d183ce43f99aa50928d19fa267987860f971a6a521fa24dc49535e4e'
)

# eof
