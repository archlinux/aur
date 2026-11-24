# Maintainer: Daniel Kurdoghlian <daniel@pushingpixels.at>
#
# Built from source. CUDA comes from the system (packages cuda and nvidia-utils) and is never part of this package.
# whisper.cpp is compiled with the GPU architectures it picks by default: makepkg sets SOURCE_DATE_EPOCH, which turns
# GGML_NATIVE off, so the build needs no GPU and runs on Turing (RTX 20xx) and newer. Every CMAKE_* and GGML_*
# variable in the environment reaches whisper.cpp, for example CMAKE_CUDA_ARCHITECTURES=86 to build only for an
# RTX 30xx, which is faster.

pkgname=dictate
pkgver=0.1.0
pkgrel=1
pkgdesc='Local live dictation for niri on Wayland (whisper.cpp, CUDA)'
arch=('x86_64')
url='https://github.com/derblub/dictate'
license=('GPL-3.0-or-later')
# libglvnd, libxkbcommon and wayland: dictate-settings loads libEGL, libxkbcommon and libwayland-client at runtime
# (dlopen, so namcap does not see them); niri: dictate-ui talks to it over its socket
depends=(
  'cairo'
  'cuda'
  'glib2'
  'glibc'
  'graphene'
  'gtk4'
  'gtk4-layer-shell'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libpulse'
  'libstdc++'
  'libxkbcommon'
  'niri'
  'nvidia-utils'
  'pango'
  'wayland'
)
makedepends=(
  'cargo'
  'clang'
  'cmake'
)
optdepends=(
  'noctalia: colors from the desktop palette and clipboard history in the command palette'
  'rofi-emoji: emoji picker in the command palette'
  'playerctl: media controls in the command palette'
  'docker: container probes in the Linux diagnosis'
  'tailscale: Tailscale probe in the Linux diagnosis'
  'lm_sensors: temperature probe in the Linux diagnosis'
)
install=dictate.install
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f90ea1d31479265289f62a22323132aa649bbe3a3d97e4fd6d875bc3a5f4994d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_build_env() {
  # makepkg runs build() and check() in the same shell: set everything once, or check() would see changed flags and
  # build whisper.cpp again
  [[ -n ${_dictate_build_env:-} ]] && return 0
  _dictate_build_env=1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # /etc/profile.d/cuda.sh is not read when makepkg installs cuda in the same run
  export CUDA_PATH="${CUDA_PATH:-/opt/cuda}"
  export PATH="$CUDA_PATH/bin:$PATH"
  # whisper-rs-sys copies whisper.cpp below target/ and compiles it there, so __FILE__ in the asserts of ggml would
  # carry the build directory into the binary. Map it like makepkg does for debug packages; CMAKE_CUDA_FLAGS replaces
  # the value set by whisper-rs-sys, so it repeats its -fPIC.
  local map="-ffile-prefix-map=$srcdir=/usr/src/debug/$pkgbase"
  export CFLAGS="$CFLAGS $map"
  export CXXFLAGS="$CXXFLAGS $map"
  export CMAKE_CUDA_FLAGS="-Xcompiler=-fPIC -Xcompiler=$map${CMAKE_CUDA_FLAGS:+ $CMAKE_CUDA_FLAGS}"
}

build() {
  cd "$pkgname-$pkgver"
  _build_env
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  _build_env
  # Mock tests only; no test outside --ignored touches the GPU, the audio server or the running session
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 -t "$pkgdir/usr/bin" target/release/dictate target/release/dictate-ui target/release/dictate-settings

  # The unit files in the repository start the binaries from ~/.cargo/bin (cargo install)
  local unit
  for unit in dictate.service dictate-ui.service; do
    sed 's|%h/\.cargo/bin/|/usr/bin/|' "systemd/$unit" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/$unit"
    if ! grep -q '^ExecStart=/usr/bin/' "$pkgdir/usr/lib/systemd/user/$unit"; then
      echo "ExecStart in $unit does not point to /usr/bin" >&2
      return 1
    fi
  done

  install -Dm644 packaging/dictate-settings.desktop "$pkgdir/usr/share/applications/dictate-settings.desktop"
  install -Dm644 assets/logo/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/dictate.svg"
  install -Dm644 assets/logo/icon-512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/dictate.png"

  # Shortcuts and window rules for niri (include this file from config.kdl) and the template for Noctalia
  install -Dm644 niri/dictate-binds.kdl "$pkgdir/usr/share/dictate/dictate-binds.kdl"
  install -Dm644 noctalia/dictate.json.tmpl "$pkgdir/usr/share/dictate/dictate.json.tmpl"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md

  # License, third-party notices and the additional permission for NVIDIA CUDA (the header of every source file)
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE THIRD-PARTY-LICENSES.txt
  sed -n '1,25s|^// \?||p' src/main.rs | install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  if ! grep -q '^Additional permission under GNU GPL version 3 section 7$' "$pkgdir/usr/share/licenses/$pkgname/NOTICE"; then
    echo "NOTICE lacks the additional permission for CUDA" >&2
    return 1
  fi
  cp -r --no-preserve=mode licenses "$pkgdir/usr/share/licenses/$pkgname/"
}
