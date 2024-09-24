# -*- mode: sh -*-

# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>

pkgname='bc-gh'
pkgver=7.0.3
pkgrel=2
pkgdesc='Implementation of dc and POSIX bc with GNU extensions'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/gavinhoward/bc'
changelog="$pkgname.changelog"
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
  '40bd059eda5df30fe41a4683a51727af7c9d0df48eb795c3c0afff0740cb4b4e719a6135203ebacb27617d9721a78c24f3ec3107c676aafa2808f73313084cd7'
  '5bbae9108b8c298fe6ccd4de6b18900d7e619f0165dd26f3e1b1ef15b1932b58627bb88f81426d7c266f3cdd838a4d50e08934b21e73e89801d725b1281ef0d2'
)
sha256sums=(
  '91eb74caed0ee6655b669711a4f350c25579778694df248e28363318e03c7fc4'
  'd06faa5c5441abe2dfd7ec964bec7d2ca99c6fb88aa81ac1541c8dab952fb73f'
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
