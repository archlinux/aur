# Maintainer: Antonio Rojas < nqn1976 @ gmail.com >
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: motyR <moty.rahamim@gmail.com>
_pkgname=kio-locate
pkgname=${_pkgname}-kf5
pkgver=0.5.3
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="A KDE I/O Slave for the locate command. KF5 Ver."
url="http://kde-apps.org/content/show.php?content=120965"
license=('GPL')
depends=('kio' 'kdelibs4support')
makedepends=('cmake' 'docbook-xsl')
source=("http://kde-apps.org/CONTENT/content-files/120965-$_pkgname-$pkgver.tar.gz" "kio_locate_gcc47.patch"
"port_to_qt5.patch")
md5sums=('198b43f6c873863bd02113db0ffe29bb'
         '270660f80c69d3a6b0a39dbdbaf672eb'
         'SKIP')

         
prepare() {
  cd $srcdir/$_pkgname-$pkgver
  patch -p0 -i $srcdir/kio_locate_gcc47.patch
  patch -p1 -i $srcdir/port_to_qt5.patch
  mkdir -p build
}
         
build() {
  cd $srcdir/$_pkgname-$pkgver/build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd $srcdir/$_pkgname-$pkgver/build
  install -dm755 "${pkgdir}/usr/lib/qt/plugins"
  make DESTDIR=$pkgdir install
  mv "${pkgdir}/usr/lib64/plugins"/* "${pkgdir}/usr/lib/qt/plugins"
  rm -r "${pkgdir}/usr/lib64"
  install -Dm644 ../kio_locate.kcfg "${pkgdir}/usr/share/config.kcfg/kio_locate.kcfg"
}
