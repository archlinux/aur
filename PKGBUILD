# Maintainer: Bruno Carlin <bruno@bcarlin.net>
pkgname=ember-language-server
pkgver=2.29.0
pkgrel=1
pkgdesc="The Ember Language Server (ELS) implements the Language Server Protocol for Ember.js projects. "
arch=( 'any' )
url="https://github.com/lifeart/ember-language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("https://registry.npmjs.org/@lifeart/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('85ada9470a39e2db635d9e11b676fe466194371e973c844f5de68979a32b8c72')
noextract=("${pkgname}-${pkgver}.tgz")
#validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}
#
#build() {
#	cd "$pkgname-$pkgver"
#	./configure --prefix=/usr
#	make
#}
#
#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
  npm install -g \
    --prefix "${pkgdir}/usr" \
    --cache "${srcdir}/npm-cache" \
    "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  # Remove references to $pkgdir
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage pkgjson
  tmppackage="$(mktemp)"
  pkgjson="$pkgdir/usr/lib/node_modules/@lifeart/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}
