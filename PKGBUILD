# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=pev2-electron
_name=pev2
pkgver=1.8.0
pkgrel=2
pkgdesc="Postgres Explain Visualizer 2, using the system Electron package"
arch=(any)
url="https://github.com/dalibo/pev2"
license=(custom:PostgreSQL)
depends=(electron)
makedepends=(npm)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "pev2.sh"
  "pev2.desktop"
  "remove-demo-notice.patch"
)
sha256sums=(
  'a13f3c9825c482f4de072250ee7fc0e057fc73057c4b3f82440b4d4e658abb2e'
  'd4361d563a1c199b5887154ac5f4d8009dc2c882b409c8f4bbf00281a2e910e4'
  '219229650df88bf6f8ffc0bb53bf2986a479d0144c0fa93949996b58ed4e7d8e'
  'ebce556db5f905ecb26dca709bde78f94ba5ea325a934436099e51d76165f640'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/remove-demo-notice.patch"

  sed -i 's/.*husky.*//' package.json
}

build() {
  cd "$_archive"

  npm install --cache "${srcdir}/npm-cache" .
  npm run build
}

package() {
  cd "$_archive"

  install -Dm755 "$srcdir/pev2.sh" "$pkgdir/usr/bin/pev2"
  install -Dm644 "$srcdir/pev2.desktop" "$pkgdir/usr/share/applications/pev2.desktop"

  install -Dm644 dist-app/index.html "$pkgdir/usr/lib/pev2/index.html"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
