# Maintainer: germanua

pkgname=linux-soundboard-git
_pkgname=linux-soundboard
pkgver=2.0.0.r65.gd5cf541
pkgrel=1
pkgdesc="Native Linux soundboard with full Wayland/X11 support and virtual microphone support"
arch=('x86_64')
url="https://github.com/germanua/Linux-SoundBoard"
license=('custom:PolyForm-Noncommercial-1.0.0')
depends=(
  'gtk4'
  'libadwaita'
  'libpulse'
  'libx11'
  'libxi'
  'libxtst'
  'libxkbcommon'
  'hicolor-icon-theme'
  'polkit'
  'pipewire'
  'pipewire-pulse'
  'wireplumber'
)
makedepends=(
  'cargo'
  'git'
  'imagemagick'
  'clang'
  'pkgconf'
)
optdepends=(
  'swhkd-bin: native Wayland global hotkeys from the AUR'
  'swhkd-git: development build of the native Wayland hotkey daemon'
  'xorg-xwayland: enables the native X11 backend inside Wayland sessions'
)
provides=('linux-soundboard')
conflicts=('linux-soundboard')
install="${pkgname}.install"
source=(
  "${_pkgname}::git+${url}.git#branch=main"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local version rev hash
  version="$(sed -n 's/^version = "\(.*\)"$/\1/p' src/Cargo.toml | head -n 1)"
  rev="$(git rev-list --count HEAD)"
  hash="$(git rev-parse --short=7 HEAD)"

  printf '%s.r%s.g%s' "$version" "$rev" "$hash"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  bash packaging/linux/generate-icons.sh assets/icons/icon.png
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --manifest-path src/Cargo.toml
}

build() {
  cd "${srcdir}/${_pkgname}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/target"
  export RUSTFLAGS="${RUSTFLAGS:+${RUSTFLAGS} }--remap-path-prefix=${srcdir}=."
  cargo build --frozen --locked --release --manifest-path src/Cargo.toml
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 "${srcdir}/target/release/linux-soundboard" "${pkgdir}/usr/bin/linux-soundboard"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 packaging/rpm/linux-soundboard.desktop \
    "${pkgdir}/usr/share/applications/com.linuxsoundboard.app.desktop"

  local icon_root="src/resources/icons"
  local icon_names=("com.linuxsoundboard.app.png" "linux-soundboard.png")
  local size
  for size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512; do
    local icon_name
    for icon_name in "${icon_names[@]}"; do
      install -Dm644 "${icon_root}/${size}/apps/${icon_name}" \
        "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${icon_name}"
    done
  done

  install -Dm755 packaging/linux/install-swhkd-helper.sh \
    "${pkgdir}/usr/libexec/linux-soundboard/install-swhkd-helper.sh"
  install -Dm644 packaging/linux/com.linuxsoundboard.install-swhkd.policy \
    "${pkgdir}/usr/share/polkit-1/actions/com.linuxsoundboard.install-swhkd.policy"
  install -Dm644 packaging/pipewire/99-linuxsoundboard.conf \
    "${pkgdir}/usr/share/pipewire/pipewire.conf.d/99-linuxsoundboard.conf"
  install -Dm644 packaging/linux/linux-soundboard-engine.service \
    "${pkgdir}/usr/lib/systemd/user/linux-soundboard-engine.service"
}
