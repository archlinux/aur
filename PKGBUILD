# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-advanced-scene-switcher
pkgver=1.37.2
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
  'cpp-httplib>=0.63.0' 'jsoncons>=1.10.0' boost libpipewire readerwriterqueue
)
optdepends=(
  'curl: remote file access'
  'libxss: X screensaver related features'
  'libxtst: X key press related features'
)
optdepends+=('libpipewire: PipeWire MIDI backend')
source=(
  "$pkgname::git+https://github.com/WarmUpTill/SceneSwitcher.git#commit=6b8e666d5826d3c0784d2bd16c1d309b296f1b7b"
  system-libraries.patch
  'libremidi::git+https://github.com/celtera/libremidi.git#commit=e9d3851b4e97ef6ef1d465d9a8983a96a290c6c7'
)
sha256sums=('SKIP'
            'bfc5140adf59cbe403a7c28d9e5eec974ebebfd8032779d8e925b65a034bafa1'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i "$srcdir/system-libraries.patch"
  rmdir deps/libremidi
  ln -s "$srcdir/libremidi" deps/libremidi
}

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_COMPILE_WARNING_AS_ERROR=OFF \
    -DLIBREMIDI_FIND_BOOST=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/$pkgname/deps/websocketpp/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-websocketpp"
  install -Dm644 "$srcdir/libremidi/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-libremidi"
  rm -rf "$pkgdir/usr/advanced-scene-switcher"
}
