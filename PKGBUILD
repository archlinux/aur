# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=pev2-electron
_pkgname=pev2
pkgver=1.15.0
pkgrel=1
pkgdesc="Postgres Explain Visualizer 2, using the system Electron package"
arch=(any)
url="https://github.com/dalibo/pev2"
license=(PostgreSQL)
depends=(
  electron
  sh
)
makedepends=(npm)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "pev2.sh"
  "pev2.desktop"
  "remove-demo-notice.patch"
)
sha256sums=(
  '81a2d6e52f1da878318ddeea48d0cec700fe0573d68edfcf724ef5bb395e4123'
  'd4361d563a1c199b5887154ac5f4d8009dc2c882b409c8f4bbf00281a2e910e4'
  '219229650df88bf6f8ffc0bb53bf2986a479d0144c0fa93949996b58ed4e7d8e'
  '4e6d2bf9298e95e63e7bba7f2e96cfef031c0b77da88ed2e7bf0106b880f283b'
)

prepare() {
  cd $_pkgname-$pkgver
  patch --forward --strip=1 --input="$srcdir/remove-demo-notice.patch"
  sed -i 's/.*husky.*//' package.json
}

build() {
  cd $_pkgname-$pkgver
  npm install --cache "$srcdir/npm-cache" .
  npm run build
}

package() {
  cd $_pkgname-$pkgver
  install -vDm644 -t "$pkgdir/usr/lib/pev2" dist-app/index.html
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/pev2.desktop"
  install -vDm755 "$srcdir/pev2.sh" "$pkgdir/usr/bin/pev2"
}
