# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname='qmapshack-hg'
pkgver=r4312.2a89299c92ed
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

    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd "$pkgname"

    [ ! -f cmake/Modules/FindPROJ4.cmake ] && patch --quiet -p1 < FindPROJ4.patch
    [ ! -f cmake/Modules/FindQuaZip5.cmake ] && patch --quiet -p1 < FindQuaZip5.patch
    cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$pkgname"

    make DESTDIR="${pkgdir}" install
}
