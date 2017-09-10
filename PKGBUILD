# Maintainer: Daniel Maslowski <info@orangecms.org>

_gitname=chimp
_gitver=0.50.0
pkgname=nodejs-${_gitname}
pkgver=$_gitver
pkgrel=1
pkgdesc="Develop acceptance tests & end-to-end tests with realtime feedback"
arch=(any)
url="http://chimp.readme.io"
license=('MIT')
depends=('nodejs')
source=("https://github.com/xolvio/$_gitname/archive/v$pkgver.tar.gz")
sha256sums=('800f876bb56cfddff2320d9a0f7b18fb3bd8bd15ff353aa3fb70afa3e0a2ebd1')

prepare() {
  cd "$srcdir/$_gitname-$_gitver"
  /usr/bin/npm i
}

package() {
  module_dir=$pkgdir/usr/lib/node_modules/$_gitname/
  bin_dir="$pkgdir/usr/bin"
  mkdir -p "$module_dir"
  mkdir -p "$bin_dir"
  cd "$srcdir/$_gitname-$_gitver"
  # remove PhantomJS
  sed -i "/phantomjs-prebuilt/d" package.json
  echo "module.exports = function() {};" > dist/lib/phantom.js
  # install dependencies
  /usr/bin/npm install --production --prefix "$PWD"
  # copy files
  cp -a node_modules "$module_dir/"
  cp package.json "$module_dir/"
  cp chimp.js "$module_dir/"
  cp -a dist "$module_dir/"
  ln -s "/usr/lib/node_modules/$_gitname/dist/bin/chimp.js" "$bin_dir/chimp"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname}/README"
}
