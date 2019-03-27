# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-activity-journal
pkgver=0.8.0
pkgrel=12
pkgdesc="Tool for easily browsing and finding files on your computer using the Zeitgeist engine"
arch=('any')
url="https://launchpad.net/gnome-activity-journal"
license=('GPL')
depends=('pygtk' 'python2-dbus' 'python2-xdg' 'zeitgeist')
makedepends=('python2-distutils-extra')
optdepends=('python2-pygments: get thumbnail of text files')
source=(https://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz{,.asc}
        gnome-activity-journal.appdata.xml
        disable-set-background.patch
        bluebird_histogram.patch
        fix-indicator-icon.patch
        make-libgnomeui-optional.patch
        optional-gconf.patch)
validpgpkeys=('7C0FF088052C082B442454171CFC22F3363DEAE3') # Siegfried-Angel Gevatter Pujals
sha256sums=('c1be611ecfc433df038c71857c7ca80cc0f40c8943cfb6a7be91ef0022cd4f7e'
            'SKIP'
            '2a8f952608851258c07c92d3bbececfa7572dc7e5609c4aa49298e098d102207'
            '129a601ac9539501fc692edc9d02d60527d8a71fe9a65eb0ab36dae5d501142e'
            'd4432ef650e8155c8534482d5b836e877f48bd026c933dc523838db6cb072c44'
            '529216e6cc4bf32565c04ebc1ad6afbb2f79a3194828de2b5491280f550a41ad'
            'ef89b213ceb1500fae8c72cdf2da2717da59d997e09bce9e027753ea07cdea0c'
            '1eb4d253c31f1405f882b518f9eb1352c6a88ba737a22b3bce7113f1c1cc8896')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' src/config.py gnome-activity-journal

  # https://bugs.launchpad.net/gnome-activity-journal/+bug/882557
  patch -Np1 -i ../disable-set-background.patch

  # https://bugs.launchpad.net/gnome-activity-journal/+bug/924988
  patch -Np1 -i ../bluebird_histogram.patch

  # Use icon name instead of full path to fix indicator icon
  patch -Np1 -i ../fix-indicator-icon.patch

  # https://bugs.launchpad.net/gnome-activity-journal/+bug/871130
  patch -Np1 -i ../make-libgnomeui-optional.patch

  # Make gconf dependency optional
  patch -Np1 -i ../optional-gconf.patch
}

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 ../$pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
  rm -r "$pkgdir/usr/share/pixmaps"
}
