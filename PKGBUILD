# Maintainer: Vinay <vinayydv3695@github.com>

pkgname=telecord
pkgver=1.0.0
pkgrel=1
pkgdesc="Export Discord chat from JSON, or CSV , TXT to Telegram including media, via CLI"
arch=('any')
url="https://github.com/vinayydv3695/telecord"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vinayydv3695/telecord/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e0ddcdb64bf04b441acd0285e842742aa58359586965ccb6382cdb1900159dd5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm ci --production
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install main project files into /usr/lib/telecord
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r assets lib node_modules package.json package-lock.json telecord.js "$pkgdir/usr/lib/$pkgname"

  # Create a small launcher script in /usr/bin
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
exec node /usr/lib/$pkgname/telecord.js "\$@"
EOF

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install license properly
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

