# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=single-file
pkgver=0.3.32
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
sha512sums=('702673a030802f5cf1f79c01f0e607085c878fb34ccacd7278ca1ede5c317a659c09e4f5993e18ae9a85e411bac0a5bbcdd0960de4309f53820cd7f3db254d65')
b2sums=('6867019f4bc3b6bdbbf7e151452a0905fcd8059c6a51555f148347bca740423481ce8ccc1a9e92af504365f85872c0442270926a20159c772f8211a4ba5c417c')

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
