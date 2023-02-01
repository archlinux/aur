# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
_pkgname=ansel
pkgname="${_pkgname}-git"
pkgver=r34946.d6dac29c8
pkgrel=1
pkgdesc="Ansel is an open-source photo-editing software for digital artists, designed to help you achieve your own interpretation of raw digital photographs."
arch=("i686" "x86_64")
url="https://ansel.photos/"
license=("GPL3")
depends=(pugixml libjpeg-turbo colord-gtk openexr lensfun iso-codes zlib exiv2
         flickcurl openjpeg2 graphicsmagick lua53 osm-gps-map libsecret openmp
         gmic libavif)
optdepends=("dcraw: base curve script"
            "perl-image-exiftool: base curve script"
            "imagemagick: base curve and noise profile scripts"
            "ghostscript: noise profile script"
            "gnuplot: noise profile script")
makedepends=(git cmake intltool desktop-file-utils llvm clang python-jsonschema libwebp)
conflicts=(ansel)
provides=(ansel)
options=(!emptydirs !libtool)
source=("git+https://github.com/aurelienpierreeng/ansel.git")
sha512sums=("SKIP")

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
        -DBUILD_USERMANUAL=False \
        -DUSE_LIBSECRET=ON \
        -DUSE_LUA=ON \
        -DUSE_COLORD=ON \
        -DBUILD_CURVE_TOOLS=ON \
        -DBUILD_NOISE_TOOLS=ON \
        -DRAWSPEED_ENABLE_LTO=ON

  make -C build
}

package() {
  cd "${_pkgname}"

  make -C build DESTDIR="${pkgdir}" install
}
