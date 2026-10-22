# Maintainer: Ivan Odnoorov <elcheshirecat at yandex dot ru>
pkgname=ymusic-cli
_repo=ymusic
pkgver=3.3.1
pkgrel=1
pkgdesc="Terminal client for Yandex Music: My Wave, likes, stations (TUI)"
arch=('x86_64')
url="https://github.com/iodnoorov/ymusic"
license=('MIT')
depends=('libgcc' 'glibc')
optdepends=('pipewire-pulse: share the sound card with other programs (without a sound server sound goes straight to ALSA)'
            'pulseaudio: the same with PulseAudio instead of PipeWire')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('77d58527c3279a231e9556bdcbb5e2db6e6838723a7d8292c9b439aabee81bf8')

prepare() {
  cd "$_repo-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_repo-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_repo-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$_repo-$pkgver"
  install -Dm755 target/release/ymusic "$pkgdir/usr/bin/ymusic"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
