# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=single-file
_pkgname=single-file-cli
pkgver=1.1.54
pkgrel=1
pkgdesc="CLI tool for saving a faithful copy of a complete web page in a single HTML file"
arch=(x86_64)
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
sha256sums=('4a09745784b6ee3d11d931ab04e7f50172e75e1b4ada72a6b4e484c74f05847f')

package() {
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$_pkgname-$pkgver.tgz"

  local moduledir="$pkgdir/usr/lib/node_modules/$_pkgname"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$moduledir/README.MD"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$moduledir/LICENSE"

  # Remove MacOS binaries
  rm -r "$moduledir/node_modules/selenium-webdriver/bin/macos"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
