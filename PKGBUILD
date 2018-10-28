# Maintainer: sedot <aur at fry dot fastmail dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
_name=PDAL
pkgname=pdal-git
pkgver=1.7.1.r249.g504208055
pkgrel=1
pkgdesc="A C++ library for translating and manipulating point cloud data."
arch=('x86_64')
url="http://www.pdal.io"
license=('BSD')
depends=('gdal' 'geos' 'libgeotiff')
makedepends=('cmake' 'python' 'python-numpy' 'git' 'sqlite' 'postgresql-libs' 'pcl' 'laszip')
optdepends=('python-numpy: for the Python plugin'
            'libxml2: for using the database drivers'
            'sqlite: for the sqlite plugin'
            'postgresql-libs: for the postgresql plugin'
            'pcl: for PointCloudLibrary algorithms'
            'laszip: for LASzip compression'
            'laz-perf: an alternative LAZ implementation'
            'jsoncpp: for JSON pipelines')
provides=('pdal')
conflicts=('pdal')
source=("git+https://github.com/PDAL/PDAL")
sha512sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_name}
    git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${_name}

    mkdir -p build && cd build

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_PLUGIN_PYTHON=ON \
        -DBUILD_PLUGIN_PGPOINTCLOUD=ON \
        -DBUILD_PLUGIN_SQLITE=ON \
        -DBUILD_PLUGIN_PCL=ON \
        -DWITH_LAZPERF=ON \
        -DWITH_LASZIP=ON \
        -DWITH_COMPLETION=ON
        #-DRiVLib_DIR=
        #-DBUILD_PLUGIN_RIVLIB=ON

    make -j $(nproc --all)
}

package() {
    cd ${srcdir}/${_name}/build

    make DESTDIR="$pkgdir/" install
    install -Dm644 ../LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
