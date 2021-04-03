# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

_pkgname=web-ext
pkgname=${_pkgname}-git
pkgver=6.0.0.r10.g8bd0d13f
pkgrel=1
pkgdesc='A command line tool to help build, run, and test web extensions'
arch=(any)
url='https://developer.mozilla.org/en-US/Add-ons/WebExtensions'
license=('MPL2')
# See upstream package.json
depends=('nodejs>=12.0.0')
makedepends=('npm' 'node-gyp' 'git')
replaces=('nodejs-web-ext')
provides=('nodejs-web-ext' "${pkgname//-git}=${pkgver}")
conflicts=('nodejs-web-ext' "$_pkgname")
# to speed up the build
options=('!strip')
# tarball on npmjs lacks scripts for building from sources
source=("$pkgname::git+https://github.com/mozilla/web-ext.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"

  # -build for running webpack and tests, and the original for actual packaging
  cp -r $pkgname{,-build}
}

build() {
  cd "$srcdir/$pkgname-build"

  npm install
  NODE_ENV=production npm run build
  cp -r dist "$srcdir/$pkgname"

  cd "$srcdir/$pkgname"
  npm install --production
}

check() {
  cd "$srcdir/$pkgname-build"

  #npm test
}

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"

  install -Ddm755 "$_npmdir"
  cp -r --no-preserve=ownership $pkgname "$_npmdir/$_pkgname"

  # dtrace-provider (brought in by bunyan) is not used on Linux, and its build artifacts makes this package unreproducible
  rm -r "$_npmdir"/web-ext/node_modules/dtrace-provider/build/

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  install -Ddm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/node_modules/$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
