# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=antora
pkgname=(
  antora-cli
  antora-site-generator
)
pkgver=3.0.1
pkgrel=1
pkgdesc="A modular documentation site generator"
arch=('any')
url="https://antora.org"
license=('MPL2')
depends=('nodejs')
makedepends=('npm')
source=(
  "https://registry.npmjs.org/@$pkgbase/cli/-/cli-$pkgver.tgz"
  "https://registry.npmjs.org/@$pkgbase/site-generator/-/site-generator-$pkgver.tgz"
)
noextract=(
  "cli-$pkgver.tgz"
  "site-generator-$pkgver.tgz"
)
sha256sums=(
  'ffe7ec8eb3a76a4d4224e188f467aa0f1638b214ecffb2597e15484a0ea09c54'
  'be89c14c51dd9c32b7048488f16d47999b3bdb833b76b22318162b395e723745'
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
