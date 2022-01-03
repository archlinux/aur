# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=tailwindcss
pkgver=3.0.9
pkgrel=1
pkgdesc="Standalone version of Tailwind CLI"
arch=('x86_64')
url="https://tailwindcss.com"
license=('MIT')
depends=('gcc-libs')
makedepends=('nodejs-lts-gallium' 'npm')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tailwindlabs/tailwindcss/archive/v$pkgver.tar.gz")
sha512sums=('600563f9200e726bb7fc3f8725a311bbe1804a28a5d61d7ac157a6133acfce0a0f814e45454a5015d35f845f26feaf96aec090745875ba691d2e9d167e8ec2d2')
b2sums=('c40a12cdffe7e8815972368166e1b14dc6147850728a66ac168529a722fc33123af080b56bdf459bb39d2adf1339c3bd092f52f605158474c6bd941d9ef74212')

build() {
  cd "$pkgname-$pkgver"

  # build tailwindcss
  npm run prepublishOnly

  cd standalone-cli

  # install dependencies
  npm install

  # generate binary
  npx pkg standalone.js \
    --output dist/tailwindcss-linux-x64 \
    --compress Brotli \
    --targets node16-linux-x64 \
    --no-bytecode \
    --public-packages "*" \
    --public
}

check() {
  cd "$pkgname-$pkgver/standalone-cli"

  npm test
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 standalone-cli/dist/tailwindcss-linux-x64 "$pkgdir/usr/bin/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
