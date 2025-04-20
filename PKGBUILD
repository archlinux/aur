# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='libcanlock'
pkgver=3.3.1
pkgrel=1
pkgdesc='Standalone, modern RFC 8315 Netnews Cancel-Lock implementation for Unix'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://micha.freeshell.org/libcanlock/'
license=(
  'BSD-3-Clause'        # SPDX-License-Identifier: BSD-3-Clause
  'ICU'                 # SPDX-License-Identifier: ICU
)
depends=('glibc')
provides=('canlock' 'libcanlock')
source=("${url}src/${pkgname}-${pkgver}.tar.bz2")
options=('lto')
changelog="$pkgname.changelog"

# Taken from $url/src/info.html
sha256sums=('5acd6d59e1fdf2a8507887137cf7f3e862fec0c21cc079bba7068abf03e881d9')

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
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -vDm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for _ext in "${license[@]}"; do
    ln -vrsf "$pkgdir/usr/share/licenses/$pkgname/LICENSE" \
             "$pkgdir/usr/share/licenses/$pkgname/LICENSE.$_ext"
  done
  install -vDm0644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# eof
