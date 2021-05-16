# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=homebridge
pkgver=1.3.4
pkgrel=1
pkgdesc="HomeKit support for the impatient"
arch=('any')
url="https://github.com/homebridge/homebridge"
license=('Apache')
depends=(
  'nodejs'
  'avahi'
)
makedepends=(
  'git'
  'npm'
  'python'
  'node-gyp'
)
optdepends=(
  'homebridge-config-ui-x'
)
options=('!emptydirs' '!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('91a3cf0e1b174f2122d23a13e3c3b45843f8ce6391f1b9684ffc0d5044e51e8412f85625bbe1aaec4f9fbd4ddc0958091a3310e5d3e4ccfe2e406b3a7fe36e41')

build() {
  cd "$pkgname-$pkgver"
  
  # install dependencies
  npm install

  # generate dist dir
  npm run build

  # generate tarball
  npm pack
}

package() {
  cd "$pkgname-$pkgver"
  npm install --global --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver/$pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
 
  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE"
}
