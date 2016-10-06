# Maintainer: Chris Zimmermann <monochromec@gmail.com>
#
pkgname=sinfo
pkgver=0.0.48
pkgrel=4
pkgdesc="A monitoring tool for networked computers."
arch=('i686' 'x86_64' 'armv7h' 'arm')
conflicts=('')
license=('GPL')
depends=('ncurses' 'boost' 'boost-libs')
options=(buildflags)
source=(http://www.ant.uni-bremen.de/whomes/rinas/sinfo/download/$pkgname-$pkgver.tar.gz sinfod.service)
url="http://www.ant.uni-bremen.de/whomes/rinas/sinfo/"
#
sha256sums=('4b6360f863c408e96ca04092ea6bdd61ee14a9e9151b85f64e12ece541b1933f'
            '805612dad011f7194cba49a2886a1ed68ec412bfac6e441ec44ebbf61693efe3')
#
build() {
  cd ${srcdir}/$pkgname-$pkgver
  sed -i 's/\-mt//g' sinfo/Makefile.*
  sed -i 's/\-mt//g' sinfod/Makefile.*
  ./configure --prefix=/usr --sbindir=/usr/bin
# Required setting of explicit standard for g++, otherwise libboost template handling will break after g++ 6
  make CXXFLAGS="-std=c++98"
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR="${pkgdir}/" install
  install -Dm644 $srcdir/sinfod.service $pkgdir/usr/lib/systemd/system/sinfod.service
}  
