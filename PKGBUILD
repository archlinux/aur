# Maintainer: doudou <951028382@qq.com>

pkgname=easycliproxyapi-git
pkgver=0.3.4.r539.88f2d30
pkgrel=3
pkgdesc='Cross-platform GUI desktop management client for CLIProxyAPI with Linux system tray patch'
arch=('x86_64' 'aarch64')
url='https://github.com/router-for-me/EasyCLIProxyAPI'
license=('MIT')
# GCC LTO objects from bundled SQLite cannot be linked by rust-lld.
options=('!lto')
# Temporary workaround for the reproducible rustc 1.98.1 stack overflow.
# Use verified standalone components, never the user's system Rust or rustup.
_rust_version=1.97.1
_rust_dist=https://static.rust-lang.org/dist/2026-07-16
depends=(
  'bash'
  'cairo'
  'coreutils'
  'dbus'
  'diffutils'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libgcc'
  'libsoup3'
  'util-linux'
  'webkit2gtk-4.1'
)
makedepends=(
  'bun'
  'curl'
  'git'
)
provides=('easycliproxyapi')
conflicts=('easycliproxyapi' 'easycliproxyapi-bin')

source=(
  'EasyCLIProxyAPI::git+https://github.com/router-for-me/EasyCLIProxyAPI.git#branch=main'
  '0001-enable-linux-tray.patch'
  'easycliproxyapi.sh'
  'easycliproxyapi.desktop'
)
source_x86_64=(
  "${_rust_dist}/rustc-${_rust_version}-x86_64-unknown-linux-gnu.tar.xz"
  "${_rust_dist}/cargo-${_rust_version}-x86_64-unknown-linux-gnu.tar.xz"
  "${_rust_dist}/rust-std-${_rust_version}-x86_64-unknown-linux-gnu.tar.xz"
)
source_aarch64=(
  "${_rust_dist}/rustc-${_rust_version}-aarch64-unknown-linux-gnu.tar.xz"
  "${_rust_dist}/cargo-${_rust_version}-aarch64-unknown-linux-gnu.tar.xz"
  "${_rust_dist}/rust-std-${_rust_version}-aarch64-unknown-linux-gnu.tar.xz"
)
sha256sums=(
  'SKIP'
  '727f3e7cfb25cadbd29e096faaefc534845fb0efa9dd6f0c1c6ced7b54a528e1'
  '3d422eb9876fd5c2a365e322ef6ed3860d1ba9832ea444d5e390334b624cf83f'
  '6b46832343f2db8f6c1513fead0ff47a7a3ec539efcecdbc478cdd218be1222e'
)
# SHA256 values from Rust's official channel-rust-1.97.1.toml manifest.
sha256sums_x86_64=(
  '9819d0a32d56bd339585319c80260e332779f5541fd66838ab7e016d6c814819'
  'e1be5f5ff7f7f80ca506fb65770b759edbdc6d303781ed71c5de8ec8a8394779'
  '1c1e704ae80126b7de34f72ea2825f7fd01736dec20732faed47374b95282fba'
)
sha256sums_aarch64=(
  'b344b81f0cd4c2246c7da8b197fe7a339d7dd02bb15cb69b2524115d9c75224c'
  '8f70bcaccea5ba4db187c3fd4d64e24592b4e16af513497201f5909d61691dbe'
  '46aed8e63186350004d8ec6afca798811e6530b514352e5a8a26f3dc4939b3be'
)

_app_version() {
  local version
  if version=$(git describe --tags --match 'v[0-9]*' --abbrev=0 2>/dev/null); then
    printf '%s\n' "${version#v}"
  else
    bun scripts/version.mjs
  fi
}

_core_arch() {
  case "$CARCH" in
    x86_64) printf '%s\n' amd64 ;;
    aarch64) printf '%s\n' aarch64 ;;
    *) printf 'Unsupported architecture: %s\n' "$CARCH" >&2; return 1 ;;
  esac
}

_rust_target() {
  case "$CARCH" in
    x86_64|aarch64) printf '%s-unknown-linux-gnu\n' "$CARCH" ;;
    *) printf 'Unsupported architecture: %s\n' "$CARCH" >&2; return 1 ;;
  esac
}

_use_rust() {
  local prefix="$srcdir/.rust-toolchain"
  export PATH="$prefix/bin:$PATH"
  export RUSTC="$prefix/bin/rustc"
  export RUSTDOC="$prefix/bin/rustdoc"
  export CARGO="$prefix/bin/cargo"
  # Do not inherit user Cargo config, compiler wrappers or rustup overrides.
  export CARGO_HOME="$srcdir/.cargo-home"
  unset RUSTUP_TOOLCHAIN RUSTC_WRAPPER RUSTC_WORKSPACE_WRAPPER
  export CARGO_TARGET_DIR="$srcdir/EasyCLIProxyAPI/src-tauri/target"
  export CARGO_BUILD_TARGET="$(_rust_target)"
}

_install_rust() {
  local target component prefix="$srcdir/.rust-toolchain"
  target=$(_rust_target)
  for component in rustc cargo rust-std; do
    bash "$srcdir/${component}-${_rust_version}-${target}/install.sh" \
      --prefix="$prefix" --sysconfdir="$prefix/etc" --disable-ldconfig || return
  done
  _use_rust
  "$RUSTC" -Vv
  "$CARGO" -V
}

# The -git source determines the core version. Always verify even cached archives
# against that release's HTTPS checksums; never install a partial download.
_download_core() (
  set -e
  local version core_arch archive base_url checksums_tmp='' archive_tmp='' checksum
  version=$(<core-version.txt)
  version="${version#v}"
  if [[ ! "$version" =~ ^[0-9][A-Za-z0-9.+-]*$ ]]; then
    printf 'Invalid core version: %s\n' "$version" >&2
    return 1
  fi
  core_arch=$(_core_arch)
  archive="CLIProxyAPI_${version}_linux_${core_arch}.tar.gz"
  base_url="https://github.com/router-for-me/CLIProxyAPI/releases/download/v${version}"
  mkdir -p cpa-core
  trap 'rm -f -- "$checksums_tmp" "$archive_tmp"' EXIT
  checksums_tmp=$(mktemp cpa-core/.checksums.XXXXXX)
  local -a curl_options=(--fail --location --silent --show-error --retry 3
    --connect-timeout 20 --max-time 600)
  curl "${curl_options[@]}" --output "$checksums_tmp" "$base_url/checksums.txt"
  checksum=$(awk -v file="$archive" '$2 == file || $2 == "*" file { print $1 }' "$checksums_tmp")
  if [[ ! "$checksum" =~ ^[[:xdigit:]]{64}$ ]]; then
    printf 'Missing or invalid SHA256 for %s\n' "$archive" >&2
    return 1
  fi
  if [[ -f "cpa-core/$archive" ]] &&
      printf '%s  %s\n' "$checksum" "cpa-core/$archive" | sha256sum --check --status; then
    return 0
  fi
  archive_tmp=$(mktemp "cpa-core/.${archive}.XXXXXX")
  curl "${curl_options[@]}" --output "$archive_tmp" "$base_url/$archive"
  printf '%s  %s\n' "$checksum" "$archive_tmp" | sha256sum --check --status || {
    printf 'SHA256 verification failed for %s\n' "$archive" >&2
    return 1
  }
  mv -f -- "$archive_tmp" "cpa-core/$archive"
)

pkgver() {
  cd "$srcdir/EasyCLIProxyAPI"
  local version
  version=$(_app_version)
  printf '%s.r%s.%s' \
    "${version//-/.}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/EasyCLIProxyAPI"
  git reset --hard HEAD
  git apply --check "$srcdir/0001-enable-linux-tray.patch"
  git apply "$srcdir/0001-enable-linux-tray.patch"
  bun install --frozen-lockfile

  _install_rust
  local version target
  version=$(_app_version)
  target=$(_rust_target)
  "$CARGO" fetch --manifest-path src-tauri/Cargo.toml --locked --target "$target"
  # Match upstream release builds, without resolving new dependency versions.
  CARGO_NET_OFFLINE=true bun scripts/set-version.mjs "$version"
  "$CARGO" metadata --manifest-path src-tauri/Cargo.toml --no-deps \
    --format-version 1 --locked --offline > /dev/null
  _download_core
}

build() {
  cd "$srcdir/EasyCLIProxyAPI"
  _use_rust
  export CARGO_NET_OFFLINE=true
  local target
  target=$(_rust_target)
  bun tauri build --runner "$CARGO" --no-bundle --target "$target" -- --frozen
}

package() {
  cd "$srcdir/EasyCLIProxyAPI"

  local _arch _target _app_ver
  _arch=$(_core_arch)
  _target=$(_rust_target)
  _app_ver=$(bun scripts/version.mjs)
  local _core_ver
  _core_ver=$(<core-version.txt)
  _core_ver="${_core_ver#v}"

  # Install main binary
  install -dm755 "${pkgdir}/usr/lib/easycliproxyapi"
  install -Dm755 "src-tauri/target/${_target}/release/cpa-gui" "${pkgdir}/usr/lib/easycliproxyapi/EasyCLIProxyAPI"
  install -Dm644 "core-version.txt" "${pkgdir}/usr/lib/easycliproxyapi/core-version.txt"

  # Generate portable-app.json
  cat > "${pkgdir}/usr/lib/easycliproxyapi/portable-app.json" <<EOF
{
  "schemaVersion": 1,
  "application": "EasyCLIProxyAPI",
  "version": "${_app_ver}",
  "platform": "linux",
  "arch": "${_arch}",
  "autoUpdate": false
}
EOF
  chmod 644 "${pkgdir}/usr/lib/easycliproxyapi/portable-app.json"

  # Install bundled cpa-core
  install -dm755 "${pkgdir}/usr/lib/easycliproxyapi/cpa-core"
  local _core_file="CLIProxyAPI_${_core_ver}_linux_${_arch}.tar.gz"
  install -Dm644 "cpa-core/${_core_file}" "${pkgdir}/usr/lib/easycliproxyapi/cpa-core/${_core_file}"

  # Install launcher script and symlinks
  install -Dm755 "${srcdir}/easycliproxyapi.sh" "${pkgdir}/usr/bin/easycliproxyapi"
  ln -sf easycliproxyapi "${pkgdir}/usr/bin/EasyCLIProxyAPI"

  # Install desktop entry
  install -Dm644 "${srcdir}/easycliproxyapi.desktop" "${pkgdir}/usr/share/applications/easycliproxyapi.desktop"

  # Install icon
  install -Dm644 "src-tauri/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/easycliproxyapi.png"
  install -Dm644 "src-tauri/icons/icon.png" "${pkgdir}/usr/share/pixmaps/easycliproxyapi.png"

  # Install license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
