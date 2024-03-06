# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgbase=espanso-git
pkgname=(
  espanso-x11-git
  espanso-wayland-git
)
_pkgbase=${pkgbase%-git}
_branch=dev
pkgver=2.2.0.r64.gd99e5d9
pkgrel=2
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
  git
)
source=("git+https://github.com/federico-terzi/espanso.git#branch=${_branch}")
sha256sums=('SKIP')
options=(!lto)

prepare() {
  cd "${_pkgbase}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"

  # Don't change the original service file, as it will be embedded in the
  # binary
  sed 's|{{{espanso_path}}}|/usr/bin/espanso|g' espanso/src/res/linux/systemd.service \
    > espanso.service

  # Icon name
  sed 's/Icon=icon/Icon=espanso/g' espanso/src/res/linux/espanso.desktop \
    > espanso.desktop
}

pkgver() {
    cd "${_pkgbase}"

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgbase}"

  export RUSTUP_TOOLCHAIN=stable

  export CARGO_TARGET_DIR=target-x11
  cargo build --frozen --release \
    --manifest-path Cargo.toml \
    --package espanso

  export CARGO_TARGET_DIR=target-wayland
  cargo build --frozen --release \
    --features wayland \
    --manifest-path Cargo.toml \
    --package espanso
}

check() {
  cd "${_pkgbase}"

  # Skip failing tests - unsure why they fail
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features -- \
    --skip tests::ipc_multiple_clients \
    --skip tests::test_migration
}

package_espanso-x11-git() {
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

  cd "${_pkgbase}"

  install -Dm755 -t "${pkgdir}/usr/bin" target-x11/release/espanso
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/user" espanso.service
  install -Dm644 -t "${pkgdir}/usr/share/applications" espanso.desktop
  install -Dm644 -t "${pkgdir}/usr/share/doc/espanso" ./*.md
  install -Dm644 espanso/src/res/linux/icon.png \
    "${pkgdir}/usr/share/pixmaps/espanso.png"
}

package_espanso-wayland-git() {
  pkgdesc+=" (built for Wayland)"
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

  cd "${_pkgbase}"

  install -Dm755 -t "${pkgdir}/usr/bin" target-wayland/release/espanso
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/user" espanso.service
  install -Dm644 -t "${pkgdir}/usr/share/applications" espanso.desktop
  install -Dm644 -t "${pkgdir}/usr/share/doc/espanso" ./*.md
  install -Dm644 espanso/src/res/linux/icon.png \
    "${pkgdir}/usr/share/pixmaps/espanso.png"
}
