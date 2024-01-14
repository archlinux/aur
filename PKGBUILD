# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='libcanlock'
pkgver=3.3.0
pkgrel=3
pkgdesc='Standalone, modern RFC 8315 Netnews Cancel-Lock implementation for Unix'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://micha.freeshell.org/libcanlock/'
license=('custom')
depends=('glibc')
provides=('canlock' 'libcanlock')
source=("${url}src/${pkgname}-${pkgver}.tar.bz2")
options=('lto')
changelog="$pkgname.changelog"

# Taken from $url/src/info.html
sha256sums=('a709f59d6611031c293b483cfa0be6c37d6c68220cc94aee44e4a9eabf76988d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"

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

  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README  "$pkgdir/usr/share/doc/$pkgname/README"
}

b2sums=(
  '001512a6d2d226aed93882de8d8f4f02a066cc67e6f21b411b8e1ee2ff0d4580732c90a6fc2756a79f992629cd18fbc319510960c39f33284c86bebfed3d4216'
)

# eof
