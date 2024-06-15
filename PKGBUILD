# -*- mode: sh -*-

# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>

pkgname='bc-gh'
pkgver=6.7.6
pkgrel=1
pkgdesc='Implementation of dc and POSIX bc with GNU extensions'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/gavinhoward/bc'
license=('BSD-2-Clause')  # SPDX-License-Identifier: BSD-2-Clause
provides=('bc')
conflicts=('bc')
depends=('glibc' 'libedit')
options=('lto' '!makeflags')
source=(
  "$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/bc-$pkgver.tar.xz"
  "$pkgname-$pkgver.tar.xz.sig::$url/releases/download/$pkgver/bc-$pkgver.tar.xz.sig"
)
sha512sums=(
  '418ce61e8151a548627b794692325f48c68f8cedca7a0cb8d896bb74510f55b33486214af0af1b160c1f387f3d034300dff6fbc29c2d44d7b304a7a37c3c478b'
  'd25ef2fdd03b59156b2856d278779ebb8ee28e495444ac6ab71b4b352b957ff378b5f69ef81aa71a0cd3fb1607e5c4e09bea90a05bbbb0bb4d7a3c12c04fb55d'
)
sha256sums=(
  '828f390c2a552cadbc8c8ad5fde6eeaee398dc8d59d706559158330f3629ce35'
  'e25673e6ed8f22919d19e60254cc1330e6f9c905188a8e6233f51548f90b9ee1'
)
validpgpkeys=('FF360647C7A7147F27DAAEC1B132F881C306590A')

build() {
  cd "bc-$pkgver"

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "Z${CARCH:-unknown}" in
    'Zx86_64' | 'Zi386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  env CFLAGS="$CFLAGS -O3" \
    PREFIX=/usr ./configure.sh -p GNU -e -G -sbc.banner -sdc.tty_mode

  make
}

check() {
  cd "bc-$pkgver"

  env LANG=C LC_ALL=C make check
}

package() {
  cd "bc-$pkgver"

  DESTDIR="$pkgdir" make install

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {NEWS,NOTICE,README}.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE.md
}

# eof
