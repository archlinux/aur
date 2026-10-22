# Maintainer: Sergiu Puscas <srg.pscs@gmail.com>

pkgname=faro
_pkgname=faro
pkgver=0.1.4
pkgrel=1
pkgdesc='Terminal client for Signal, built for people who live in tmux'
arch=('x86_64' 'aarch64')
url='https://getfaro.dev'
license=('AGPL-3.0-only' 'MIT')
# openssl: presage's store is SQLCipher, which links libcrypto on Linux.
# The release build links it dynamically (the vendored-openssl feature is
# only for dist's prebuilt archives, which faro-bin installs).
depends=('glibc' 'libgcc' 'openssl')
makedepends=('cargo' 'protobuf' 'cmake' 'clang')
optdepends=(
  'xdg-utils: open links and attachments'
  'mpv: play voice notes (or ffmpeg, pipewire, alsa-utils)'
  'ffmpeg: read voice notes that are not WAV'
  'python-openai-whisper: transcribe voice notes locally (the default command)'
  'whisper-cpp: transcribe voice notes locally (whisper-cli)'
  'libsecret: read the remote transcription API key from the keyring'
)
# The release profile strips the binary, so a -debug package would be empty.
options=('!lto' '!debug')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/harababurel/faro/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b7a29d71210bb3c78f4909e9b1860d204e722873179abb2a0164157b035bfd6d')

# The GitHub tarball has no .git, so build.rs falls back to the bare
# version line ("0.1.0"); set FARO_BUILD_COMMIT/FARO_BUILD_DATE in build()
# if a fuller line is ever wanted.

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Keep the build directory out of the binary (panic messages embed source paths).
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/"
  cargo build --frozen --release --package faro
}

check() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Keep the build directory out of the binary (panic messages embed source paths).
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/"
  # faro-site (the website generator, not packaged) needs git for its source link.
  cargo test --frozen --workspace --exclude faro-site
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" THIRD_PARTY_NOTICES.md
}
