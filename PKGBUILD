# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=antora
pkgname=(
  antora-cli
  antora-site-generator
)
pkgver=3.1.3
pkgrel=1
pkgdesc="A modular documentation site generator"
arch=(any)
url="https://antora.org"
license=(MPL2)
depends=(nodejs)
makedepends=(npm)
source=(
  "https://registry.npmjs.org/@$pkgbase/cli/-/cli-$pkgver.tgz"
  "https://registry.npmjs.org/@$pkgbase/site-generator/-/site-generator-$pkgver.tgz"
)
noextract=(
  "cli-$pkgver.tgz"
  "site-generator-$pkgver.tgz"
)
sha256sums=(
  '95b4541f43d30222ad797ed946665245608db7b6256d8d07ca4bcc924b9bde68'
  'dac277cfa5e4b46dbcd4292caa77ba8abe8a300453bba108147788137bf786f8'
)

_package() {
  _pkgname="$1"

  npm install --cache "$srcdir/npm-cache" -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}

package_antora-cli() {
  _package cli
}

package_antora-site-generator() {
  _package site-generator
}
