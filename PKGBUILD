# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=antora
pkgname=(
  antora-cli
  antora-site-generator-default
)
pkgver=2.3.4
pkgrel=1
pkgdesc="A modular documentation site generator"
arch=('any')
url="https://antora.org"
license=('MPL2')
depends=('nodejs')
makedepends=('npm')
source=(
  "https://registry.npmjs.org/@$pkgbase/cli/-/cli-$pkgver.tgz"
  "https://registry.npmjs.org/@$pkgbase/site-generator-default/-/site-generator-default-$pkgver.tgz"
)
noextract=(
 "cli-$pkgver.tgz"
 "site-generator-default-$pkgver.tgz"
)
sha256sums=(
 'b496b2a1f4ae02f4e792811eeb66a3d912d7c59087ea7cbb2091cbff38764c57'
 'cbfbade98643696108b90bcf27be1024271307bf1a9ac36c03763a3b7f494afe'
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

package_antora-site-generator-default() {
  _package site-generator-default
}
