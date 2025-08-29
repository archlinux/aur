# Maintainer: tarball <bootctl@gmail.com>

pkgname=silverbullet
pkgver=2.0.0
pkgrel=1
pkgdesc='Clean Markdown-based writing/note taking application'
arch=(any)
url='https://github.com/silverbulletmd/silverbullet'
license=(MIT)
depends=(deno)
backup=("etc/default/$pkgname")
install=$pkgname.install
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "$pkgname-system.service"
  "$pkgname-user.service"
  "$pkgname.sh"
)
sha256sums=('997f2d7c69eef7c59bf69f46b11d67bcd26791948f438d5a60191a5dd0fbd65c'
            'b78a5957a4475ed7173915fea4a7bfb4c3a92008ad85e3e4b4c5ba07430e6c17'
            '5f01fe05f871f60277508f8cf39e879a7db18f1ff45c1ef7b2359089bfe1a0bd'
            '68671a106bce3883714f4c6f3cc3ea9d5162e18c1d72f28f59b806ed107b2fa6')

build() {
  cd "$pkgname-$pkgver"
  deno task build
  deno task bundle
}

check() {
  cd "$pkgname-$pkgver"
  TZ=UTC deno task test
}

package() {
  install -Dm755 /dev/stdin "$pkgdir/etc/default/$pkgname" <<EOF
HOST=localhost
PORT=3000
EOF

  install -Dm644 "$pkgname-system.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  install -Dm644 "$pkgname-user.service" \
    "$pkgdir/usr/lib/systemd/user/$pkgname.service"

  install -Dm755 "$pkgname.sh" \
    "$pkgdir/usr/bin/$pkgname"

  cd "$pkgname-$pkgver"

  install -Dm644 "dist/$pkgname.js" \
    "$pkgdir/usr/lib/$pkgname/$pkgname.js"

  install -Dm644 LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
