# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=tailwindcss
pkgver=3.0.11
pkgrel=1
pkgdesc="Standalone version of Tailwind CLI"
arch=('x86_64')
url="https://tailwindcss.com"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'nodejs-lts-gallium' 'npm')
options=('!strip')
_commit='8e0ccda1a158e3d2164c5cea778f0761ec8a0eaf'
source=("$pkgname::git+https://github.com/tailwindlabs/tailwindcss.git#commit=$_commit")
md5sums=('SKIP')

pkgdesc() {
  cd "$pkgname"
  git describe --tags | sed 's/^[vV]//;s/-/+/g'
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
