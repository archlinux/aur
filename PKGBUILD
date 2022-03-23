# Maintainer: Maximilian Friedersdorff <maximilian.friedersdorff@envsys.co.uk>
pkgname=libkea
pkgver=1.4.14
pkgrel=1
epoch=
pkgdesc="Library for interfacing with KEA, a HDF5 based Raster File Format"
arch=("x86_64")
url="http://kealib.org"
license=('MIT')
groups=()
depends=('hdf5' 'gdal')
source=("https://github.com/ubarsc/kealib/archive/refs/tags/kealib-1.4.14.tar.gz")
sha256sums=("b3f73104acebe5304ecce5c19c1560def66fd5c448ce251e9486494baeb141bc")

prepare() {
    mv "kealib-kealib-$pkgver" "$pkgname-$pkgver"

}
build() {
        cd "$pkgname-$pkgver"
        cmake \
            -D CMAKE_VERBOSE_MAKEFILE=ON \
            -D HDF5_INCLUDE_DIR=/usr/include/hdf5/serial \
            -D GDAL_INCLUDE_DIR=/usr/include/gdal \
            -D LIBKEA_WITH_GDAL=ON \
            -D BUILD_SHARED_LIBS=ON \
            -D CMAKE_BUILD_TYPE=Release \
            -D CMAKE_INSTALL_PREFIX=/usr \
            .
        make
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
        mkdir -p "$pkgdir/etc/profile.d"
        echo export GDAL_DRIVER_PATH=/usr/lib/gdalplugins >> "$pkgdir/etc/profile.d/kealib.sh"
}
