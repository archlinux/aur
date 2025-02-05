# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
_pkgname=ansel
pkgname="${_pkgname}-git"
pkgver=0.0.0.r1246.ga665765ed
pkgrel=1
pkgdesc="Ansel is an open-source photo-editing software for digital artists, designed to help you achieve your own interpretation of raw digital photographs."
arch=("i686" "x86_64")
url="https://ansel.photos/"
license=("GPL3")
depends=(
  "pugixml" "libjpeg-turbo" "colord-gtk" "openexr" "lensfun" "iso-codes" "zlib"
  "exiv2" "flickcurl" "openjpeg2" "graphicsmagick" "osm-gps-map" "libsecret"
  "openmp" "gmic" "libavif" "libheif" "jasper" "libjxl" "libraw" "libwebp"
)
optdepends=(
  "dcraw: base curve script"
  "perl-image-exiftool: base curve script"
  "imagemagick: base curve and noise profile scripts"
  "ghostscript: noise profile script"
  "portmidi: game and midi controller input devices"
  "gnuplot: noise profile script"
)
makedepends=(
  "git" "cmake" "intltool" "desktop-file-utils" "llvm" "clang" "portmidi"
  "python-jsonschema"
)
conflicts=("ansel")
provides=("ansel")
options=("!emptydirs" "!libtool")
source=(
  "git+https://github.com/aurelienpierreeng/ansel.git"
  "git+https://github.com/darktable-org/rawspeed.git"
  "git+https://github.com/KhronosGroup/OpenCL-Headers.git"
  "git+https://github.com/houz/libxcf.git"
  "git+https://github.com/gpakosz/whereami.git"
)
sha512sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)

pkgver() {
  cd "${_pkgname}"

  tools/get_git_version_string.sh | sed "s/+/.r/;s/~/./;s/-dirty//"
}

prepare() {
  cd "${_pkgname}"

  git submodule init
  git config submodule.src/external/rawspeed.url "${srcdir}/rawspeed"
  git config submodule.src/external/OpenCL.url "${srcdir}/OpenCL-Headers"
  git config submodule.src/external/libxcf.url "${srcdir}/libxcf"
  git config submodule.src/external/whereami.url "${srcdir}/whereami"
  # It looks like integration tests are already removed for ansel.
  # git config submodule.src/tests/integration.update none
  # We will use system LibRaw so don't update this submodule.
  git config submodule.src/external/LibRaw.update none
  git -c protocol.file.allow=always submodule update --recursive
}

build() {
  cd "${_pkgname}"

  # Don't use absolute path for install dirs, CMake expects relative path to
  # prefix and absolute path breaks RPATH, though we don't need RPATH because we
  # are installing to system library dirs and
  # <https://github.com/aurelienpierreeng/ansel/pull/258> gets merged.
  cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON \
        -DBINARY_PACKAGE_BUILD=ON \
        -DUSE_LIBSECRET=ON \
        -DUSE_LUA=OFF \
        -DUSE_BUNDLED_LUA=OFF \
        -DUSE_LIBRAW=ON \
        -DUSE_BUNDLED_LIBRAW=OFF \
        -DUSE_COLORD=ON \
        -DBUILD_CURVE_TOOLS=OFF \
        -DBUILD_NOISE_TOOLS=OFF \
        -DRAWSPEED_ENABLE_LTO=ON

  cmake --build build
}

package() {
  cd "${_pkgname}"

  DESTDIR="${pkgdir}" cmake --install build
}
