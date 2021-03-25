# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=nodejs-npm-upgrade
_pkgname=npm-upgrade
pkgver=3.0.0
pkgrel=1
pkgdesc='CLI utility to update outdated NPM dependencies with changelogs inspection'
arch=('any')
url='https://github.com/th0r/npm-upgrade'
license=('MIT')
depends=('nodejs>=10.20.0')
makedepends=('npm')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha256sums=('a15d263a096e0aeacf5d04c1f2e5ec2964470f2dcaf0a6d65901bb1e870880bb')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # Install license in the usual place
  local _npmdir="$pkgdir/usr/lib/node_modules"
  install -Dm644 "$_npmdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
