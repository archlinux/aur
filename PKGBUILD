# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jekyll Wu <adaptee at gmail dot com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Marek Kubica <marek@xivilization.net>

pkgname=phonon-qt4-mplayer-git
pkgver=20120714.7217499
pkgrel=1
pkgdesc="Mplayer backend for phonon, the multimedia API of KDE. (Qt4 only) GIT version)"
arch=('x86_64')
url='https://projects.kde.org/projects/unmaintained/phonon-mplayer'
license=('LGPL')
depends=('mplayer'
         'phonon-qt4'
         )
makedepends=('cmake'
             'automoc4'
             'git'
             )
provides=('phonon-qt4-backend'
          'phonon-qt4-mplayer'
           )
conflicts=('phonon-qt4-mplayer')
replaces=('phonon-mplayer-git')
source=('git+https://invent.kde.org/unmaintained/phonon-mplayer.git'
        'fix_find_config.patch'
        'CMakeLists.txt.patch'
        )
sha256sums=('SKIP'
            'ee6a0a79b995b4bd5bf086624b89b4467411647e9ddeefcd6e1a81d70b318655'
            'fd6379172562065acb670e497ade517015f71829abf65cfd8424fe428e405df3'
            )

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
  CXXFLAGS+=" -fPIC"
  cmake ../phonon-mplayer \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON

  make
}


package () {
  make -C build DESTDIR="${pkgdir}" install
}
