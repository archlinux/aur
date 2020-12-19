# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=web-ext
pkgver=5.4.1
pkgrel=1
pkgdesc='A command line tool to help build, run, and test web extensions'
arch=(any)
url='https://developer.mozilla.org/en-US/Add-ons/WebExtensions'
license=('MPL2')
depends=('nodejs')
makedepends=('npm' 'node-gyp')
replaces=('nodejs-web-ext')
provides=('nodejs-web-ext')
conflicts=('nodejs-web-ext')
# to speed up the build
options=('!strip')
# tarball on npmjs lacks scripts for building from sources
source=("https://github.com/mozilla/web-ext/archive/$pkgver/web-ext-$pkgver.tar.gz"
        "skip-if-non-git-repo.diff")
sha256sums=('c2591f601c1b385d1360d9d3867fbe45a0db12973b4019b066b0fa13e3207687'
            'f485e30d304023a8a503095b6d0ba1f0f9f70d476e2ce58c5a7713caaa78ab49')

prepare() {
  cd "$srcdir"

  pushd $pkgname-$pkgver
  patch -Np1 -i ../skip-if-non-git-repo.diff
  popd

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

  npm test
}

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"

  install -Ddm755 "$_npmdir"
  cp -r --no-preserve=ownership $pkgname-$pkgver "$_npmdir/$pkgname"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  install -Ddm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/node_modules/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
