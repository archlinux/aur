# Maintainer: tarball <bootctl@gmail.com>

pkgname=silverbullet
pkgver=0.3.3
pkgrel=1
pkgdesc='A clean Markdown-based writing/note taking application'
arch=(any)
url='https://github.com/silverbulletmd/silverbullet'
license=(MIT)
depends=(deno)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "$pkgname.service"
)
sha256sums=('96a04003254050026e478a58e2aa5a783735ed53b92b41fa225d12252473dfe7'
            '5309053371a003f3c32365eb15dbd38118ab2409a0a5737854261f821fe253a3')

build() {
  cd "$pkgname-$pkgver"
  deno task build
  deno task bundle
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
