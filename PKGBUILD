# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=homebridge
pkgver=1.5.1
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
sha512sums=('6556a7a29b9a1d5ae20dfa854ab4e8c5acf4360ac06ec4c4a9c80f6ede85a2db4f387b574585b1e1a6f315d57704b21d217c17f7d5e0aeeab8013d6c4dd1a538')
b2sums=('f74d10555f4eba8a05bc4b1d6f8bae47072ad78b82262d11000a5cb4036140ea6961e5bba33d0810a365877e8753c86136d810b0e35a6496cd8106cfb29db4b4')

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
