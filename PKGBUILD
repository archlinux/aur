# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=antora
pkgname=(
  antora-cli
  antora-site-generator
)
pkgver=3.1.5
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
  '1d76ce443ae2af95170241b66d028330fdd338c3a8c112e3263e331af8722b9e'
  '4da915f0b453573ff72aececb9c5f9f95cf20a3937b20a7ee5b8e3c5f14515cc'
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
