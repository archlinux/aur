# Maintainer: Simon Jackson <sizeak at gmail dot com>
pkgname=claude-commander
pkgver=0.33.0
pkgrel=1
pkgdesc='A high-performance terminal UI for managing Claude coding sessions'
arch=('x86_64' 'aarch64')
url='https://github.com/sizeak/claude-commander'
license=('MIT')
# libpipewire + alsa-lib: cpal's audio backends are dynamically linked (PipeWire
# is the default host, ALSA the runtime fallback).
depends=('tmux' 'git' 'pipewire' 'alsa-lib')
# clang: cpal's pipewire-sys/libspa-sys build scripts run bindgen.
makedepends=('cargo' 'clang')
# claude-commander strips its own binary via [profile.release] (strip = true),
# so opt out of makepkg's default debug-package split to avoid a broken/empty
# claude-commander-debug package.
#
# !lto: the rustls crypto provider (aws-lc-rs, via reqwest) compiles C and
# assembly through a build script that inherits makepkg's CFLAGS. Arch's default
# `-flto=auto` turns those C objects into LTO bitcode that the static-lib link
# rejects ("archive member is neither ET_REL nor LLVM bitcode"). Stripping LTO
# from the C flags fixes the build; Rust's own release LTO is set in
# [profile.release], not here.
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sizeak/claude-commander/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46a9f2036a97db332fa3d40d69e6a416b5c8a2069fe288a196678371c90c0560')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
