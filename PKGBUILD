# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
_pkgname=ansel
pkgname="${_pkgname}-git"
pkgver=0.0.0.r524.gd825e81a1
pkgrel=1
pkgdesc="Ansel is an open-source photo-editing software for digital artists, designed to help you achieve your own interpretation of raw digital photographs."
arch=("i686" "x86_64")
url="https://ansel.photos/"
license=("GPL3")
depends=(pugixml libjpeg-turbo colord-gtk openexr lensfun iso-codes zlib exiv2
         flickcurl openjpeg2 graphicsmagick lua osm-gps-map libsecret openmp
         gmic libavif jasper libjxl libraw)
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
source=("git+https://github.com/aurelienpierreeng/ansel.git")
sha512sums=("SKIP")

pkgver() {
  cd "${_pkgname}"

  tools/get_git_version_string.sh | sed "s/+/.r/;s/~/./;s/-dirty//"
}

prepare() {
  cd "${_pkgname}"

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
        -DUSE_LIBSECRET=ON \
        -DUSE_LUA=ON \
        -DUSE_BUNDLED_LUA=OFF \
        -DUSE_LIBRAW=ON \
        -DUSE_BUNDLED_LIBRAW=OFF \
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
