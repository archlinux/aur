# Maintainer: Sergiu Puscas <srg.pscs@gmail.com>

pkgname=faro-git
_pkgname=faro
pkgver=0.1.0.r3.g7c5d439
pkgrel=1
pkgdesc='Terminal client for Signal, built for people who live in tmux (development version)'
arch=('x86_64' 'aarch64')
url='https://getfaro.dev'
license=('AGPL-3.0-only' 'MIT')
# openssl: presage's store is SQLCipher, which links libcrypto on Linux.
depends=('glibc' 'libgcc' 'openssl')
makedepends=('cargo' 'git' 'protobuf' 'cmake' 'clang')
optdepends=(
  'xdg-utils: open links and attachments'
  'mpv: play voice notes (or ffmpeg, pipewire, alsa-utils)'
  'ffmpeg: read voice notes that are not WAV'
  'whisper.cpp: transcribe voice notes locally'
  'libsecret: read the remote transcription API key from the keyring'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
# The release profile strips the binary, so a -debug package would be empty.
options=('!lto' '!debug')
source=("$_pkgname::git+https://github.com/harababurel/faro.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Keep the build directory out of the binary (panic messages embed source paths).
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/"
  cargo build --frozen --release --package faro
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Keep the build directory out of the binary (panic messages embed source paths).
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/"
  cargo test --frozen --workspace
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" THIRD_PARTY_NOTICES.md
}
