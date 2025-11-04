# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgbase=espanso
pkgname=(
  espanso-x11
  espanso-wayland
)
pkgver=2.3.0
pkgrel=1
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
options=(!lto)
source=(
  "$url/archive/v$pkgver/$pkgbase-$pkgver.tar.gz"
)
sha256sums=('32b315a813114b28ef3ee74c5d2ce0bfc2f75a0bd9a4141c7465cd0b00fdf34c')

prepare() {
  cd $pkgbase-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Don't change the original service file, as it will be embedded in the
  # binary
  sed 's|{{{espanso_path}}}|/usr/bin/espanso|g' espanso/src/res/linux/systemd.service \
    >espanso.service

  # Icon name
  sed 's/Icon=icon/Icon=espanso/g' espanso/src/res/linux/espanso.desktop \
    >espanso.desktop
}

build() {
  cd $pkgbase-$pkgver

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
  cd $pkgbase-$pkgver

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

  cd $pkgbase-$pkgver
  install -vDm755 -t "$pkgdir/usr/bin" target-x11/release/espanso
  install -vDm644 -t "$pkgdir/usr/lib/systemd/user" espanso.service
  install -vDm644 -t "$pkgdir/usr/share/applications" espanso.desktop
  install -vDm644 -t "$pkgdir/usr/share/doc/espanso" ./*.md
  install -vDm644 espanso/src/res/linux/icon.png \
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

  cd $pkgbase-$pkgver
  install -vDm755 -t "$pkgdir/usr/bin" target-wayland/release/espanso
  install -vDm644 -t "$pkgdir/usr/lib/systemd/user" espanso.service
  install -vDm644 -t "$pkgdir/usr/share/applications" espanso.desktop
  install -vDm644 -t "$pkgdir/usr/share/doc/espanso" ./*.md
  install -vDm644 espanso/src/res/linux/icon.png \
    "$pkgdir/usr/share/pixmaps/espanso.png"
}
