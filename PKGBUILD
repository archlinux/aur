# Maintainer: peippo <christoph.fink@gmail.com>
pkgname=geos-git
pkgver=3.8.0dev.4c70abae
pkgrel=1

pkgdesc="C++ port of the Java Topology Suite (git version)"
url="http://trac.osgeo.org/geos/"
license=('LGPL')

arch=('i686' 'x86_64')
depends=('gcc-libs' 'bash')
conflicts=('geos')
provides=('geos')

source=("${pkgname}::git+https://git.osgeo.org/gitea/geos/geos.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    if [[ -e "Version.txt" ]]; then
        source Version.txt
        COMMIT="$(git rev-parse --short HEAD)"
        echo "${GEOS_VERSION_MAJOR}.${GEOS_VERSION_MINOR}.${GEOS_VERSION_PATCH}${GEOS_PATCH_WORD}.${COMMIT}"
    else
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    fi
}

build() {
    cd "${pkgname}"
    ./autogen.sh 
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" install
}
