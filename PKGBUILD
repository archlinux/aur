# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Kuba Serafinowski <zizzfizzix at gmail dot com>
# Contributor: Rick W. Chen <stuffcorpse at archlinux dot us>

pkgname=libechonest-qt5-git
pkgver=2.3.1.r320.3ce7795
pkgrel=1
pkgdesc="C++ library for interfacing with Echo Nest (git version)"
arch=('i686' 'x86_64')
url='https://cgit.kde.org/libechonest.git'
license=('GPL')
depends=('qt5-base')
makedepends=('cmake')
provides=('libechonest-qt5')
conflicts=('libechonest-qt5')
source=('git://anongit.kde.org/libechonest')
sha1sums=('SKIP')

pkgver() {
    cd libechonest
    _ver="$(cat CMakeLists.txt | grep -m3 -e ECHONEST_LIB_MAJOR_VERSION -e ECHONEST_LIB_MINOR_VERSION -e ECHONEST_LIB_PATCH_VERSION | grep -o "[[:digit:]]*" | paste -sd'.')"
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
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release \
            -DECHONEST_BUILD_TESTS=off \
            -DBUILD_WITH_QT4=OFF \
            ../libechonest
    make
}

package() {
    make -C build DESTDIR="${pkgdir}" install
}
