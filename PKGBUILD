# Maintainer: Adrian Carpenter <adriatic.c@gmail.com>
pkgname=ktechlab-qt5-git
pkgver=r839.d5096083
pkgrel=1
pkgdesc="An IDE for microcontrollers and electronics (unreleased version)"
arch=('x86_64')
url="https://community.kde.org/Incubator/Projects/KTechLab"
license=('GPL')
depends=('glib2' 'gpsim' 'kconfig' 'kcoreaddons' 'kdelibs4support' 'kdesignerplugin' 'kdoctools' 'khtml' 'ki18n' 'kiconthemes' 'kinit' 'kio' 'kparts' 'ktexteditor' 'ktextwidgets' 'kwidgetsaddons' 'qt5-base' 'solid')
makedepends=('git' 'cmake' 'extra-cmake-modules')
conflicts=('ktechlab')
source=('git://github.com/ktechlab/ktechlab.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-qt5-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-qt5-git}"

    sed -i '/set(GPSim_INCLUDE_DIRS/ c\
    set(GPSim_KLUDGE_DIR ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/kludge/include)\
    file(MAKE_DIRECTORY ${GPSim_KLUDGE_DIR})\
    file(TOUCH ${GPSim_KLUDGE_DIR}/../config.h)\
    set(GPSim_INCLUDE_DIRS ${GPSim_INCLUDE_DIR} ${GLib_INCLUDE_DIRS} ${GPSim_KLUDGE_DIR})' \
    cmake/modules/FindGPSim.cmake
}

build() {
    cd "$srcdir/${pkgname%-qt5-git}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr . 
    make -j2
}

package() {
    cd "$srcdir/${pkgname%-qt5-git}"
    make DESTDIR="$pkgdir/" install
}
