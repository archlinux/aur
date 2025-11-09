# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=librespot-git
_pkgname=librespot
pkgver=2138.84a33021
pkgrel=1
epoch=1
pkgdesc="Open Source Spotify client library"
pkgdesc='Open source client library for Spotify'
arch=(x86_64 armv6h armv7h aarch64)
url='https://github.com/librespot-org/librespot'
provides=('librespot')
conflicts=('librespot')
license=('MIT')
depends=(
  alsa-lib
  avahi
  gcc-libs
  glibc
  gst-plugins-base-libs
  gstreamer
)
makedepends=(
  cargo
  git
  jack
  libpulse
  portaudio
  sdl2
)
optdepends=(
  'gst-plugins-base: Audio playback using GStreamer'
  'gst-plugins-good: Audio playback using GStreamer'
  'jack2: Audio playback using JACK'
  'libpulse: Audio playback using PulseAudio'
  'portaudio: Audio playback using PortAudio'
  'sdl2: Audio playback using SDL2'
)
options=(!lto)
source=('git+https://github.com/librespot-org/librespot')
sha256sums=('SKIP')

_features=(
  # TLS
  native-tls
  #rustls-tls-native-roots
  #rustls-tls-webpki-roots

  # backends
  alsa-backend
  gstreamer-backend
  jackaudio-backend
  portaudio-backend
  pulseaudio-backend
  rodio-backend
  rodiojack-backend
  sdl-backend

  passthrough-decoder

  with-avahi
  with-dns-sd
  with-libmdns
)

pkgver() {
    cd "$_pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features "${_features[*]}" --workspace
}

check() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --features "${_features[*]}" --workspace
}

package() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo install \
      --no-track \
      --locked \
      --features "${_features[*]}" \
      --root "$pkgdir/usr" \
      --path .

  install -D -m 644 contrib/librespot.service \
    "$pkgdir"/usr/lib/systemd/system/librespot.service
  install -D -m 644 contrib/librespot.user.service \
    "$pkgdir"/usr/lib/systemd/user/librespot.service
  install -D -m 644 LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
