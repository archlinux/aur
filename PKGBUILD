# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=homebridge
pkgver=1.4.0
pkgrel=1
pkgdesc="HomeKit support for the impatient"
arch=('any')
url="https://github.com/homebridge/homebridge"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
optdepends=('homebridge-config-ui-x: for web-based management tool')
options=('!emptydirs' '!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('51f9490f01f0b0c03f0d74852c84689053806a8f42d64884c4d6a0f50c539e2a79b4df73fe49824ddffd664cf064b98184b298d2298c7da36a9bb8e8c71e2fab')
b2sums=('6f8a8a17b7b5c4ae89d7df2dce986072548735f61cf9a7cf5fc0394a974e5ff3b039e7e40324aa577c8e8c3096f42b05353a698f3649bbba8a727e02f58fc304')

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
