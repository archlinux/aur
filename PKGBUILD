# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-advanced-scene-switcher
pkgver=1.35.1
pkgrel=1
pkgdesc="An automated scene switcher for OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/advanced-scene-switcher.395/"
license=(GPL-2.0-or-later)
depends=(
  "obs-studio>=31.1.1" "glibc" "gcc-libs" "alsa-lib" "jack" "leptonica"
  "procps-ng" "libx11" "opencv" "qt6-base" "tesseract" "paho-mqtt-cpp"
)
makedepends=(
  "cmake" "git" "asio" "curl" "libxss" "libxtst"
  "openssl" "websocketpp" "nlohmann-json" "simde"
  #"cpp-httplib"
  #"openvr" Windows-only for now
)
optdepends=(
  "curl: Remote file access feature"
  "libxss: X screensaver related features"
  "libxtst: X key press related features"
  "openssl: Needed for Twitch features"
  #"openvr: OpenVR features" Windows-only
)
source=(
  "$pkgname::git+https://github.com/WarmUpTill/SceneSwitcher.git#tag=$pkgver"
  "libremidi::git+https://github.com/celtera/libremidi.git#tag=v5.4.3"
  "cpp-httplib::git+https://github.com/yhirose/cpp-httplib.git"
   # https://github.com/crow-translate/crow-translate/tree/c295226520c8af26493500a08908dbc765337576/cmake
  "DetectLibraryType.cmake"
  "FindLeptonica.cmake" 
  "FindTesseract.cmake"
  "https://github.com/WarmUpTill/SceneSwitcher/commit/e2ab14a3edf8ce19b000c5b41bcfbe0690c940c6.patch"
)
sha256sums=('f69cf89f6e8a66927a02bedda686b5f25fdde3e6264057c66ae2b0907b70083c'
            '96c3583ca49180c35091be66b9a670af88aafe842c1cf948c9b6e79bea2e0269'
            'SKIP'
            '81fccf8bcfadaf3bc6c1a67321376a1d37e20be05284660bdee6f61ef64ee8f7'
            '21444991ea07c75ebe4b78d10ab58e96326b2371147bb3c639ad4311026d1501'
            '908aee4fccba9ef2ff9796e22a8ccd7eff5bb7f74feca409feca474e038bf843'
            '955ab45c2ea48b27a8f2a1960a5a9cf15394c23d0652f92f921d42e4b15dde89')

prepare() {
  cd $pkgname

  git config submodule.deps/libremidi.url $srcdir/libremidi
  git config submodule.deps/cpp-httplib.url $srcdir/cpp-httplib
  git -c protocol.file.allow=always submodule update deps/libremidi deps/cpp-httplib

  sed -i 's/find_qt(/find_package(Qt6 /g' CMakeLists.txt
  sed -i 's/find_qt(/find_package(Qt6 /g' cmake/common/advss_helpers.cmake
  
  sed -i 's/find_package(OpenCV)/find_package(OpenCV REQUIRED)/g' plugins/video/CMakeLists.txt
  # Tesseract package is build with autoconf, so no CMake package
  
  sed -i 's/find_package(Leptonica)/find_package(Leptonica REQUIRED)/g' plugins/video/CMakeLists.txt
  sed -i 's/find_package(Tesseract)/find_package(Tesseract REQUIRED)/g' plugins/video/CMakeLists.txt
  cp $srcdir/*.cmake cmake/common/.
  sed -i 's/::libtesseract/::Tesseract/g' plugins/video/CMakeLists.txt

  patch -p1 < ${srcdir}/e2ab14a3edf8ce19b000c5b41bcfbe0690c940c6.patch
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_CXX_FLAGS="-w" \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
