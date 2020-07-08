# Maintainer: absrdspc <repom2@airmail.cc>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christian Himpel <chressie at gmail dot com>
# Contributor: Johannes Hanika <hanatos at gmail dot com>

pkgname=darktable-rc
epoch=2
pkgver=3.0.2
pkgrel=7
pkgdesc="Utility to organize and develop raw images (RC/Stable version)"
arch=(x86_64)
url="https://darktable.org"
license=(GPL3)
conflicts=('darktable')
depends=(pugixml libjpeg-turbo colord-gtk libgphoto2 openexr lensfun iso-codes zlib
         exiv2 flickcurl openjpeg2 graphicsmagick lua53 osm-gps-map libsecret openmp
         gmic)
optdepends=('dcraw: base curve script'
            'perl-image-exiftool: base curve script'
            'imagemagick: base curve and noise profile scripts'
            'ghostscript: noise profile script'
            'gnuplot: noise profile script')
makedepends=(cmake intltool desktop-file-utils llvm clang python-jsonschema libwebp)
source=("https://github.com/darktable-org/darktable/releases/download/release-${pkgver}/darktable-${pkgver}.tar.xz"{,.asc}
        darktable-fix-cmake.patch::https://github.com/darktable-org/darktable/commit/767d48e0f60e7f858e8b31a88dd8cc1258e7ee9e.patch)
sha256sums=('6abaf661fe9414e92bdb33b58b98ef024ccf6132b7876abaf0751ec2109f36fb'
            'SKIP'
            'cdcaf17a362c4fc551ede3ebc0933e48e20185a9fad2c18a025f0414c180ef0d')
validpgpkeys=(C4CBC150699956E2A3268EF5BB5CC8295B1779C9  # darktable releases <release@darktable.org>
              F10F9686652B0E949FCD94C318DCA123F949BD3B) # Pascal Obry <pascal@obry.net>

prepare() {
    cd ${pkgname}-${pkgver}
    patch -Np1 < ../darktable-fix-cmake.patch
}

build() {
    cmake -B build -S ${pkgname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DBINARY_PACKAGE_BUILD=1 \
        -DBUILD_USERMANUAL=False \
        -DUSE_LIBSECRET=ON \
        -DUSE_LUA=ON \
        -DUSE_COLORD=ON \
        -DBUILD_CURVE_TOOLS=ON \
        -DBUILD_NOISE_TOOLS=ON \
        -DRAWSPEED_ENABLE_LTO=ON \
        -DPROJECT_VERSION=${pkgver}
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" install
    ln -s darktable/libdarktable.so "${pkgdir}"/usr/lib/libdarktable.so
}

