# Maintainer: tarball <bootctl@gmail.com>

pkgname=silverbullet
pkgver=0.3.2
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
sha256sums=('e304c83894a006638f653c82a9771aa4b46ba5917c2aefa892dc85826d7a25ce'
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
