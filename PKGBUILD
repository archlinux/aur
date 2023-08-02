# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=bdash
pkgver=1.16.2
pkgrel=1
pkgdesc='Simple business intelligence application'
arch=('x86_64')
url='https://github.com/bdash-app/bdash'
license=('MIT')
depends=('gtk3' 'nss' 'libxss')
makedepends=('node-gyp' 'python' 'yarn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bdash-app/bdash/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"

  yarn install --no-progress
  # --openssl-legacy-provider is needed for https://github.com/webpack/webpack/issues/14532
  NODE_OPTIONS=--openssl-legacy-provider yarn run webpack --env BUILD_ENV=production --mode=production
  yarn run electron-builder build --linux dir --x64
}

package() {
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  mv "$pkgname-$pkgver/dist/production/linux-unpacked" "$pkgdir/opt/bdash"
  ln -s /opt/bdash/bdash "$pkgdir/usr/bin/bdash"
}

# vim: set ft=sh:

sha512sums=('14f67ea22dc61a5899f11dd1c6de5815c76e6391946011557d943869bcb1e611d2e9de92134d18d5092c9e7d151aefd67b0a706b3d0ec42da6de4488ba6f0204')
