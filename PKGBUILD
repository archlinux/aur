# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=single-file-cli
pkgver=2.0.43
pkgrel=2
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
provides=(single-file)
replaces=(single-file)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('1533d10212a6f821c7fd79e1251660497a58d281138eb823d35a6426a7874143')

package() {
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  local moduledir="$pkgdir/usr/lib/node_modules/$pkgname"

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
