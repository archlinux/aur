# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=xcursor-pro-cursor-theme
pkgver=1.1.4
pkgrel=2
pkgdesc="Modern X11 Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/XCursor-pro"
license=('GPL3')
depends=('libxcursor' 'libpng')
makedepends=('python-clickgen1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-bitmaps-$pkgver.zip::$url/releases/download/v$pkgver/bitmaps.zip")
noextract=("$pkgname-bitmaps-$pkgver.zip")
sha256sums=('01813486e9bacb3f87976642f30d1ee66fcdc35d7d46714cced4e8858ab68215'
            '8b471a8618582015c19d25450076764ac10155d1043c58cf362323984421534a')

prepare() {
  cd XCursor-pro-$pkgver
  mkdir -p bitmaps
  bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps/
}

build() {
  cd XCursor-pro-$pkgver

  pushd builder
  _themes='Dark Light Red'
  _sizes='22 24 28 32 40 48 56 64 72 80 88 96'

  set -- ${_sizes}
  for t in ${_themes}; do
    python build.py unix -p "../bitmaps/XCursor-Pro-$t" --xsizes ${_sizes[@]}
  done
  popd
}

package() {
  cd XCursor-pro-$pkgver
  install -d "$pkgdir/usr/share/icons"
  cp -r themes/XCursor-Pro* "$pkgdir/usr/share/icons/"
}
