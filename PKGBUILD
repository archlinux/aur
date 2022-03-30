# Contributor: qs9rx.aur @ enjoys it
# Contributor: sedot <aur at fry dot fastmail dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
_name=PDAL
pkgname=pdal-git
pkgver=2.4.0.r2.ge63f88829
pkgrel=3
pkgdesc="A C++ library for translating and manipulating point cloud data."
arch=('x86_64')
url="http://www.pdal.io"
license=('BSD')
depends=('gdal' 'geos' 'libgeotiff')
makedepends=('cmake' 'git' 'sqlite')
optdepends=('libxml2: for using the database drivers'
            'sqlite: for the sqlite plugin'
            'tiledb: for the TileDB plugin'
            'postgresql-libs: for the postgresql plugin'
            'pcl: for PointCloudLibrary algorithms'
            'jsoncpp: for JSON pipelines'
            'zstd: for ZSTD compression')
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
        -DWITH_COMPLETION=ON

    make -j $(nproc --all)
}

package() {
    cd ${srcdir}/${_name}/build

    make DESTDIR="$pkgdir/" install
    install -Dm644 ../LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
