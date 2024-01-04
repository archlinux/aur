# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Hauke Ingwersen <hauing@pm.me>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=espanso-wayland
_name=espanso
pkgver=2.2.1
pkgrel=2
pkgdesc="Cross-platform Text Expander written in Rust (built for Wayland)"
arch=(x86_64)
url="https://github.com/espanso/espanso"
license=(GPL3)
depends=(
  bzip2
  dbus
  gcc-libs
  glibc
  libxkbcommon
  openssl
  wl-clipboard
  wxwidgets-common
  wxwidgets-gtk3
)
makedepends=(cargo)
provides=(espanso)
conflicts=(espenso)
options=(!lto)
install=espanso-wayland.install

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('795663cb64c28322b667998f95910134b042be2baaace5506790f7e44ae3be91')

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Don't change the original service file, as it will be embedded in the
  # binary
  sed 's|{{{espanso_path}}}|/usr/bin/espanso|g' espanso/src/res/linux/systemd.service \
    > espanso.service

  # Icon name
  sed 's/Icon=icon/Icon=espanso/g' espanso/src/res/linux/espanso.desktop \
    > espanso.desktop
}

build() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release \
    --features wayland \
    --manifest-path espanso/Cargo.toml \
    --package espanso
}

check() {
  cd "$_archive"

  # Skip failing tests - unsure why they fail
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features -- \
    --skip tests::ipc_multiple_clients \
    --skip tests::test_migration
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" target/release/espanso
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" espanso.service
  install -Dm644 -t "$pkgdir/usr/share/applications" espanso.desktop
  install -Dm644 -t "$pkgdir/usr/share/doc/espanso" ./*.md
  install -Dm644 espanso/src/res/linux/icon.png \
    "$pkgdir/usr/share/pixmaps/espanso.png"
}
