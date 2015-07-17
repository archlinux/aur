# Maintainer: Dimitri Merejkowsky <d.merej@archlinux.org>

pkgname=soprano-qt5-git
pkgver=v2.9.3.90.g3e00d37
pkgrel=3
pkgdesc="A library which provides a highly usable object-oriented C++/Qt5 framework for RDF data"
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('qt5-base' 'libiodbc' 'redland')
makedepends=('cmake' 'doxygen' 'git')
optdepends=('virtuoso')
conflicts=('soprano' 'soprano-qt5')
provides=('soprano' 'soprano-qt5')
groups=('kde-git')
source=('git://anongit.kde.org/soprano'
        '0001-Properly-export-plugins-when-using-Qt5.patch')
md5sums=('SKIP'
         '2b844cc3abe7574691aeb4083c5cec22')

pkgver() {
  cd soprano
  git describe --always | sed 's|-|.|g'
}

prepare() {
  rm -fr build
  mkdir -p build

  cd soprano
  patch -p1 < ../0001-Properly-export-plugins-when-using-Qt5.patch
}

build() {
  cd build
  cmake ../soprano \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DQT5_BUILD=ON \
    -DSOPRANO_DISABLE_CLUCENE_INDEX=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
