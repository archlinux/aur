# Maintainer: joelvaz0x01 <joelvaz.whitehat@gmail.com>
# Contributor: tjbp <archlinux@tjbp.net>
# Contributor: Nick Boughton <nicholasboughton@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: GFdevelop

_npmscope=vue
_npmname=cli
_npmid="@$_npmscope/$_npmname"

pkgname="${_npmscope}-${_npmname}"
pkgver=5.0.8
pkgrel=1
pkgdesc='Standard tooling for Vue.js development'
arch=('any')
url='https://cli.vuejs.org'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
conflicts=('nodejs-vue-cli' 'vue')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$_npmid/-/$_npmname-$pkgver.tgz")
noextract=("${source[@]%%::*}")
sha256sums=('29aa4eb0ba827624e42683e1339ebd40e663ad09836dd027df30e3d2108b0b71')

package() {
  mkdir -p "${pkgdir}"/usr/lib

  # Setting temporary cache
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]%%::*}"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -execdir chmod 755 {} \+

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root $pkgdir

  # Package contains reference to $srcdir/$pkgdir
  find "${pkgdir}" -type f -name package.json -execdir sed -i '/_where/d' {} \+

  # Add license
  install -Dm644 "$pkgdir/usr/lib/node_modules/$_npmid/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
