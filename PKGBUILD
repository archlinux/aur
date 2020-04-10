# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname='qmapshack-git'
pkgver=1.14.1.r3.g72bf4529
pkgrel=1
pkgdesc='Plan your next outdoor trip'
arch=('x86_64')
url='https://bitbucket.org/maproom/qmapshack/'
license=('GPL3')
depends=('gdal' 'desktop-file-utils' 'quazip' 'qt5-webengine' 'routino>=3.1')
makedepends=('cmake' 'git')
conflicts=('qmapshack')
provides=('qmapshack')
replaces=('qmapshack-hg')
source=("$pkgname::git+https://github.com/Maproom/qmapshack.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    git describe --long --tags  | sed 's/^V_//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"

    sed -i "s/set(VERSION_SUFFIX \"develop\")/set(VERSION_SUFFIX \"r${pkgver#*r}\")/" CMakeLists.txt
    [ ! -f cmake/Modules/FindPROJ4.cmake ] && patch --quiet -p1 < FindPROJ4.patch
    [ ! -f cmake/Modules/FindQuaZip5.cmake ] && patch --quiet -p1 < FindQuaZip5.patch
    cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$pkgname"

    make DESTDIR="${pkgdir}" install
}
