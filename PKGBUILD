# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=tailwindcss
pkgver=3.0.8
pkgrel=1
pkgdesc="Standalone version of Tailwind CLI"
arch=('x86_64')
url="https://tailwindcss.com"
license=('MIT')
depends=('gcc-libs')
makedepends=('nodejs-lts-gallium' 'npm')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tailwindlabs/tailwindcss/archive/v$pkgver.tar.gz")
sha512sums=('bf58526d7f193edecb75decd59f920b75b942f298134945eea767611c61e1598f880953d97bd66d7adee449f42d15763372e3f739ac56ebcd8d954fdd6df30bf')
b2sums=('91bb564c0185fd80d9aeee22813330ba32b31ac7d55a86b4a22722d4fd9b7a27ee8b892d87c1e13d45577f0604829fb09f514af29063a1c4540540a0a293563d')

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
