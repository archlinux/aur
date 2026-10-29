# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-advanced-scene-switcher
pkgver=1.37.0
pkgrel=1
pkgdesc="An automated scene switcher for OBS Studio"
arch=(x86_64 aarch64)
url="https://obsproject.com/forum/resources/advanced-scene-switcher.395/"
license=(GPL-2.0-or-later)
depends=(
  'obs-studio>=31.1.1' glibc gcc-libs alsa-lib jack leptonica procps-ng
  libx11 opencv qt6-base tesseract paho-mqtt-cpp paho-mqtt-c libusb openssl
  'whisper-cpp>=1.9.5'
)
makedepends=(
  cmake git asio curl libxss libxtst websocketpp nlohmann-json simde
  'cpp-httplib>=0.63.0' 'jsoncons>=1.10.0'
)
makedepends_x86_64=(boost libpipewire readerwriterqueue 'libremidi>=4.5.0')
optdepends=(
  'curl: remote file access'
  'libxss: X screensaver related features'
  'libxtst: X key press related features'
)
optdepends_x86_64=('libpipewire: PipeWire MIDI backend')
source=(
  "$pkgname::git+https://github.com/WarmUpTill/SceneSwitcher.git#commit=e136086ca3588146796195399150a5aa2dd349b9"
  system-libraries.patch
)
source_aarch64=(
  'libremidi::git+https://github.com/celtera/libremidi.git#commit=73e6ea40de1a1ee35f16022e70fecfb45ae4061d'
)
sha256sums=('SKIP'
            'b32f1fdd2e91dcff3eb792a6da6b36bdf7aa5c4ceff607620e05553b37fd5ca1')
sha256sums_aarch64=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i "$srcdir/system-libraries.patch"
  if [[ $CARCH == aarch64 ]]; then
    git config submodule.deps/libremidi.url "$srcdir/libremidi"
    git -c protocol.file.allow=always submodule update --init deps/libremidi
  fi
}

build() {
  local system_libremidi=ON
  [[ $CARCH == aarch64 ]] && system_libremidi=OFF
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_COMPILE_WARNING_AS_ERROR=OFF \
    -DADVSS_SYSTEM_LIBREMIDI="$system_libremidi"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/$pkgname/deps/websocketpp/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-websocketpp"
  if [[ $CARCH == aarch64 ]]; then
    install -Dm644 "$srcdir/$pkgname/deps/libremidi/LICENSE.md" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE-libremidi"
  fi
  rm -rf "$pkgdir/usr/advanced-scene-switcher"
}
