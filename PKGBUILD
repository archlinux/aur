# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Arjix <me@arjix.dev>
# Contributor: huyz

pkgname=gemini-cli-latest
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="Open-source AI agent that brings the power of Gemini directly into your terminal"
arch=(x86_64)
url="https://github.com/google-gemini/gemini-cli"
license=(Apache-2.0)
depends=(
  gcc-libs
  glibc
  nodejs
)
makedepends=(curl jq npm)
provides=("${pkgname%-latest}")
conflicts=("${pkgname%-latest}")

pkgver() {
    curl -s \
        -H "Accept: application/vnd.npm.install-v1+json" \
        https://registry.npmjs.org/@google/gemini-cli | jq -r '."dist-tags".latest'
}

prepare() {
    curl -L -o "${pkgname%-latest}-$pkgver.tgz" \
        "https://registry.npmjs.org/@google/${pkgname%-latest}/-/${pkgname%-latest}-$pkgver.tgz"
}

package() {
  npm install --global --omit=dev \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    $pkgname-$pkgver.tgz

  # Remove unnecessary files causing namcap warnings
  rm -r "$pkgdir/usr/lib/node_modules/@google/gemini-cli/node_modules/marked/man"
  rm "$pkgdir/usr/lib/node_modules/@google/gemini-cli/node_modules/shell-quote/print.py"
  rm "$pkgdir/usr/lib/node_modules/@google/gemini-cli/node_modules/open/xdg-open"
}
