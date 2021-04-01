# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>
# Contributor: Peter Wu <lekensteyn at gmail dot com>

pkgname=apaste
pkgver=1.2.5
_commit=0304b7f4f332d041141b61e3c1b6332554ee04cf
pkgrel=1
pkgdesc="Command-line client for riseup.net pastebin service"
arch=('any')
url="https://share.riseup.net/"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq' 'moreutils')
provides=('nodejs-apaste')
conflicts=('nodejs-apaste')
replaces=('nodejs-apaste')
source=("$pkgname-$pkgver.tar.gz::https://0xacab.org/riseup/share/up1-cli-client-nodejs/-/archive/$_commit/up1-cli-client-nodejs-$_commit.tar.gz")
sha512sums=('8925832ae981c5722f905e554f300b82d73a41a2b1c2cf509f97940cf7a253f329af816c5b21f2574e85c296aecdf762697f62a611eddeaeb245a3b677796c14')

prepare() {
	cd "$srcdir/up1-cli-client-nodejs-$_commit"

	cat package.json | jq '.dependencies.mmmagic = "0.5.3"' | sponge package.json
}

build() {
	cd "$srcdir/up1-cli-client-nodejs-$_commit"

	npm install
}

package() {
  cd "$srcdir/up1-cli-client-nodejs-$_commit"

  npm pack
  npm install -g --prefix "$pkgdir"/usr apaste-1.2.5.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
