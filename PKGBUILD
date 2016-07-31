# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=kaudiocreator-git
pkgver=1.3.r835.d8c20a8
pkgrel=1
pkgdesc="a program for ripping and encoding Audio-CDs, encoding files from disk. (GIT version)"
arch=('i686' 'x86_64')
url='https://www.kde.org/applications/multimedia/kaudiocreator'
license=('GPL')
depends=('kdelibs4support'
         'knotifyconfig'
         'kcmutils'
         'libdiscid'
         'libkcddb-git'
         'libkcompactdisc-frameworks-git'
         'taglib'
         'hicolor-icon-theme'
         )
makedepends=('git'
             'cmake'
             'extra-cmake-modules'
             'kdoctools'
             'doxygen'
             'python'
             )
conflicts=('kaudiocreator')
provides=('kaudiocreator')
source=('git://anongit.kde.org/kaudiocreator.git#branch=kf5'
        'CMakeLists.txt.diff'
        )
sha1sums=('SKIP'
          '82ea32c207ffa6fc6c0b702a727ab05212e39eb1'
          )

pkgver() {
  cd kaudiocreator
  _ver="$(cat main.cpp | grep -m1 KAudioCreator | cut -d '"' -f6)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  cd kaudiocreator
  patch -p1 -i "${srcdir}/CMakeLists.txt.diff"
}

build() {
  cd build

  cmake ../kaudiocreator \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
