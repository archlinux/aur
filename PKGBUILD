# Maintainer: Tucos <baspape@gmail.com>
# Contributor: Hubert Grzeskowiak <arch at nemesis13 dot de>

pkgname=panda3d-runtime
pkgver=1.0.4
pkgrel=1
pkgdesc='3D engine with Python bindings. Runtime and web plugin.'
url="http://www.panda3d.org"
depends=('openssl' 'shared-mime-info' 'desktop-file-utils')
makedepends=('python2' 'libpng' 'libjpeg' 'xulrunner')
source=("http://www.panda3d.org/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz" 'panda3d-runtime.install' 'patch.patch')
arch=('i686' 'x86_64')
license=('BSD')
install='panda3d-runtime.install'
md5sums=('4410c5b1cb49f2d1de127d8cf51c8596'
         '781da785acb14d547624b505ef01e064'
         '197359757fd33d038c466ba572ec8d1b')

prepare() {
cd $srcdir/$pkgname-$pkgver
patch -p1 -i $srcdir/patch.patch 
}

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 makepanda/makepanda.py --everything --runtime --distributor cmu
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 makepanda/installpanda.py --destdir=$pkgdir --runtime --outputdir=built_cmu_rt --prefix=/usr
  install -D -m755 $srcdir/$pkgname-$pkgver/doc/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  if [ "$CARCH" == "x86_64" ]; then
    mv $pkgdir/usr/lib{64,}

    rm $pkgdir/usr/lib/mozilla-firefox/plugins/nppanda3d.so $pkgdir/usr/lib/mozilla/plugins/nppanda3d.so $pkgdir/usr/lib/xulrunner-addons/plugins/nppanda3d.so
    ln -s /usr/lib/nppanda3d.so $pkgdir/usr/lib/mozilla-firefox/plugins/nppanda3d.so
    ln -s /usr/lib/nppanda3d.so $pkgdir/usr/lib/mozilla/plugins/nppanda3d.so
    ln -s /usr/lib/nppanda3d.so $pkgdir/usr/lib/xulrunner-addons/plugins/nppanda3d.so
  fi
}
