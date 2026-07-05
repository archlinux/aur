# Maintainer: OneZ3r0 <onez3r0@outlook.com>

pkgname=niri-shm-sharing
_pkgname=niri
pkgver=26.04
pkgrel=2
_commit=8ed0da44d974c32c6877d2f4630c314da0717ecb
_shm_commit=f3207c77095114f9f2202ca7db8333d4c1a958d1
pkgdesc='A scrollable-tiling Wayland compositor with SHM/MemFd fallback patch for PipeWire screencasting'
arch=('x86_64')
url='https://github.com/niri-wm/niri'
license=('GPL-3.0-or-later')
options=('!lto')

depends=(
  'cairo'
  'glib2'
  'glibc'
  'libdisplay-info'
  'libgcc'
  'libinput'
  'libpipewire'
  'libxkbcommon'
  'mesa'
  'pango'
  'pixman'
  'seatd'
  'systemd-libs'
  'xdg-desktop-portal-impl'
)

makedepends=(
  'clang'
  'git'
  'rust'
)

optdepends=(
  'alacritty: a suggested GPU-accelerated terminal emulator'
  'bash: for niri-session script'
  'fuzzel: a suggested Wayland application launcher'
  'mako: a suggested Wayland notification daemon'
  'org.freedesktop.secrets: for apps to rely on secrets portal'
  'swaybg: a suggested Wayland wallpaper tool'
  'swaylock: a suggested Wayland screen locker'
  'waybar: a suggested Wayland customizable desktop bar'
  'xdg-desktop-portal-gnome: a XDG desktop portal required for screencasting'
  'xdg-desktop-portal-gtk: a suggested XDG desktop portal'
  'xwayland-satellite: for running X11 apps in XWayland'
)

provides=(
  "niri=${pkgver}"
  'wayland-compositor'
)

conflicts=(
  'niri'
)

source=(
  "${_pkgname}-${pkgver}::git+https://github.com/niri-wm/niri.git#commit=${_commit}"
  "support-shm-sharing-${_shm_commit}.patch::https://github.com/rucnyz/niri/commit/${_shm_commit}.patch"
)

sha256sums=('0a1f3e11002f2e57ee83da4a8f5dd86ae820adde111c809cf0fc65021fadf971'
            'f640a03669ff451f90b1ae3c81ab7cf4216a28e137f541111a15c2ae08fd8fd4')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  git -c user.name='makepkg' \
      -c user.email='makepkg@localhost' \
      am -3 "${srcdir}/support-shm-sharing-${_shm_commit}.patch"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export NIRI_BUILD_VERSION_STRING="${pkgver}-${pkgrel} shm-sharing"
  RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }--remap-path-prefix=${srcdir}=/usr/src/debug/${pkgname}" \
    cargo build --release --frozen
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }--remap-path-prefix=${srcdir}=/usr/src/debug/${pkgname}" \
    cargo test --release --frozen --lib
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "target/release/niri" "${pkgdir}/usr/bin/niri"

  install -Dm755 "resources/niri-session" \
    "${pkgdir}/usr/bin/niri-session"

  install -Dm644 "resources/niri.desktop" \
    "${pkgdir}/usr/share/wayland-sessions/niri.desktop"

  install -Dm644 "resources/niri-portals.conf" \
    "${pkgdir}/usr/share/xdg-desktop-portal/niri-portals.conf"

  install -Dm644 "resources/niri.service" \
    "${pkgdir}/usr/lib/systemd/user/niri.service"

  install -Dm644 "resources/niri-shutdown.target" \
    "${pkgdir}/usr/lib/systemd/user/niri-shutdown.target"

  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  install -Dm644 "resources/default-config.kdl" \
    "${pkgdir}/usr/share/doc/${_pkgname}/default-config.kdl"

  target/release/niri completions bash \
    | install -Dm644 /dev/stdin \
      "${pkgdir}/usr/share/bash-completion/completions/niri"

  target/release/niri completions fish \
    | install -Dm644 /dev/stdin \
      "${pkgdir}/usr/share/fish/vendor_completions.d/niri.fish"

  target/release/niri completions zsh \
    | install -Dm644 /dev/stdin \
      "${pkgdir}/usr/share/zsh/site-functions/_niri"
}
