# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kreport-git
pkgver=2.99.3.r1119.a284bf7
pkgrel=1
pkgdesc="A framework for creation and generation of reports in multiple formats. (GIT version)"
url='https://www.kde.org/applications/graphics/kreport'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kross'
         'kproperty-git'
         'hicolor-icon-theme'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python2'
             'marble'
             )
optdepends=('marble: marble plugin')
conflicts=('kreport')
provides=('kreport')
source=('git://anongit.kde.org/kreport.git')
sha1sums=('SKIP')

pkgver() {
  cd kreport
  _ver="$(cat CMakeLists.txt | grep -m1 'KReport VERSION' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo -e "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  sed 's|python|python2|g' -i kreport/tools/sdc.py \
                           -i kreport/cmake/modules/KDbCreateSharedDataClasses.cmake
}

build() {
  cd build

  cmake ../kreport \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -DPYTHON_EXECUTABLE="/usr/bin/python2"
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
