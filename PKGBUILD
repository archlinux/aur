# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-advanced-scene-switcher
pkgver=1.25.3
pkgrel=1
pkgdesc="An automated scene switcher for OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/advanced-scene-switcher.395/"
license=(GPL-2.0-or-later)
depends=(
  "obs-studio>=28" "glibc" "gcc-libs" "alsa-lib" "jack" "leptonica"
  "libprocps" "libx11" "opencv" "qt6-base" "tesseract"
)
makedepends=(
  "cmake" "git" "asio" "cpp-httplib" "curl" "libxss"
  "libxtst" "websocketpp" "nlohmann-json" 
  #"openvr" Windows-only for now
)
optdepends=(
  "curl: Remote file access feature"
  "libxss: X screensaver related features"
  "libxtst: X key press related features"
  #"openvr: OpenVR features" Windows-only
)
options=('debug')
source=(
  "$pkgname::git+https://github.com/WarmUpTill/SceneSwitcher.git#tag=$pkgver"
  "libremidi::git+https://github.com/jcelerier/libremidi.git"
   # https://github.com/crow-translate/crow-translate/tree/c295226520c8af26493500a08908dbc765337576/cmake
  "DetectLibraryType.cmake"
  "FindLeptonica.cmake" 
  "FindTesseract.cmake"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "81fccf8bcfadaf3bc6c1a67321376a1d37e20be05284660bdee6f61ef64ee8f7"
  "21444991ea07c75ebe4b78d10ab58e96326b2371147bb3c639ad4311026d1501"
  "908aee4fccba9ef2ff9796e22a8ccd7eff5bb7f74feca409feca474e038bf843"
)

prepare() {
  cd $pkgname

  git config submodule.deps/libremidi.url $srcdir/libremidi
  git -c protocol.file.allow=always submodule update deps/libremidi
  
  sed -i 's/find_package(OpenCV)/find_package(OpenCV REQUIRED)/g' plugins/video/CMakeLists.txt
  # Tesseract package is build with autoconf, so no CMake package
  
  sed -i 's/find_package(Leptonica)/find_package(Leptonica REQUIRED)/g' plugins/video/CMakeLists.txt
  sed -i 's/find_package(Tesseract)/find_package(Tesseract REQUIRED)/g' plugins/video/CMakeLists.txt
  cp $srcdir/*.cmake cmake/common/.
  sed -i 's/::libtesseract/::Tesseract/g' plugins/video/CMakeLists.txt

  sed -i 's|set(CPP_HTTPLIB_DIR "${ADVSS_SOURCE_DIR}/deps/cpp-httplib")|find_package(httplib REQUIRED)|g' plugins/twitch/CMakeLists.txt
  sed -i 's|EXISTS "${CPP_HTTPLIB_DIR}/CMakeLists.txt"|httplib_FOUND|g' plugins/twitch/CMakeLists.txt
  sed -i 's|add_subdirectory("${CPP_HTTPLIB_DIR}"|#add_subdirectory("${CPP_HTTPLIB_DIR}"|g' plugins/twitch/CMakeLists.txt
  sed -i 's|EXCLUDE_FROM_ALL|#aEXCLUDE_FROM_ALL|g' plugins/twitch/CMakeLists.txt

  # Fix building issue by updating libremidi
  cd deps/libremidi
  git checkout v4.5.0
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DQT_VERSION=6 \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
