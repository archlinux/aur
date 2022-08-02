# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=faust-lv2-git
pkgver=186.27ed7cb
pkgrel=1
pkgdesc="Faust LV2 plugin examples"
arch=("i686" "x86_64")
license=('LGPL')
url="https://bitbucket.org/agraef/faust-lv2/"
depends=('qt5-base' 'qt5-x11extras')
makedepends=('faust' 'boost' 'lv2')
source=("git+https://bitbucket.org/agraef/faust-lv2")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/faust-lv2
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

# There are a copy of possible variants here. You can remove 'gui=1' (as well
# as the 'qt5-base' 'qt5-x11extras' depends) if you don't want the custom
# plugin GUIs. You can also replace the Qt dependencies with 'qt4' and add
# 'qmake=qmake-qt4' to the 'make' command to build the plugins with Qt4 GUIs
# instead (this is needed to make the GUIs work with Ardour). Also, you may
# want to remove the 'dyn-manifests=1' option to make the plugins work in
# hosts which don't support LV2 plugins with dynamic manifests (needed, e.g.,
# for Carla or if you're running a version of liblilv without dynamic manifest
# support).

build() {
  cd $srcdir/faust-lv2
  make gui=1 dyn-manifests=1 || return 1
}

# Architecture and helper script aren't installed as they're also included in
# the latest Faust revisions. Add the 'install-faust' target if you need them.

package() {
  cd $srcdir/faust-lv2
  make prefix=/usr DESTDIR=$pkgdir install || return 1
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README* "$pkgdir/usr/share/doc/$pkgname/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING* "$pkgdir/usr/share/licenses/$pkgname/"
}
