# Maintainer: doudou <951028382@qq.com>

pkgname=easycliproxyapi-git
pkgver=0.3.4.r539.88f2d30
pkgrel=2
pkgdesc='Cross-platform GUI desktop management client for CLIProxyAPI with Linux system tray patch'
arch=('x86_64' 'aarch64')
url='https://github.com/router-for-me/EasyCLIProxyAPI'
license=('MIT')
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
  'cargo'
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
b2sums=(
  'SKIP'
  '9bbfbf35ca84ec60d78696de9ab7e1fa4ff7de1a4f4e292da0a14c78cceb3ae93f8e9dab02f256b8e8420418e636a6658502181005ce6dc99319ca7a81516dbc'
  '2f8535f8a7cd3bfb5113a870e5dc87723bd14ec8e0a8792d1bf8cee0d8c9c02e9742ce4d2bc746b5ad07c7d968301cd6faace3ee316cd9054cd7bdd7a36d0133'
  'fe6d941b1de9807605cf15086b7f38355a4c2b8fc4662668f958989b536b2957baccab71aad45a5b9713a91bf94f421066191f7ad1d0d177b9a962c8b38893e6'
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

  export CARGO_TARGET_DIR="$srcdir/EasyCLIProxyAPI/src-tauri/target"
  local version target
  version=$(_app_version)
  target=$(_rust_target)
  export CARGO_BUILD_TARGET="$target"
  cargo fetch --manifest-path src-tauri/Cargo.toml --locked --target "$target"
  # Match upstream release builds, without resolving new dependency versions.
  CARGO_NET_OFFLINE=true bun scripts/set-version.mjs "$version"
  cargo metadata --manifest-path src-tauri/Cargo.toml --no-deps \
    --format-version 1 --locked --offline > /dev/null
  _download_core
}

build() {
  cd "$srcdir/EasyCLIProxyAPI"
  export CARGO_TARGET_DIR="$srcdir/EasyCLIProxyAPI/src-tauri/target"
  export CARGO_NET_OFFLINE=true
  local target
  target=$(_rust_target)
  export CARGO_BUILD_TARGET="$target"
  bun tauri build --no-bundle --target "$target" -- --frozen
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
