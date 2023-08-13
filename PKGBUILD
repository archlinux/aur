# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=homebridge
pkgver=1.6.1
pkgrel=1
pkgdesc='HomeKit support for the impatient'
arch=('any')
url='https://github.com/homebridge/homebridge'
license=('Apache')
depends=('nodejs')
makedepends=('npm')
optdepends=('homebridge-config-ui-x: for web-based management tool')
options=('!emptydirs' '!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0e5b5d5109abd0643250b2b60e563e74649472a21b81bb38daaa93b7163f0d2503e52964dc84a41e6b7e10481fef414c5af4a867709c8f3dea9e7e52ffedd92a')
b2sums=('becc11d1d7d262a6eff9a1a086d3f2925bf6d34b9f5ef77d71c8a29feb0db44b6c254afbea205ee999c10bf6688d79611e574a21025e29236d8f1a8446af4f0c')

build() {
  cd "$pkgname-$pkgver"

  # NOTE: package is built this way because the dist/ directory is not
  # included in the source, only in npm source due to a prepublish script
  # which does not get installed correctly if the npm source is used.
  export NPM_FLAGS=(--no-audit --no-fund --no-update-notifier)

  # install dependencies
  npm install "${NPM_FLAGS[@]}"

  # generate dist dir
  npm run build "${NPM_FLAGS[@]}"

  # generate tarball
  npm pack "${NPM_FLAGS[@]}"
}

package() {
  cd "$pkgname-$pkgver"
  npm install \
    --global \
    --prefix "$pkgdir/usr" \
    "${NPM_FLAGS[@]}" \
    "$pkgname-$pkgver.tgz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  unset NPM_FLAGS
}
