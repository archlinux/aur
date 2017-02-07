# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=bdash
pkgver=1.0.0
pkgrel=1
pkgdesc='Simple business intelligence application'
arch=('x86_64')
url='https://github.com/bdash-app/bdash'
license=('MIT')
depends=('gtk2' 'nss' 'alsa-lib' 'libxss' 'gconf' 'libxtst')
makedepends=('python2' 'python' 'npm' 'yarn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bdash-app/bdash/archive/$pkgver.tar.gz")
sha512sums=('376a213a787f660d842d57f4fa6e6e7e24fd60b4adaa5c5fe8897f2f2a006021255b2d597246ea955f92f94212aec1f34147b2aa29a3f1f2dc4f8941fde3605b')

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
    --icon=assets/icon.icns \
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
