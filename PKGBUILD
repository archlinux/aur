# Maintainer: Daniel Maslowski <info@orangecms.org>

_gitname=chimp
_gitver=0.49.1
pkgname=nodejs-${_gitname}
pkgver=$_gitver
pkgrel=2
pkgdesc="Develop acceptance tests & end-to-end tests with realtime feedback"
arch=(any)
url="http://chimp.readme.io"
license=('MIT')
depends=('nodejs')
source=("https://github.com/xolvio/$_gitname/archive/v$pkgver.tar.gz")
sha256sums=('28fc078b0408df645d253b3e732584bcbd5a97254e23e362c0b87ab0106fa359')

prepare() {
  cd "$srcdir/$_gitname-$_gitver"
  /usr/bin/npm i
}

package() {
  module_dir=$pkgdir/usr/lib/node_modules/$_gitname/
  cd "$srcdir/$_gitname-$_gitver"
  # remove PhantomJS
  sed -i "/phantomjs-prebuilt/d" package.json
  echo "module.exports = function() {};" > src/lib/phantom.js
  # build and install
  /usr/bin/npm i -g --unsafe-perm --prefix "$pkgdir/usr"
  cp -a dist "$module_dir"
  ln -s "$module_dir/chromedriver" "$module_dir/node_modules/selenium-standalone/"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname}/README"
}
