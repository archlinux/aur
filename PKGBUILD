# shellcheck shell=bash
# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='libcanlock'
pkgdesc='Standalone, modern RFC 8315 Netnews Cancel-Lock implementation for Unix'
pkgver=3.3.4
pkgrel=1
url='https://micha.freeshell.org/libcanlock/'
changelog="$pkgname.changelog"
arch=('aarch64' 'armv7h' 'x86_64')
license=('BSD-3-Clause' 'ICU' 'NLPL')
depends=('glibc')
provides=('canlock' 'libcanlock')
source=("${url}src/${pkgname}-${pkgver}.tar.bz2")

# Taken from $url/src/info.html
sha256sums=('d3ec76ae2383c39df557b1d4bb3378b3f79c048d33609e666df0b8c652f813ca')

build() {
  cd "$srcdir/$pkgname-$pkgver"

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

  ./configure \
    --prefix=/usr \
    --enable-legacy-api \
    --enable-pc-files

  make
}

check() {
  make -C "$srcdir/$pkgname-$pkgver" test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSES/*.txt
}

# eof
