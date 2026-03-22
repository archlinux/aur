# Maintainer: germanua <tony.avramnco@icloud.com>

pkgname=linux-soundboard-git
_pkgname=linux-soundboard
pkgver=1.0.0.r4.gf1d87b2
pkgrel=1
pkgdesc="Native Linux soundboard with GTK4/libadwaita and virtual microphone support"
arch=('x86_64')
url="https://github.com/germanua/Linux-SoundBoard"
license=('custom:PolyForm-Noncommercial-1.0.0')
depends=(
  'gtk4'
  'libadwaita'
  'libpulse'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'git'
  'imagemagick'
)
optdepends=(
  'pipewire-pulse: PipeWire-backed PulseAudio server for virtual microphone routing'
  'pulseaudio: PulseAudio server for virtual microphone routing'
  'wireplumber: recommended PipeWire session manager'
)
provides=('linux-soundboard')
conflicts=('linux-soundboard')
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

  bash packaging/linux/generate-icons.sh icon.png
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

  local icon_root="src/resources/icons"
  local icon_name="com.linuxsoundboard.app.png"
  local size
  for size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512; do
    install -Dm644 "${icon_root}/${size}/apps/${icon_name}" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${icon_name}"
  done

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/com.linuxsoundboard.app.desktop" <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Linux Soundboard
Comment=A Linux soundboard with PipeWire virtual mic support
Exec=linux-soundboard
Icon=com.linuxsoundboard.app
Terminal=false
Categories=AudioVideo;Audio;
Keywords=soundboard;audio;pipewire;microphone;
StartupNotify=true
StartupWMClass=linux-soundboard
EOF
}
