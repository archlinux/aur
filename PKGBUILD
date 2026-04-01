# Maintainer: Everything2067 <anand shaurya at proton dot me>
# Contributor: Brian Wo <brianwo at protonmail dot com>
# Contributor: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=web-ext
# https://github.com/mozilla/web-ext/releases
pkgver=10.1.0
pkgrel=1
pkgdesc='A command line tool to help build, run, and test web extensions'
arch=(any)
url='https://developer.mozilla.org/en-US/Add-ons/WebExtensions'
# https://github.com/mozilla/web-ext/blob/7.11.0/package.json#L128
license=('MPL-2.0')
# See "engines" in https://github.com/mozilla/web-ext/blob/master/package.json
# XXX: somehow nodejs 20 breaks tests
# Per https://extensionworkshop.com/documentation/develop/getting-started-with-web-ext/, web-ext requires the current LTS (long-term support) versions of NodeJS.
# Running namcap on the produced package reported python as a missing dependency.
depends=('nodejs' 'python')
makedepends=('npm' 'node-gyp')
replaces=('nodejs-web-ext')
provides=('nodejs-web-ext')
conflicts=('nodejs-web-ext')
# to speed up the build
options=('!strip')
# tarball on npmjs lacks scripts for building from sources
source=("https://github.com/mozilla/web-ext/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a80a0c644133937ca02e4972a6e9cec48d631ec974b57e5aaedc60b1f3ccf1a7')

prepare() {
  cd "$srcdir"

  # -build for running webpack and tests, and the original for actual packaging
  cp -r $pkgname-$pkgver{,-build}
}

build() {
  cd "$srcdir/$pkgname-$pkgver-build"

  # Mozilla recommends running npm ci instead of npm install.
  # Thanks to Manuel Reimer for suggesting this.
  npm ci
  NODE_ENV=production npm run build
  cp -r lib "$srcdir/$pkgname-$pkgver"

  cd "$srcdir/$pkgname-$pkgver"
  npm ci --omit=dev
}

check() {
  cd "$srcdir/$pkgname-$pkgver-build"
  npm test
}

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"

  install -Ddm755 "$_npmdir"
  cp -r --no-preserve=ownership $pkgname-$pkgver "$_npmdir/$pkgname"

  install -Ddm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/node_modules/$pkgname/bin/$pkgname.js" "$pkgdir/usr/bin/$pkgname"
}
