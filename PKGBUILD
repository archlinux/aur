# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=single-file
pkgver=0.3.29
pkgrel=1
pkgdesc="Command line tool to download a web page into a single HTML file"
arch=('any')
url="https://github.com/gildas-lormeau/SingleFile"
license=('AGPL3')
depends=('nodejs')
makedepends=('npm')
optdepends=(
  'chromium: for webdriver-chromium backend'
  'playwright: for playwright-{firefox,chromium} backend'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('cc120150883d89900a85771ab6e4d69718b62179889b1dc5d2f1520cd55477dfe917d9e8a899d253cfd571ca21047ddb41c651f14e9327c2e80361f3fb884c76')

package() {
  local NPM_FLAGS=(--no-audit --no-fund --no-update-notifier)
  npm install \
    --global \
    --prefix "${pkgdir}/usr" \
    "${NPM_FLAGS[@]}" \
    "$pkgname-$pkgver.tar.gz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  cd "$pkgdir/usr/lib/node_modules/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.MD

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
