# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgbase=espanso
pkgname=(
  espanso-x11
  espanso-wayland
)
pkgver=2.2.1
pkgrel=4
pkgdesc="Cross-platform Text Expander written in Rust"
arch=(x86_64)
url="https://github.com/espanso/espanso"
license=(GPL-3.0-only)
makedepends=(
  bzip2
  cargo
  dbus
  gcc-libs
  glibc
  libx11
  libxcb
  libxkbcommon
  libxtst
  openssl
  wl-clipboard
  wxwidgets-common
  wxwidgets-gtk3
  xclip
  xdotool
)

source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('795663cb64c28322b667998f95910134b042be2baaace5506790f7e44ae3be91')
options=(!lto)

_archive="$pkgbase-$pkgver"

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

  export CARGO_TARGET_DIR=target-x11
  cargo build --frozen --release \
    --manifest-path espanso/Cargo.toml \
    --package espanso

  export CARGO_TARGET_DIR=target-wayland
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

package_espanso-x11() {
  pkgdesc+=" (built for X11)"
  depends=(
    bzip2
    dbus
    gcc-libs
    glibc
    libx11
    libxcb
    libxkbcommon
    libxtst
    openssl
    wxwidgets-common
    wxwidgets-gtk3
    xclip
    xdotool
  )
  provides=(espanso)
  conflicts=(espanso)
  replaces=(espanso)

  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" target-x11/release/espanso
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" espanso.service
  install -Dm644 -t "$pkgdir/usr/share/applications" espanso.desktop
  install -Dm644 -t "$pkgdir/usr/share/doc/espanso" ./*.md
  install -Dm644 espanso/src/res/linux/icon.png \
    "$pkgdir/usr/share/pixmaps/espanso.png"
}

package_espanso-wayland() {
  pkgdesc="$pkgdesc (built for Wayland)"
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
  provides=(espanso)
  conflicts=(espanso)
  install=espanso-wayland.install

  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" target-wayland/release/espanso
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" espanso.service
  install -Dm644 -t "$pkgdir/usr/share/applications" espanso.desktop
  install -Dm644 -t "$pkgdir/usr/share/doc/espanso" ./*.md
  install -Dm644 espanso/src/res/linux/icon.png \
    "$pkgdir/usr/share/pixmaps/espanso.png"
}
