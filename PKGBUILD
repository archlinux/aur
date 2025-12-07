# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=pev2-electron
_pkgname=pev2
pkgver=1.19.0
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
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  "$pkgname-remove-demo-notice.patch"
  "pev2.sh"
  "pev2.desktop"
)
sha512sums=(
  '97a2bd208dae3a7c821b273236affe02cd4d1418e8b4fbbe7aeee054fe12250ea563f21f7da67aaf5d085927c2fdcfce0b7308269651c3bc4c26fe66ca7e0974'
  'e3c854c6230b3743f761e5eaaa94ec1b8c04c7cac9eca56acf29790f58306d590d761d803eeeb278e30ba3a09665f83643281e1d775fa8f342339152b7cfce1d'
  'bb3d507436409726d48fbacbaf48cc40909baf31c168b47aebbc21d136e8a75ae2292e244b51227b465d470f42cbafbb056bed97a900133d3c63214f0a4d839e'
  '4131cef58d61c2c6646e2c65ca0c4e09f90a8947a4c715d0c61561dfd0ca1f417ef9f3ec24d3949af9e2e20f86e9006283d4b638ac3910fbe08f9941b6c9bb0a'
)

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 < ../$pkgname-remove-demo-notice.patch
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
