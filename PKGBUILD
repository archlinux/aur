# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=js-beautify-git
pkgver=1.15.4.r7.g03e3cc02
pkgrel=1
pkgdesc="Beautifier for javascript"
arch=('any')
url="https://beautifier.io/"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
provides=("js-beautify=$pkgver")
conflicts=('js-beautify')
source=("git+https://github.com/beautifier/js-beautify.git")
sha256sums=('SKIP')


pkgver() {
  cd "js-beautify"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "js-beautify"

  npm install -D
  tools/build.sh js
}

package() {
  cd "js-beautify"

  npm install -g --prefix="$pkgdir/usr" git+file://$(pwd)
  rm -r "$pkgdir/usr/lib/node_modules/js-beautify/js"/*
  cp -r js/* "$pkgdir/usr/lib/node_modules/js-beautify/js"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/js-beautify"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"
}
