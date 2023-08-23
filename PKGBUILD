# Maintainer: tarball <bootctl@gmail.com>

pkgname=silverbullet
pkgver=0.3.11
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
sha256sums=('d0c7272fca7b3c8b1c8ff43f35f6a4abf35c1dac2e7df320ed062e94968578dd'
            '5309053371a003f3c32365eb15dbd38118ab2409a0a5737854261f821fe253a3')

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
