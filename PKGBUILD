# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=web-ext
# https://github.com/mozilla/web-ext/releases
pkgver=6.8.0
pkgrel=1
pkgdesc='A command line tool to help build, run, and test web extensions'
arch=(any)
url='https://developer.mozilla.org/en-US/Add-ons/WebExtensions'
license=('MPL2')
# See "engines" in https://github.com/mozilla/web-ext/blob/master/package.json
depends=('nodejs>=12.0.0')
makedepends=('npm' 'node-gyp')
replaces=('nodejs-web-ext')
provides=('nodejs-web-ext')
conflicts=('nodejs-web-ext')
# to speed up the build
options=('!strip')
# tarball on npmjs lacks scripts for building from sources
source=("https://github.com/mozilla/web-ext/archive/$pkgver/web-ext-$pkgver.tar.gz")
sha256sums=('7a07c0c8a7f921f24c0af5595347b6375f166152e33a1b805b57ccf4d460d4d2')

prepare() {
  cd "$srcdir"

  # -build for running webpack and tests, and the original for actual packaging
  cp -r $pkgname-$pkgver{,-build}
}

build() {
  cd "$srcdir/$pkgname-$pkgver-build"

  npm install
  NODE_ENV=production npm run build
  cp -r dist "$srcdir/$pkgname-$pkgver"

  cd "$srcdir/$pkgname-$pkgver"
  npm install --production
}

check() {
  cd "$srcdir/$pkgname-$pkgver-build"

  # web-ext uses flow-bin, which does not support some architectures (e.g., RISC-V)
  CI_SKIP_FLOWCHECK=y npm test
}

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"

  install -Ddm755 "$_npmdir"
  cp -r --no-preserve=ownership $pkgname-$pkgver "$_npmdir/$pkgname"

  # dtrace-provider (brought in by bunyan) is not used on Linux, and its build artifacts makes this package unreproducible
  rm -r "$_npmdir"/web-ext/node_modules/dtrace-provider/build/

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  install -Ddm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/node_modules/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
