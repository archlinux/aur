# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lemmy-ui
pkgver=0.14.3
pkgrel=1
pkgdesc="The official web app for lemmy"
arch=('any')
url="https://github.com/LemmyNet/lemmy-ui"
license=('AGPL3')
depends=('nodejs')
makedepends=('git' 'yarn' 'python')
_commit='c0741e403b6693d9b0d208ff4e3056bf66786f2b'
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
