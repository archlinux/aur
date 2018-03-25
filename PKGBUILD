# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname=yarn-nightly
_pkgver=$(curl -s -L https://nightly.yarnpkg.com/latest.json | jq -r '.tar.version')
_pkgname="yarn-v$_pkgver"
pkgver=1.6.0.20180325.1153
pkgrel=1
pkgdesc='Fast, reliable, and secure dependency management'
arch=(any)
url='https://yarnpkg.com/en/docs/nightly'
license=('BSD')
depends=('nodejs')
makedepends=('jq' 'curl')
provides=('yarn')
conflicts=('yarn')

pkgver() {
  printf "$_pkgver" | sed 's/-/./g'
}

source=(
  "https://nightly.yarnpkg.com/yarn-v$_pkgver.tar.gz"
  "https://nightly.yarnpkg.com/yarn-v$_pkgver.tar.gz.asc"
)

sha512sums=(
  'SKIP'
  'SKIP'
)

validpgpkeys=(# Yarn Packaging <yarn@dan.cx>
              # https://pgp.mit.edu/pks/lookup?op=get&search=0x1646B01B86E50310
              72ECF46A56B4AD39C907BBB71646B01B86E50310
)

package() {
  install -dm755  "$pkgdir"/usr/lib/node_modules/yarn
  cp -R "$srcdir"/$_pkgname/* "$pkgdir"/usr/lib/node_modules/yarn

  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/node_modules/yarn/bin/yarn.js "$pkgdir"/usr/bin/yarn
  ln -s /usr/lib/node_modules/yarn/bin/yarn.js "$pkgdir"/usr/bin/yarnpkg

  install -Dm644 "$srcdir"/$_pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
