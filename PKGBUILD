# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname='qmapshack-hg'
pkgver=1.13.0.r50.55dee1ae0d55
pkgrel=1
pkgdesc='Plan your next outdoor trip'
arch=('x86_64')
url='https://bitbucket.org/maproom/qmapshack/'
license=('GPL3')
depends=('gdal' 'desktop-file-utils' 'quazip' 'qt5-webengine' 'routino>=3.1')
makedepends=('cmake' 'mercurial')
conflicts=('qmapshack')
provides=('qmapshack')
source=("$pkgname::hg+https://bitbucket.org/maproom/qmapshack")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    hg log -r . --template '{latesttag}.r{latesttagdistance}.{node|short}' | sed 's/V //'
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
