# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=js-beautify-git
pkgver=1.9.0_beta5.r0.g2742799a
pkgrel=2
pkgdesc="Beautifier for javascript"
arch=('any')
url="https://beautifier.io/"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('js-beautify')
conflicts=('js-beautify')
source=("git+https://github.com/beautify-web/js-beautify.git")
sha256sums=('SKIP')


pkgver() {
  cd "js-beautify"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/v//p}')
  _rev=$(git rev-list --count v$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/-/_/g'
}

build() {
  cd "js-beautify"

  npm install -D
  tools/build.sh js
}

package() {
  cd "js-beautify"

  npm install -g --user root --prefix="$pkgdir/usr" git+file://$(pwd)
  rm -r "$pkgdir/usr/lib/node_modules/js-beautify/js"/*
  cp -r js/* "$pkgdir/usr/lib/node_modules/js-beautify/js"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/js-beautify/LICENSE"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +
}
