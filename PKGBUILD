# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=homebridge
pkgver=1.3.4
pkgrel=2
pkgdesc="HomeKit support for the impatient"
arch=('any')
url="https://github.com/homebridge/homebridge"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
optdepends=('homebridge-config-ui-x: for web-based management tool')
options=('!emptydirs' '!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('91a3cf0e1b174f2122d23a13e3c3b45843f8ce6391f1b9684ffc0d5044e51e8412f85625bbe1aaec4f9fbd4ddc0958091a3310e5d3e4ccfe2e406b3a7fe36e41')

build() {
  cd "$pkgname-$pkgver"

  # NOTE: package is built this way because the dist/ directory is not
  # included in the source, only in npm source due to a prepublish script
  # which does not get installed correctly if the npm source is used.
  
  # install dependencies
  npm install

  # generate dist dir
  npm run build

  # generate tarball
  npm pack
}

package() {
  cd "$pkgname-$pkgver"
  npm install --global --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
