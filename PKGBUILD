# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=web-ext
# https://github.com/mozilla/web-ext/releases
pkgver=8.1.0
pkgrel=1
pkgdesc='A command line tool to help build, run, and test web extensions'
arch=(any)
url='https://developer.mozilla.org/en-US/Add-ons/WebExtensions'
# https://github.com/mozilla/web-ext/blob/7.11.0/package.json#L128
license=('MPL-2.0')
# See "engines" in https://github.com/mozilla/web-ext/blob/master/package.json
# XXX: somehow nodejs 20 breaks tests
# Per https://extensionworkshop.com/documentation/develop/getting-started-with-web-ext/, web-ext requires the current LTS (long-term support) versions of NodeJS.
depends=('nodejs>=16.0.0' 'nodejs<20')
makedepends=('npm' 'node-gyp')
replaces=('nodejs-web-ext')
provides=('nodejs-web-ext')
conflicts=('nodejs-web-ext')
# to speed up the build
options=('!strip')
# tarball on npmjs lacks scripts for building from sources
source=("https://github.com/mozilla/web-ext/archive/$pkgver/web-ext-$pkgver.tar.gz")
sha256sums=('8acd39841c4974b9f3e2873c55ad39b5904fc67b90f0bc4371fc1feb5b873b2f')

prepare() {
  cd "$srcdir"

  # -build for running webpack and tests, and the original for actual packaging
  cp -r $pkgname-$pkgver{,-build}
}

build() {
  cd "$srcdir/$pkgname-$pkgver-build"

  npm install
  NODE_ENV=production npm run build
  cp -r lib "$srcdir/$pkgname-$pkgver"

  cd "$srcdir/$pkgname-$pkgver"
  npm install --production
}

check() {
  cd "$srcdir/$pkgname-$pkgver-build"

  # web-ext uses flow-bin, which does not support some architectures (e.g., RISC-V)
  # Some tests match error messages and fail if messages are translated
  LANG=C.UTF-8 CI_SKIP_FLOWCHECK=y MOCHA_TIMEOUT=100000 npm test
}

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"

  install -Ddm755 "$_npmdir"
  cp -r --no-preserve=ownership $pkgname-$pkgver "$_npmdir/$pkgname"

  # dtrace-provider (brought in by bunyan) is not used on Linux, and its build artifacts makes this package unreproducible
  rm -rv "$_npmdir"/web-ext/node_modules/dtrace-provider/build/

  install -Ddm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/node_modules/$pkgname/bin/$pkgname.js" "$pkgdir/usr/bin/$pkgname"
}
