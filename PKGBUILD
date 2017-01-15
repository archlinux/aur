# Contributor: Přemysl Janouch <p.janouch@gmail.com>
# Contributor: Alois Belaska <lloyd@centrum.cz>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=epos
arch=('i686' 'x86_64')
pkgver=2.4.85
pkgrel=1
license=('GPL')
pkgdesc="A free text to speech synthesis system"
backup=(etc/rc.d/epos)
url='http://epos.ure.cas.cz/'
source=('http://downloads.sourceforge.net/project/epos/epos/2-4-85/ep2-4-85.tgz'
        'http://downloads.sourceforge.net/project/epos/voices/Czech%20_%20Machac%2BViolka%2C%20July%2005/epos-tdp.tgz'
        epos fix-x86_64.patch CMakeLists.txt config.h.in)
md5sums=('2fef78d8bd2ac8dedad4dc643c20eb19' '10b1af13e07bcd2e8b3ac404b3ad12b7'
         'fc2df9ba60c2a362f579a404f4f6bf15' '559a6fbe2cab5a8a0f21b8fe6675f780'
	 '5cd671da7ae5f397d3c8c27b08f8044e' '8da3f83fc1c618c234dbd5a0f9c97f0b')
makedepends=('gcc' 'cmake>=2.6' 'pulseaudio')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p0 < $srcdir/fix-x86_64.patch

  cp $srcdir/CMakeLists.txt $srcdir/config.h.in .
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_SHARED=ON -DDISABLE_DEBUG=ON
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
 
  cp -R $srcdir/tdp $pkgdir/usr/lib/epos/inv
  install -D -m755 ../epos $pkgdir/etc/rc.d/epos
}
