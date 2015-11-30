# Contributor: ReNoM <renom@list.ru>
# Contributor: ava1ar <mail(dot)avatar(at)gmail(dot)com>

pkgname=kde-cdemu-manager-kf5
pkgver=0.5
pkgrel=3
pkgdesc="KDE CDEmu Manager is a simple frontend for CDEmu.KF5 version"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/KDE+CDEmu+Manager?content=99752"
license="GPL"
depends=('kdelibs4support' 'cdemu-daemon>=2.0')
provides=('kde-cdemu-manager')
conflicts=('kde-cdemu-manager')
makedepends=('cmake' 'kdoctools' 'qt5-tools' 'extra-cmake-modules')
source=(http://www.kde-apps.org/CONTENT/content-files/99752-kde_cdemu-$pkgver.0.tar.bz2
        port_to_kf5.patch
        zh_CN.po)
md5sums=('c0e56401e2c2f2c4652915a44af128b8'
        'SKIP'
        'SKIP')

prepare() {
  cd $srcdir/kde_cdemu
  patch -p1 < ../port_to_kf5.patch
  cp ${srcdir}/zh_CN.po $srcdir/kde_cdemu/po
}
build() {
  cd $srcdir/kde_cdemu
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF \
    ..
    
  make
}

package()
{
  cd $srcdir/kde_cdemu/build
  make DESTDIR=$pkgdir install
}

