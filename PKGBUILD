# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=web-ext
# https://github.com/mozilla/web-ext/releases
pkgver=7.5.0
pkgrel=1
pkgdesc='A command line tool to help build, run, and test web extensions'
arch=(any)
url='https://developer.mozilla.org/en-US/Add-ons/WebExtensions'
license=('MPL2')
# See "engines" in https://github.com/mozilla/web-ext/blob/master/package.json
depends=('nodejs>=14.0.0')
makedepends=('npm' 'node-gyp')
replaces=('nodejs-web-ext')
provides=('nodejs-web-ext')
conflicts=('nodejs-web-ext')
# to speed up the build
options=('!strip')
# tarball on npmjs lacks scripts for building from sources
source=("https://github.com/mozilla/web-ext/archive/$pkgver/web-ext-$pkgver.tar.gz"
        "nodejs19.diff")
sha256sums=('5a1f57be9be07c231a62a88e328eecde4bd6cabcb240e1147ae38431d9935493'
            '9475a50851a8442dd8edad55f5b678923808396eedfae45dd29a960cc0646529')

prepare() {
  cd "$srcdir"

  # Make tests pass with Node.js 19 https://github.com/mozilla/web-ext/issues/2564
  pushd $pkgname-$pkgver
  patch -Np1 -i ../nodejs19.diff
  popd

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
  LANG=C.UTF-8 CI_SKIP_FLOWCHECK=y npm test
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
