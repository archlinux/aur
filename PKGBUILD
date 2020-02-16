# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname=yarn-nightly
_pkgver=$(curl -s -L https://nightly.yarnpkg.com/latest.json | jq -r '.tar.version')
_pkgname="yarn-v$_pkgver"
pkgver=1.23.0.20200205.1242
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

sha512sums=('e87897d10e162ba0129c5873a96c4cad38dcf59df2d464819504f6ce5417e6f55f59404eb37adcde86ac09932a5a7c60bf19182ee2e5459849c586fd23960e8b'
            'SKIP')

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
