# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=calligra-plan
pkgdesc="A project management application intended for managing moderately large projects with multiple resources"
pkgver=3.1.0
pkgrel=2
arch=(x86_64)
url='https://www.calligra-suite.org/'
license=(FDL1.2 GPL2 LGPL)
depends=(kinit kcmutils akonadi-contacts kdiagram kactivities kholidays kcalendarcore khtml)
makedepends=(extra-cmake-modules kdoctools boost)
conflicts=('calligra<3.1.0')
source=("https://download.kde.org/stable/calligra/$pkgver/calligraplan-$pkgver.tar.xz"{,.sig}
        calligra-plan-qt-5.11.patch::"https://cgit.kde.org/calligraplan.git/patch/?id=334cc8cb"
        calligra-plan-kcalcore-19.08-a.patch::"https://cgit.kde.org/calligraplan.git/patch/src?id=3a01affd"
        calligra-plan-kcalcore-19.08-b.patch
        calligra-plan-kcalcore-19.08-c.patch
        calligra-plan-kf5.61.patch::"https://cgit.kde.org/calligraplan.git/patch/?id=fe36bf6f")
sha256sums=('59f985bae0482789c13c9440af3bf5da0a1d04756c1c1ccf39f68f66cd3e7ddd'
            'SKIP'
            'a0b313914e8e6d6e0e66acf59dd1655886282f91fc19e959159f526002fb9a8c'
            'bb4595a782694ed808c59436cebe249472ebd8c9915c7687531804baf3dc7ccb'
            '6038e79e3f94bd4ab628566fc475b73da89e63f7d3b0c1e85cffdb771861b5bf'
            '87925afc3c3b7b8a77a8cab5a712e192a92902b2d70914e55eeb27741cfc872a'
            'b99ed215c917d1daff06f9e06e583c4f369f7912f48ae61bf26a4384be470caf')
validpgpkeys=(05D00A8B73A686789E0A156858B9596C722EA3BD  # Boudewijn Rempt <foundation@krita.org>
              42A60D06F449E895F40F09C01638B8A616108B8A) # Dag Andersen <danders@get2net.dk>

prepare() {
  mkdir -p build

  cd calligraplan-$pkgver
  patch -p1 -i ../calligra-plan-qt-5.11.patch # Fix build with Qt 5.11
  patch -p1 -i ../calligra-plan-kcalcore-19.08-a.patch # Fix build with kcalcore 19.08
  patch -p1 -i ../calligra-plan-kcalcore-19.08-b.patch
  patch -p1 -i ../calligra-plan-kcalcore-19.08-c.patch
  patch -p1 -i ../calligra-plan-kf5.61.patch # Fix build with Frameworks 5.61
}

build() {
  cd build
  cmake ../calligraplan-$pkgver \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
