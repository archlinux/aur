# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=homebridge
pkgver=1.3.5
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
sha512sums=('92dea73ddfb4c66854c98dcfa5cc13f5642707c6077190119869c22c482a598af998646abb26dd9af631a29932786021e966bb648e40e86607c85f91b5813bcd')
b2sums=('704025bcb755a0a2568b9f291b6b20085dee95206524394d73800bd90014db27fb167b1ec94388aa6aae00b0896f3a557066869f64ae19f99489fc90c575eec2')

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
