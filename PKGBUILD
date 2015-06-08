# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jekyll Wu <adaptee at gmail dot com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Marek Kubica <marek@xivilization.net>

pkgname=phonon-mplayer-git
pkgver=20120714.7217499
pkgrel=1
pkgdesc="Mplayer backend for phonon, the multimedia API of KDE. (Qt4 only) GIT version)"
arch=("i686" "x86_64")
url="https://projects.kde.org/projects/unmaintained/phonon-mplayer"
license=("LGPL")
depends=('mplayer')
makedepends=('cmake' 'automoc4' 'git' phonon-qt4)
provides=('phonon-backend' 'phonon-qt4-backend' 'phonon-qt4-mplayer')
conflicts=('phonon-qt4-mplayer')
replaces=('phonon-mplayer')
source=('git://anongit.kde.org/phonon-mplayer.git'
        'fix_find_config.patch'
        'CMakeLists.txt.patch')
sha1sums=('SKIP'
          'ab6c195ebda7a89383edd127bf159c557859993e'
          '139e1d7c8e8f64374ebd47ec7306f1701c0653d9')

pkgver() {
  cd phonon-mplayer
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
  mkdir -p build

  patch -d phonon-mplayer -Np1 -i ../fix_find_config.patch
  patch -d phonon-mplayer -Np0 -i ../CMakeLists.txt.patch
}

build() {
  cd build
  [ ${CARCH} = 'x86_64' ] && CXXFLAGS+=" -fPIC"
  cmake ../phonon-mplayer \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON
  make
}


package () {
  make -C build DESTDIR="${pkgdir}" install
}
