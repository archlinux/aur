# Maintainer: tarball <bootctl@gmail.com>

pkgname=silverbullet
pkgver=0.5.1
pkgrel=1
pkgdesc='Clean Markdown-based writing/note taking application'
arch=(any)
url='https://github.com/silverbulletmd/silverbullet'
license=(MIT)
depends=(deno)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "$pkgname.service"
)
sha256sums=('d7d1d7192be687bf0ebab84a0b5cd29abc76dbcf758c03bced7c3363dcd77349'
            'b32f789c76e6db00e69bfbb7b00567dbb84104a723b3130e1afe55b7a72bbb59')

build() {
  cd "$pkgname-$pkgver"
  deno task build
  deno task bundle
}

check() {
  cd "$pkgname-$pkgver"
  deno task test
}

package() {
  install -dm755 "$pkgdir/etc/default"

  cat >"$pkgdir/etc/default/$pkgname" <<EOF
HOST=localhost
PORT=3000
EOF

  install -Dm644 "$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  cd "$pkgname-$pkgver"

  install -Dm644 "dist/$pkgname.js" \
    "$pkgdir/usr/lib/$pkgname/$pkgname.js"

  install -Dm644 LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
