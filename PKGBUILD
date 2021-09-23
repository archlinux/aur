# Maintainer: simon chou <sentientcatgmaildotcom>
# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
pkgname=eccodes-git
pkgver=latest
pkgrel=1
pkgdesc="ECMWF decoding library for GRIB, BUFR and GTS"
arch=('x86_64')
url="https://github.com/ecmwf/${pkgname%-git}"
license=('Apache')
depends=('openjpeg' 'libpng' 'python3' 'netcdf' 'libaec')
makedepends=('gcc-fortran' 'python' 'python-numpy' 'cmake' 'ecbuild-git' 'git')
conflicts=('grib_api' 'libbufr-ecmwf')
#source=("eccodes::git+$url#branch=master")
source=("git+$url#branch=master")
md5sums=('SKIP')
prepare() {
  cd "${pkgname%-git}"
  sed -i 's/image.inmem_.*=.*1;//' src/grib_jasper_encoding.c
  #mkdir -p build
}

pkgver() {
				  cd "${pkgname%-git}"
          git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S ${pkgname%-git} \
        -DCMAKE_BUILD_TYPE=production \
        -DENABLE_AEC=TRUE \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_DATAROOTDIR=/usr/share/${pkgname%-git}/definitions \
        -DCMAKE_INSTALL_DATADIR=/usr/share \
        -DENABLE_PNG=TRUE \
        -DENABLE_ECCODES_THREADS=1 \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
