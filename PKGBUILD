# Maintainer: absrdspc <repom2@airmail.cc>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christian Himpel <chressie at gmail dot com>
# Contributor: Johannes Hanika <hanatos at gmail dot com>

pkgname=darktable-rc
epoch=2
pkgver=3.0.0
pkgrel=1
pkgdesc="Utility to organize and develop raw images (RC/Stable version)"
arch=(x86_64)
url="https://darktable.org"
license=(GPL3)
conflicts=('darktable')
depends=(pugixml libjpeg-turbo colord-gtk libgphoto2 openexr lensfun iso-codes
         exiv2 flickcurl openjpeg2 graphicsmagick lua osm-gps-map libsecret openmp)
makedepends=(cmake intltool desktop-file-utils llvm clang python-jsonschema libwebp)
#source=("https://github.com/darktable-org/darktable/releases/download/release-${pkgver}/darktable-${pkgver/rc/.rc}.tar.xz"{,.asc})
source=("https://github.com/darktable-org/darktable/releases/download/release-${pkgver}/darktable-${pkgver}.tar.xz"{,.asc})
sha256sums=('7195a5ff7ee95ab7c5a57e4e84f8c90cc4728b2c917359203c21293ab754c0db' 'SKIP')
validpgpkeys=(C4CBC150699956E2A3268EF5BB5CC8295B1779C9  # darktable releases <release@darktable.org>
              F10F9686652B0E949FCD94C318DCA123F949BD3B) # Pascal Obry <pascal@obry.net>

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../darktable-${pkgver/rc/~rc} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DBINARY_PACKAGE_BUILD=1 \
        -DBUILD_USERMANUAL=False \
        -DUSE_LIBSECRET=ON \
        -DUSE_LUA=ON \
        -DUSE_COLORD=ON \
        -DRAWSPEED_ENABLE_LTO=ON \
        -DPROJECT_VERSION=${pkgver}
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    ln -s darktable/libdarktable.so "${pkgdir}"/usr/lib/libdarktable.so
}

