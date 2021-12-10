# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lemmy-ui
pkgver=0.14.5
pkgrel=1
pkgdesc="The official web app for lemmy"
arch=('any')
url="https://github.com/LemmyNet/lemmy-ui"
license=('AGPL3')
depends=('nodejs')
makedepends=('git' 'yarn' 'python')
_commit='c7a074197823ccb0c2ba8558946aab9739f36941'
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
