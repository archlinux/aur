# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=kaudiocreator-git
pkgver=1.3.r886.f21c160
pkgrel=1
pkgdesc="A program for ripping and encoding Audio-CDs, encoding files from disk. (GIT version)"
arch=('x86_64')
url='https://kde.org/applications/en/unmaintained/org.kde.kaudiocreator'
license=('GPL')
depends=('kdelibs4support'
         'knotifyconfig'
         'kcmutils'
         'libdiscid'
         'libkcompactdisc'
         'taglib'
         'libmusicbrainz5'
         )
makedepends=('git'
             'extra-cmake-modules'
             'kdoctools'
             'doxygen'
             'python'
             )
conflicts=('kaudiocreator')
provides=('kaudiocreator')
source=('git+https://invent.kde.org/unmaintained/kaudiocreator.git'
        'git+https://invent.kde.org/multimedia/libkcddb.git#branch=release/20.04')
sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd kaudiocreator
  _ver="$(cat main.cpp | grep -m1 KAudioCreator | cut -d '"' -f6)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build{,-libkcddb}

  sed -e 's|SHARED|STATIC|g' \
      -e 's|PRIVATE musicbrainz|&5|g' \
      -i libkcddb/libkcddb/CMakeLists.txt

  sed -e 's|TAGLIB_INCLUDE_DIR|Taglib_INCLUDE_DIRS|g' \
      -e 's|TAGLIB|Taglib|g' \
      -i kaudiocreator/CMakeLists.txt
}

build() {
  cd build-libkcddb
  cmake "${srcdir}/libkcddb" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX="${srcdir}/fakeroot/usr" \
    -DBUILD_TESTING=OFF

  make install

  cd "${srcdir}/build"
  cmake "${srcdir}/kaudiocreator" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DKF5Cddb_DIR="${srcdir}/fakeroot/usr/lib/cmake/KF5Cddb"

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
