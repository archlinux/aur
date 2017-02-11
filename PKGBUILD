# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=bdash
pkgver=1.1.0
pkgrel=1
pkgdesc='Simple business intelligence application'
arch=('x86_64')
url='https://github.com/bdash-app/bdash'
license=('MIT')
depends=('gtk2' 'nss' 'alsa-lib' 'libxss' 'gconf' 'libxtst')
makedepends=('python2' 'python' 'npm' 'yarn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bdash-app/bdash/archive/$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"

  yarn install --no-progress

  export NODE_ENV=production
  mkdir -p out/tmp
  cp -a app db yarn.lock package.json index.js .babelrc out/tmp
  cd out/tmp
  yarn install --no-progress
  cd -

  node_modules/.bin/electron-rebuild -p -m out/tmp -w sqlite3
  node_modules/.bin/electron-packager out/tmp Bdash \
    --asar=true \
    --platform=linux \
    --arch=x64 \
    --app-version=$pkgver \
    --build-verison=$pkgver \
    --app-copyright=hokaccha
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share"
  mkdir -p "$pkgdir/usr/bin"

  mv Bdash-linux-x64 "$pkgdir/usr/share/bdash"
  ln -s /usr/share/bdash/Bdash "$pkgdir/usr/bin/bdash"
}

# vim: set ft=sh:

sha512sums=('e6d5a56bb4849d2c0a0bedbd95b8fe6725e1952a1cbb6d0f400d048580ddcfbe8e2bf815424b91c0c3f08c76047ed4991cbfa0b899613757dcaca4dc2e6ff7b1')
