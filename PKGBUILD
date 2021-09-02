# Maintainer: Your Name <youremail@domain.com>

pkgname=single-file
pkgver=0.3.28
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
b2sums=('9fbc74fed7c2b249a9f91e3c7c833dbaee1f76dd3c9b3cfb512c13e06de9c391e86777e97b7ef1a6ec76fc8fe0c8f446387dbaa12b184435cfbf74c9582e2aff')

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
