# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=cube-git
pkgver=20140730
pkgrel=1
pkgdesc="A system for analyzing time series data using MongoDB and Node"
arch=('i686' 'x86_64')
depends=('mongodb' 'nodejs')
makedepends=('git' 'npm')
url="http://square.github.io/cube/"
license=('Apache')
source=(git+https://github.com/square/cube
        cube-collector.service
        cube-evaluator.service)
sha256sums=('SKIP'
            'd95365e0bdc8a53d32a83694ecfb13f7417d7fc235658bde7ebb58c0e4a0395d'
            '646857807ed967252e7e003377fe7dd7f17b23dd362886042a4ac6da052681e7')
provides=('cube')
conflicts=('cube')
install=cube.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Fetching NPM dependencies...'
  npm install
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/cube/LICENSE

  msg 'Installing documentation...'
  install -Dm 644 README.md $pkgdir/usr/share/doc/cube/README.md

  msg 'Installing cube...'
  install -dm 755 $pkgdir/usr/share/cube
  for _appdir in bin examples lib node_modules static test; do
    cp -dpr --no-preserve=ownership $_appdir $pkgdir/usr/share/cube/$_appdir
  done
  for _appfile in .npmignore Makefile package.json; do
    cp -dpr --no-preserve=ownership $_appfile $pkgdir/usr/share/cube/$_appfile
  done

  msg 'Installing cube.service...'
  install -Dm 644 $srcdir/cube-collector.service $pkgdir/usr/lib/systemd/system/cube-collector.service
  install -Dm 644 $srcdir/cube-evaluator.service $pkgdir/usr/lib/systemd/system/cube-evaluator.service

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
