# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=faust-vst-git
pkgver=90.7bec1e8
pkgrel=1
pkgdesc="Faust VST plugin examples"
arch=("i686" "x86_64")
license=('LGPL')
url="https://bitbucket.org/agraef/faust-vst/"
depends=('qt5-base' 'qt5-x11extras')
makedepends=('faust' 'boost' 'steinberg-vst36')
source=("git+https://bitbucket.org/agraef/faust-vst")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/faust-vst
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

# You can remove 'gui=1' (as well as the 'qt5-base' 'qt5-x11extras' depends)
# if you don't want the custom plugin GUIs.
build() {
  cd $srcdir/faust-vst
  make gui=1 || return 1
}

# Architecture and helper script aren't installed as they're also included in
# the latest Faust revisions. Add the 'install-faust' target if you need them.
package() {
  cd $srcdir/faust-vst
  make prefix=/usr DESTDIR=$pkgdir install || return 1
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README* "$pkgdir/usr/share/doc/$pkgname/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING* "$pkgdir/usr/share/licenses/$pkgname/"
}
