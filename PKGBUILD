# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libkcddb-git
pkgver=16.08.0.r681.880e55d
pkgrel=1
pkgdesc="KDE CDDB library. (GIT version)"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdemultimedia/libkcddb'
license=('GPL' 'LGPL' 'FDL')
depends=('kio'
         'libmusicbrainz5'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             )
conflicts=('libkcddb'
           'libkcddb-frameworks-git'
           )
provides=('libkcddb')
source=('git://anongit.kde.org/libkcddb')
sha256sums=('SKIP')

pkgver() {
    cd libkcddb
    _ver="$(cat CMakeLists.txt | grep -m1 PROJECT_VERSION | grep -o "[[:digit:]]*" | paste -sd'.')"
    echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    if [[ -d build ]]; then
        rm -Rf build
    fi
    mkdir -p build
}

build() {
    cd build
    cmake ../libkcddb \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF
    make
}

package() {
    make -C build DESTDIR="${pkgdir}" install
}
