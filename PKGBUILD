# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=single-file
pkgver=0.3.31
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
b2sums=('0da8a8b0fff33fea5269be02c11aa71daa65af45f4a6661c28de0feef1e2653c77baaff5ac3479f621da8abca48929bb42e4dbd2c2e954708f271a68b5a8193f')

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
