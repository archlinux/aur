# Maintainer: Your Name <youremail@domain.com>

pkgname=single-file
pkgver=0.3.27
pkgrel=1
pkgdesc="Command line tool to download a web page into a single HTML file"
arch=('any')
url="https://github.com/gildas-lormeau/SingleFile"
license=('AGPL3')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('2effcd1d09863830f1f947ee409b66c80753162d6b182623a6b6ea9a55bf0d14d5d881496d367d343dfb0fbbdd97d9e42946409f7edb49311029f69b76fddf8a')

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
