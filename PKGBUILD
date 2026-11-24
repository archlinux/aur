# Maintainer: lzsnyy <710080675@qq.com>
#
# Upstream publishes only macOS (.dmg) and Windows (NSIS) installers, so this
# package compiles the Tauri 2 desktop app from the tagged source tree.
#
# The result is self-contained apart from two runtime pieces: the system
# WebKitGTK webview (Tauri's Linux backend) and Node.js 22+ (the local
# compatibility service in crates/claude-local is JavaScript). The vite
# frontend is baked into the binary by tauri's generate_context!, and the Node
# scripts, i18n catalogs and mock templates are embedded with include_bytes!.
#
# Upstream's Linux support is incomplete: crates/claude-local/src/desktop.rs
# returns a placeholder "Claude.exe" path on any platform that is not macOS or
# Windows, so the window opens but the "enhance Claude Desktop" flow is macOS
# and Windows only. Packaging it lets the UI, settings and local service be
# tested on Linux until upstream adds desktop discovery.

pkgname=claudemom
pkgver=0.1.14
pkgrel=1
pkgdesc="Turn an Anthropic-compatible API key into the Claude Desktop login mode, with localization and dictation"
arch=('x86_64')
url="https://github.com/BigPizzaV3/ClaudeMom"
license=('AGPL-3.0-only')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'libayatana-appindicator'
  'librsvg'
  'nodejs'
  'gcc-libs'
  'glibc'
)
makedepends=(
  'rust'
  'cargo'
  'nodejs'
  'npm'
  'pkgconf'
  'zstd'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/BigPizzaV3/ClaudeMom/archive/refs/tags/v${pkgver}.tar.gz"
  "sherpa-onnx-v1.13.8-linux-x64-static-lib.tar.bz2::https://github.com/k2-fsa/sherpa-onnx/releases/download/v1.13.8/sherpa-onnx-v1.13.8-linux-x64-static-lib.tar.bz2"
)
sha256sums=('3df55e3af7767522d8694ac9c70fc5da1ce20529d71a3a7dcb7df29308cf10cf'
            'e1fdc5b67530e15741ef897fa5ffff297056f3bf0c6d829a27af9225a4c4b5a6')

prepare() {
  cd "${srcdir}/ClaudeMom-${pkgver}"
  cargo fetch --locked
}

check() {
  cd "${srcdir}/ClaudeMom-${pkgver}"
  # sherpa-onnx-sys links a prebuilt static library archive whose version must
  # match the crate pinned in Cargo.lock. Bumping the dependency without
  # updating source= would otherwise fail deep inside a build script.
  local _lockver _srcver
  _lockver="$(grep -A1 '^name = "sherpa-onnx-sys"$' Cargo.lock \
    | sed -n 's/^version = "\(.*\)"$/\1/p')"
  _srcver="$(basename "${srcdir}"/sherpa-onnx-v*-linux-x64-static-lib.tar.bz2 \
    | sed 's/^sherpa-onnx-v\(.*\)-linux-x64-static-lib\.tar\.bz2$/\1/')"
  if [ -z "${_lockver}" ] || [ "${_lockver}" != "${_srcver}" ]; then
    echo "error: Cargo.lock pins sherpa-onnx-sys ${_lockver:-<none>} but the bundled libraries are ${_srcver:-<none>}" >&2
    return 1
  fi
}

build() {
  cd "${srcdir}/ClaudeMom-${pkgver}"

  # The committed lockfile resolves every tarball through registry.npmmirror.com.
  # npm 12 treats those as remote packages and refuses them unless asked;
  # earlier npm releases have no such switch and fetch them anyway.
  local _npm=(ci --no-audit --no-fund)
  if [ "$(npm --version | cut -d. -f1)" -ge 12 ]; then
    _npm+=(--allow-remote=all)
  fi
  ( cd apps/claude-mom && npm "${_npm[@]}" )
  ( cd apps/claude-mom && npm run vite:build )

  # sherpa-onnx-sys normally downloads its static libraries from GitHub during
  # the build. Point it at the archive pinned in source= instead so the build
  # never reaches the network for it.
  export SHERPA_ONNX_ARCHIVE_DIR="${srcdir}"

  # When cargo links the build-script binary of sherpa-onnx-sys it forwards the
  # -L paths of ring and zstd-sys but not their -l directives, so a clean build
  # dies on ZSTD_* and ring_core_*. The same happens with the bundled sqlite3
  # archive on the final binary link. Supply the missing pieces ourselves:
  # -lzstd resolves to zstd-sys' static archive where cargo added its -L path
  # and to the system library elsewhere. ring and sqlite3 are prebuilt here
  # (cargo rejects -p for build-only packages such as zstd-sys) and passed by
  # absolute path: a path, unlike -l, is placed after the rlibs on the link
  # line, which matters because ld scans static archives only once, left to
  # right.
  cargo build --release --locked -p ring -p libsqlite3-sys
  local _native="${srcdir}/native-libs"
  local _ringver _ringlib
  install -d "${_native}"
  find target/release/build -path '*/out/libring_core_*[0-9]_.a' \
    -exec install -m644 {} "${_native}/" \;
  find target/release/build -path '*/out/libsqlite3.a' \
    -exec install -m644 {} "${_native}/" \;
  _ringver="$(grep -A1 '^name = "ring"$' Cargo.lock \
    | sed -n 's/^version = "\(.*\)"$/\1/p' | head -1)"
  _ringlib="ring_core_$(printf '%s' "${_ringver}" | tr '.' '_')_"

  # Arch's rust defaults to rust-lld. Keep bfd as well, it handles the
  # prebuilt sherpa-onnx archive more reliably than lld.
  #
  # A plain release build also bakes the builder's home directory into panic
  # messages and debug info. Remap the source roots to neutral paths and drop
  # symbols; the app has no use for either.
  export RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-fuse-ld=bfd -C link-arg=-lzstd -C link-arg=${_native}/lib${_ringlib}.a -C link-arg=${_native}/libsqlite3.a --remap-path-prefix=${srcdir}=/usr/src/${pkgname} --remap-path-prefix=${HOME:-/root}=/build"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  cargo build --release --locked --bin claude-mom
}

package() {
  cd "${srcdir}/ClaudeMom-${pkgver}"
  install -Dm755 target/release/claude-mom "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'LAUNCHER'
#!/bin/sh
# The binary embeds its frontend and runtime assets; Node.js is found through
# PATH (or CLAUDE_LOCAL_NODE) by the local compatibility service.
exec /usr/lib/claudemom/claudemom "$@"
LAUNCHER

  # Upstream ships a 512px icon plus the 32/128/256px Tauri variants.
  install -Dm644 apps/claude-mom/src-tauri/icons/32x32.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -Dm644 apps/claude-mom/src-tauri/icons/128x128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 apps/claude-mom/src-tauri/icons/128x128@2x.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 apps/claude-mom/src-tauri/icons/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=ClaudeMom
Comment=Turn an Anthropic-compatible API key into the Claude Desktop login mode
Exec=claudemom %U
Icon=claudemom
Terminal=false
Categories=Development;Network;
StartupWMClass=com.bigpizzav3.claudemom
DESKTOP
}
