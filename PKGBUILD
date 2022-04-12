# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=tailwindcss
pkgver=3.0.24
pkgrel=1
pkgdesc="Standalone version of Tailwind CLI"
arch=('x86_64')
url="https://tailwindcss.com"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'nodejs-lts-gallium' 'npm')
options=('!strip')
_commit='23a6d3ff8498bb3f63592810b2677e4773a3f7a4'
source=("$pkgname::git+https://github.com/tailwindlabs/tailwindcss.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^[vV]//'
}

build() {
  cd "$pkgname"

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
  cd "$pkgname/standalone-cli"

  npm test
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 standalone-cli/dist/tailwindcss-linux-x64 "$pkgdir/usr/bin/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
