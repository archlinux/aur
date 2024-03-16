# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=single-file
_pkgname=single-file-cli
pkgver=2.0.34
pkgrel=1
pkgdesc="CLI tool for saving a faithful copy of a complete web page in a single HTML file"
arch=(any)
url="https://github.com/gildas-lormeau/single-file-cli"
license=(AGPL-3.0-or-later)
depends=(nodejs)
makedepends=(npm)
optdepends=(
  'chromium: for webdriver-chromium backend'
  'playwright: for playwright-{firefox,chromium} backend'
)
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha256sums=('347d834bf0c80306981094c6c62ddf5a5bd55132d452d402b8afc4ddc1af878d')

package() {
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$_pkgname-$pkgver.tgz"

  local moduledir="$pkgdir/usr/lib/node_modules/$_pkgname"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$moduledir/README.MD"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$moduledir/LICENSE"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # Remove unnecessary scripts to silence namcap warnings
  rm \
    "$pkgdir/usr/lib/node_modules/single-file-cli/single-file" \
    "$pkgdir/usr/lib/node_modules/single-file-cli/build.sh" \
    "$pkgdir/usr/lib/node_modules/single-file-cli/compile.sh" \
    "$pkgdir/usr/lib/node_modules/single-file-cli/dev-build.sh"
}
