# Maintainer: doudou <951028382@qq.com>

pkgname=easycliproxyapi-git
pkgver=0.3.2.r531.6c64fc0
pkgrel=1
pkgdesc='Cross-platform GUI desktop management client for CLIProxyAPI with Linux system tray patch'
arch=('x86_64' 'aarch64')
url='https://github.com/router-for-me/EasyCLIProxyAPI'
license=('MIT')
depends=(
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'bun'
  'cargo'
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
  '95d5332bdfa5b2662e1bfef7b3febd8a1c8df9f1c830883e3c0d3076019ebd07e1b36beaae0f6f617db654de7eab675511559a5b7ba18e386a866566b56efb71'
  'fe6d941b1de9807605cf15086b7f38355a4c2b8fc4662668f958989b536b2957baccab71aad45a5b9713a91bf94f421066191f7ad1d0d177b9a962c8b38893e6'
)

pkgver() {
  cd "$srcdir/EasyCLIProxyAPI"
  local version
  version=$(git describe --tags --abbrev=0 2>/dev/null || true)
  version="${version#v}"
  [ -z "$version" ] && version="0.3.2"
  printf '%s.r%s.%s' \
    "$version" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/EasyCLIProxyAPI"
  git reset --hard HEAD
  git apply --check "$srcdir/0001-enable-linux-tray.patch"
  git apply "$srcdir/0001-enable-linux-tray.patch"
  bun install --frozen-lockfile

  local _core_ver
  _core_ver=$(<core-version.txt)
  _core_ver="${_core_ver#v}"
  local _arch
  case "$CARCH" in
    x86_64) _arch="amd64" ;;
    aarch64) _arch="aarch64" ;;
  esac
  local _core_archive="CLIProxyAPI_${_core_ver}_linux_${_arch}.tar.gz"
  mkdir -p cpa-core
  if [[ ! -f "cpa-core/${_core_archive}" ]]; then
    curl -sSL -o "cpa-core/${_core_archive}" \
      "https://github.com/router-for-me/CLIProxyAPI/releases/download/v${_core_ver}/${_core_archive}"
  fi
}

build() {
  cd "$srcdir/EasyCLIProxyAPI"
  bun tauri build --no-bundle
}

package() {
  cd "$srcdir/EasyCLIProxyAPI"

  local _arch
  case "$CARCH" in
    x86_64) _arch="amd64" ;;
    aarch64) _arch="aarch64" ;;
  esac
  local _core_ver
  _core_ver=$(<core-version.txt)
  _core_ver="${_core_ver#v}"

  # Install main binary
  install -dm755 "${pkgdir}/usr/lib/easycliproxyapi"
  install -Dm755 "src-tauri/target/release/cpa-gui" "${pkgdir}/usr/lib/easycliproxyapi/EasyCLIProxyAPI"
  install -Dm644 "core-version.txt" "${pkgdir}/usr/lib/easycliproxyapi/core-version.txt"

  # Generate portable-app.json
  cat > "${pkgdir}/usr/lib/easycliproxyapi/portable-app.json" <<EOF
{
  "schemaVersion": 1,
  "application": "EasyCLIProxyAPI",
  "version": "${pkgver%%.r*}",
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
