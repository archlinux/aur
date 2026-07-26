# Maintainer: hoxi <mail@hoxi.me>

pkgname=livesplit-one-gtk-git
_pkgname=livesplit-one-gtk
pkgver=0.7.2.r174.ga4ffdfc
pkgrel=1
pkgdesc="Linux desktop version of LiveSplit One using GTK4 and libadwaita"
arch=('x86_64')
url="https://github.com/hoXyy/livesplit-one-gtk"
license=('MIT')
depends=(
  'cairo'
  'glib2'
  'glibc'
  'gtk4>=4.14'
  'hicolor-icon-theme'
  'libadwaita>=1.5'
  'libgcc'
  'pango'
)
makedepends=('cargo' 'git')
provides=("livesplit-one-gtk=${pkgver}")
conflicts=('livesplit-one-gtk')
# GCC LTO objects produced by native Rust dependencies (such as mimalloc,
# ring, and wasmtime) cannot be consumed by Cargo's final LLD link.
options=('!lto')
source=("${_pkgname}::git+${url}.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  local version
  version="$(sed -n 's/^version = "\([^"]*\)"/\1/p' Cargo.toml | head -n 1)"
  printf '%s.r%s.g%s' \
    "${version}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
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
  cargo build --frozen --release
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features
}

package() {
  cd "${_pkgname}"

  install -Dm755 target/release/livesplit-one \
    "${pkgdir}/usr/bin/livesplit-one-gtk"
  install -Dm644 packaging/livesplit-one-gtk.desktop \
    "${pkgdir}/usr/share/applications/livesplit-one-gtk.desktop"
  install -Dm644 icons/icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/livesplit-one-gtk.svg"
  install -Dm644 icons/icon.png \
    "${pkgdir}/usr/share/pixmaps/livesplit-one-gtk.png"
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
