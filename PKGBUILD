# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=gnulib-git
pkgver=v0.1.77.gd9361da
pkgrel=1
pkgdesc="GNU Portability Library"
arch=('any')
url="http://www.gnu.org/software/gnulib"
license=('custom')
provides=('gnulib')
conflicts=('gnulib')
makedepends=('git')
source=('git+git://git.sv.gnu.org/gnulib.git')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/gnulib"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/gnulib"
  sed -i "/^[ ]*gnulib_dir=/s#\`[^\`]*\`#/usr/share/$pkgname#" gnulib-tool
  make info
}

package() {
  cd "$srcdir/gnulib"
  install -dm755 $pkgdir/usr/share/$pkgname
  install -m755 -t $pkgdir/usr/share/$pkgname check-module gnulib-tool

  dir=$(find build-aux lib m4 modules top -type d)

  for i in $dir; do
    install -dm755 $pkgdir/usr/share/$pkgname/$i
    install -Dm644 -t $pkgdir/usr/share/$pkgname/$i $(find $i -maxdepth 1 -type f) 
  done
  cp -r doc tests $pkgdir/usr/share/$pkgname/

  install -dm755 $pkgdir/usr/bin
  ln -s /usr/share/gnulib-git/gnulib-tool $pkgdir/usr/bin/
  ln -s /usr/share/gnulib-git/check-module $pkgdir/usr/bin/

  install -Dm644 doc/gnulib.info $pkgdir/usr/share/info/gnulib.info
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname}/COPYING
}
