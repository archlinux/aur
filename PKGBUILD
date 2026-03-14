# Maintainer: Everything2067 <anand shaurya at proton dot me>
# Contributor: Brian Wo <brianwo at protonmail dot com>
# Contributor: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=web-ext
# https://github.com/mozilla/web-ext/releases
pkgver=10.0.0
pkgrel=1
pkgdesc='A command line tool to help build, run, and test web extensions'
arch=(any)
url='https://developer.mozilla.org/en-US/Add-ons/WebExtensions'
# https://github.com/mozilla/web-ext/blob/7.11.0/package.json#L128
license=('MPL-2.0')
# See "engines" in https://github.com/mozilla/web-ext/blob/master/package.json
# XXX: somehow nodejs 20 breaks tests
# Per https://extensionworkshop.com/documentation/develop/getting-started-with-web-ext/, web-ext requires the current LTS (long-term support) versions of NodeJS.
depends=('python' 'nodejs-lts')
makedepends=('npm' 'node-gyp')
checkdepends=('python-nose')
replaces=('nodejs-web-ext')
provides=('nodejs-web-ext')
conflicts=('nodejs-web-ext')
# to speed up the build
options=('!strip')
# tarball on npmjs lacks scripts for building from sources
source=("https://github.com/mozilla/web-ext/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bddb101ac44ffc1c33f66b13f75075c3c320c973f7e9d7f96fffde1b9677b634')

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
  # cd "$srcdir/$pkgname-$pkgver-build"

  # web-ext uses flow-bin, which does not support some architectures (e.g., RISC-V)
  # Some tests match error messages and fail if messages are translated
  # LANG=C.UTF-8 CI_SKIP_FLOWCHECK=y MOCHA_TIMEOUT=100000 npm test

  # Test is disabled, as it appears to not be intented to be run on user environment
  # Relevant comment: https://aur.archlinux.org/packages/web-ext#comment-1021975
  nosetests || warning "Test failed"
}

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"

  install -Ddm755 "$_npmdir"
  cp -r --no-preserve=ownership $pkgname-$pkgver "$_npmdir/$pkgname"

  install -Ddm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/node_modules/$pkgname/bin/$pkgname.js" "$pkgdir/usr/bin/$pkgname"
}
