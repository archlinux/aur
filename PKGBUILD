# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Danilo Bargen <mail àt dbrgn dôt ch>

pkgname=tilemill-git
_pkgname=tilemill
pkgver=v0.10.1.r345.gc31d70c
pkgrel=1
pkgdesc="Modern map design studio"
arch=('i686' 'x86_64')
url="https://www.mapbox.com/tilemill/"
license=('BSD')
depends=('nodejs10' 'webkitgtk2')
makedepends=('git' 'boost' 'imagemagick')

# For achitectures other than x86_64, we need to build node-mapnik from sources
if test "$CARCH" == x86_64; then
  makedepends+=('mapnik')
else
  depends+=('mapnik-git' 'protobuf')
fi

conflicts=("$_pkgname")
provides=("$_pkgname")
options=(!emptydirs)
source=('git+https://github.com/mapbox/tilemill.git'
        'tilemill.desktop'
        'tilemill.patch')
sha1sums=('SKIP'
          'd7b20eba61b52d340a838bef8468b3d33257cf66'
          'a43f5feac064acdeb73a3a71f61945136eee0497')

pkgver() {
  cd $_pkgname
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname

  # Don't install npm, it's already in nodejs package
  patch -p1 -i "$srcdir/tilemill.patch"

  convert tilemill.ico tilemill.png
}

package() {
  cd $_pkgname

  # python2 fix for build node-mapnik
  mkdir -p "$srcdir/bin"
  ln -s -f /usr/bin/python2 "$srcdir/bin/python"
  export PATH="$srcdir/bin:$PATH"

  npm install -d -g --user root --prefix "$pkgdir/usr" --python=/usr/bin/python2

  # icon and .desktop files
  install -Dm644 tilemill-5.png "$pkgdir/usr/share/pixmaps/tilemill.png"
  install -Dm644 "$srcdir/tilemill.desktop" "$pkgdir/usr/share/applications/tilemill.desktop"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # fix permissions
  find "$pkgdir" -exec chown root:root '{}' \;

  # python2 fix
  find "$pkgdir" -type f -exec sed -i 's@^#.*python$@#!/usr/bin/python2@' '{}' \;
}
