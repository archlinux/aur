# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
_pkgname=ansel
pkgname="${_pkgname}-git"
pkgver=r35200.ff82b5882
pkgrel=1
pkgdesc="Ansel is an open-source photo-editing software for digital artists, designed to help you achieve your own interpretation of raw digital photographs."
arch=("i686" "x86_64")
url="https://ansel.photos/"
license=("GPL3")
depends=(pugixml libjpeg-turbo colord-gtk openexr lensfun iso-codes zlib exiv2
         flickcurl openjpeg2 graphicsmagick lua osm-gps-map libsecret openmp
         gmic libavif jasper libjxl)
optdepends=("dcraw: base curve script"
            "perl-image-exiftool: base curve script"
            "imagemagick: base curve and noise profile scripts"
            "ghostscript: noise profile script"
            "portmidi: game and midi controller input devices"
            "gnuplot: noise profile script")
makedepends=(git cmake intltool desktop-file-utils llvm clang portmidi python-jsonschema libwebp)
conflicts=(ansel)
provides=(ansel)
options=(!emptydirs !libtool)
source=("git+https://github.com/aurelienpierreeng/ansel.git"
        "ansel-fix-build-exiv2-0-28.patch"
        "ansel-fix-build-libxml2.patch")
sha512sums=("SKIP"
            "5502a92f5d19b69262ea1d85499d20350732ca4ee96e2711c487a574ab4b9346bfc664d5906d6f81c18b398c53fd639671c740bae56b65ba036a516c98d8c396"
            "eb9e6585f7b707ef36afde1c54436a78581215647b6bfb3dde10714c52e96aed95c43b970757e6cbbf88a388c7b68312a8facbbe4ea27ef415f374be1d2c5d84")

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  git apply -3 "${srcdir}/ansel-fix-build-exiv2-0-28.patch"
  git apply -3 "${srcdir}/ansel-fix-build-libxml2.patch"

  git config submodule.src/tests/integration.update none
  git submodule update --init --recursive
}

build() {
  cd "${_pkgname}"

  # Don't use absolute path for install dirs, it breaks RPATH.
  cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DBINARY_PACKAGE_BUILD=1 \
        -DBUILD_USERMANUAL=False \
        -DUSE_LIBSECRET=ON \
        -DUSE_LUA=ON \
        -DUSE_COLORD=ON \
        -DBUILD_CURVE_TOOLS=ON \
        -DBUILD_NOISE_TOOLS=ON \
        -DRAWSPEED_ENABLE_LTO=ON

  cmake --build build
}

package() {
  cd "${_pkgname}"

  DESTDIR="${pkgdir}" cmake --install build
}
