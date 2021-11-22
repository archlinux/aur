# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=homebridge
pkgver=1.3.8
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
sha512sums=('e209e9dde92c6ff539c3d56568acf5f4ed63b63abe15452f5d67c36db7240839f0c8bea36b71c601c855f535356aff52db0f9cd586959ce7ce7a7388185d8581')
b2sums=('9fe9019739c5e31113ed818129ab4559ee2871278088c18b6432440e832ae936f5ad1bc6cb6f792865e9a0db8a5b0be965dc71129138f0f00972eea44db8bb97')

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
