# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-advanced-scene-switcher
pkgver=1.24.0
pkgrel=1
pkgdesc="An automated scene switcher for OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/advanced-scene-switcher.395/"
license=("GPL2")
depends=(
  "obs-studio>=28" "alsa-lib" "gcc-libs" "glibc" "jack" "leptonica"
  "libx11" "opencv" "libprocps" "qt6-base" "tesseract"
)
makedepends=(
  "cmake" "git" "asio" "curl" "libxss" "libxtst"
  "openvr" "websocketpp" "nlohmann-json"
)
optdepends=(
  "curl: Remote file access feature"
  "libxss: X screensaver related features"
  "libxtst: X key press related features"
  "openvr: OpenVR features"
)
options=('debug')
source=(
  "$pkgname::git+https://github.com/WarmUpTill/SceneSwitcher.git#tag=$pkgver"
  "libremidi::git+https://github.com/jcelerier/libremidi.git"
)
sha256sums=(
  "SKIP"
  "SKIP"
)

prepare() {
  cd $pkgname

  git config submodule.deps/libremidi.url $srcdir/libremidi
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S $pkgname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
