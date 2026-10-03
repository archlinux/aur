# Maintainer: Umar Alfarouk <medrivia@gmail.com>
pkgname=retuner
pkgver=1.1.0
pkgrel=2
pkgdesc="A precision audio pitch shifting plugin for converting music between different tuning standards"
arch=('x86_64' 'aarch64')
url="https://github.com/kushview/retuner"
license=('GPL-3.0-or-later')
groups=('pro-audio' 'vst3-plugins' 'lv2-plugins' 'clap-plugins')
options=('!debug')
depends=('alsa-lib' 'curl' 'fontconfig' 'freetype2' 'gtk3' 'hicolor-icon-theme'
         'libgcc' 'libstdc++'
         'libx11' 'libxext' 'libxinerama' 'libxrandr' 'libxcursor'
         'libxcomposite' 'libxrender'
         'mesa')
makedepends=('cmake' 'git' 'ninja')
source=("git+https://github.com/kushview/retuner.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname"

  cmake -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DJUCE_WEB_BROWSER=0 \
    -DJUCE_USE_CURL=1 \
    -DJUCE_VST3_CAN_REPLACE_VST2=0 \
    -DJUCE_USE_LAME_AUDIO_FORMAT=0 \
    -DJUCE_USE_MP3AUDIOFORMAT=1

  cmake --build build
}

check() {
  cd "$pkgname"
  ctest --test-dir build --output-on-failure
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" cmake --install build
}
