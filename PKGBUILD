# -*- mode: sh -*-

# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>

pkgname='bc-gh'
pkgver=7.0.2
pkgrel=1
pkgdesc='Implementation of dc and POSIX bc with GNU extensions'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/gavinhoward/bc'
license=('BSD-2-Clause')  # SPDX-License-Identifier: BSD-2-Clause
provides=('bc' 'dc')
conflicts=('bc')
depends=('glibc' 'libedit')
options=('lto' '!makeflags')
source=(
  "$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/bc-$pkgver.tar.xz"
  "$pkgname-$pkgver.tar.xz.sig::$url/releases/download/$pkgver/bc-$pkgver.tar.xz.sig"
)
sha512sums=(
  'deac1ffa11562b71ec9c238d375e16d46b63b7330092ef43e38f087fc5f9c813adb6fa352aab45cb96a17206de3d2d2e62825aef19ff9aed72ea63fc3b9ea603'
  '2cbce0d3cc76c22ec37cde027c0abd36e85d2476980185195913464f425230bb293a73e4d4f6e276ca812ff93db43f7e882ae9e782c9ea4bbee053e01e22874a'
)
sha256sums=(
  '5cdaa73e42deda936bdcdb668eeaa6bc0567cac820914744a6824595fa13da1d'
  'c84b86f6f32d8ed37881529de2b1f8fd4f4590fe8a3c4bed09930f8f82b46e8d'
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
    {MEMORY_BUGS,NEWS,NOTICE,README}.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE.md
}

# eof
