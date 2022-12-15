# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=antora
pkgname=(
  antora-cli
  antora-site-generator
)
pkgver=3.1.2
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
  '993beb449769c8ea89cf9de42503c4f123fee8040eecdc1cc5a61502ddcf1b38'
  'cb68e1d85410fd03c00b517f9ffe731d4543e3114aeeed41eb75983cfc9338f1'
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
