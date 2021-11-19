# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lemmy-ui
pkgver=0.14.1
pkgrel=1
pkgdesc="The official web app for lemmy"
arch=('any')
url="https://github.com/LemmyNet/lemmy-ui"
license=('AGPL3')
depends=('nodejs')
makedepends=('git' 'yarn')
_commit='b133406568d38694280d8bc1aa628027628546f2'
source=("$pkgname::git+https://github.com/LemmyNet/lemmy-ui#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^[vV]//;s/-/+/g'
}

prepare() {
	cd "$pkgname"

  # fetch submodules
  git submodule update --init

  # set UI version
  sed -i "s/unknown version/$pkgver/" src/shared/version.ts
}

build() {
	cd "$pkgname"

  yarn install
  yarn build:prod
}

package() {
	cd "$pkgname"

  install -vd "$pkgdir/usr/share/$pkgname"
  cp -R dist/* node_modules "$pkgdir/usr/share/$pkgname"
}
