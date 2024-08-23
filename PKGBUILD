# -*- mode: sh -*-

# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>

pkgname='bc-gh'
pkgver=7.0.0
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
  'ef89525eea8773dddb7efd3dd33f589de287ac807b772480e884bd666f29b2b0b362c999029cc6d82733f830195ca3f6fd867f15190fbcbf807ddbc4b24abb65'
  '189a769cb328a83dd83ddc64b0e03943973cbde5c40f9950fd0a5077987c6548d5369f29d1ecef1791d95fcd4adf0548396a70ab308471020e48189b62612db3'
)
sha256sums=(
  '301dc2a5cac6b01eb6d0e56b487cc01b6bdd02c9dab526779cbf9c54afe88fb5'
  'e1ca4ce1ee3fcf6414425615ab4d2a5f3d60d3770e79bf301d7402344858d03c'
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
