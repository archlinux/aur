# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Maintainer: kaptoxic

pkgname=crossvc
pkgver=1.5.2
pkgrel=5
pkgdesc="A graphical interface for the cvs client"
arch=('i686' 'x86_64')
url="http://www.lincvs.org/"
license=('GPL')
depends=('qt3' 'cvs')
source=(
  http://crossvc.com/download/$pkgname-$pkgver-0-generic-src.tgz
  crossvc
  crossvc.desktop
  lincvs_updated.pro
)
md5sums=('4fb196e4e5fb5b6c5d901601869308b2'
         '55ec40cdf6cacbba591dd95541e50574'
         '70506604810792b1740c94b67333073c'
         'c01681ec367d82815dd42b7d86c77135')

build() {
  cd $srcdir/CrossVC

  #. /etc/profile.d/qt3.sh
  export QTDIR=/usr/lib/qt3
  #export PATH=/usr/lib/qt3/bin:$PATH
  #export QMAKESPEC=/usr/share/qt3/mkspecs/linux-g++

  
  cp -f $srcdir/lincvs_updated.pro lincvs.pro
  qmake-qt3 -makefile -o Makefile lincvs.pro
  #cp -f $srcdir/Makefile Makefile
  make || return 1
}

package() {
  cd $srcdir/CrossVC

  export QTDIR=/usr/lib/qt3
  export PREFIX=$pkgdir/usr
  make install

  install -Dm755 ${srcdir}/crossvc $pkgdir/usr/bin/crossvc

  # Fix permission in the package
  mkdir -p $pkgdir/usr/share/${pkgname}/{Messages,Tools}
  mkdir -p $pkgdir/usr/share/doc/${pkgname}
  install -m755 crossvc.bin $pkgdir/usr/share/${pkgname}
  install -m755 CrossVC/AppRun $pkgdir/usr/share/${pkgname}
  install -m755 CrossVC/Tools/* $pkgdir/usr/share/${pkgname}/Tools
  install -m644 CrossVC/Messages/* $pkgdir/usr/share/${pkgname}/Messages
  for fn in CrossVC/Help/*; do
    if [ -f $fn ]; then
        install -m644 $fn $pkgdir/usr/share/doc/${pkgname}/
    fi
  done

  #install -D -m644 CrossVC/Help/* $pkgdir/usr/share/doc/${pkgname}/
  #cp -f CrossVC/Help/* $pkgdir/usr/share/doc/${pkgname}/ || echo "Done"
  #chmod -R 644 $pkgdir/usr/share/doc/${pkgname}
  #chmod -R 644 $pkgdir/usr/share/doc/${pkgname}/Translations

  # Desktop related
  install -Dm644 ${srcdir}/crossvc.desktop $pkgdir/usr/share/applications/crossvc.desktop
  install -Dm644 CrossVC/AppIcon.xpm $pkgdir/usr/share/pixmaps/crossvc.xpm
}

