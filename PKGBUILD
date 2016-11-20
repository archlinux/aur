# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=kaudiocreator-git
pkgver=1.3.r842.ec22d77
pkgrel=1
pkgdesc="A program for ripping and encoding Audio-CDs, encoding files from disk. (GIT version)"
arch=('i686' 'x86_64')
url='https://www.kde.org/applications/multimedia/kaudiocreator'
license=('GPL')
depends=('kdelibs4support'
         'knotifyconfig'
         'kcmutils'
         'libdiscid'
         'libkcddb'
         'libkcompactdisc'
         'taglib'
         'hicolor-icon-theme'
         )
makedepends=('git'
             'extra-cmake-modules'
             'kdoctools'
             'doxygen'
             'python'
             )
conflicts=('kaudiocreator')
provides=('kaudiocreator')
source=('git://anongit.kde.org/kaudiocreator.git'
        'CMakeLists.txt.diff'
        )
sha256sums=('SKIP'
            '4442783ba25b4a05ac76e8a0dbf72101798cf4a87b7b0979598e309df82cbb7d'
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
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
