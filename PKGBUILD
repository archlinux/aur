# Mainteiner: Antonio Cervone <ant.cervone@gmail.com>
# Contributor: Gabriel Chamon Araujo <gchamon@live.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>

pkgname=magics++
Pkgname=Magics
pkgver=4.8.2
_attnum=3473464
pkgrel=0
pkgdesc="Magics is the latest generation of the ECMWF's Meteorological plotting software MAGICS."
arch=('i686' 'x86_64')
url="https://software.ecmwf.int/wiki/display/MAGP"
license=('Apache')
depends=('eccodes>=2.19.0' qt5-base pango proj python)
optdepends=(ksh libaec odb_api)
makedepends=(cmake gcc-fortran perl-xml-parser python-jinja swig)
source=(http://software.ecmwf.int/wiki/download/attachments/${_attnum}/${Pkgname}-${pkgver}-Source.tar.gz
        gcc11.patch)
sha256sums=('2bdc36d740b8b5d9967ddd98b05b5ef0f404ef3cf8651cc66f362d4826ab32f7'
            'c0250ac473b4703e79c8f879f6271d1409e800a0f8a7a77b3793cc9ce9a85951')

prepare() {
  cd "${Pkgname}-${pkgver}-Source"
  patch --forward --strip=1 --input=$srcdir/gcc11.patch
}

build() {
  [ -x /usr/bin/odb ] && has_odb=ON || has_odb=OFF
  # force this for now. Metview does not compile
  has_odb=OFF

  cmake \
    -B build \
    -S "${Pkgname}-${pkgver}-Source" \
    -DCMAKE_LINKER_FLAGS="-pthread" \
    -DCMAKE_SHARED_LINKER_FLAGS="-pthread" \
    -DCMAKE_EXE_LINKER_FLAGS="-pthread" \
    -DENABLE_ODB=${has_odb} \
    -DGEOTIFF_PATH=/usr \
    -Dodb_api_DIR=/usr/share/odb_api/cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=production \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DENABLE_METVIEW=1 \
    -DENABLE_QT5=1 \
    -DPYTHON_EXECUTABLE=/usr/bin/python3

  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}

