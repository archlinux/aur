# Maintainer: Albert Alvarez Estelles <114157589+kukapu@users.noreply.github.com>

pkgname=wispr-flow-hyprland
pkgver=1.6.447
pkgrel=1
pkgdesc='Unofficial Wispr Flow desktop client adapted for Arch Linux and Hyprland'
arch=('x86_64')
url='https://github.com/kukapu/whsprflow-arch'
license=('0BSD AND BSD-3-Clause AND LicenseRef-Proprietary AND MIT AND Unlicense')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'bash'
  'cairo'
  'coreutils'
  'dbus'
  'expat'
  'gawk'
  'glib2'
  'glibc'
  'grep'
  'gtk3'
  'hicolor-icon-theme'
  'hyprland'
  'jq'
  'less'
  'libcups'
  'libgcc'
  'libpulse'
  'libsecret'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nodejs'
  'nspr'
  'nss'
  'pango'
  'systemd'
  'systemd-libs'
  'util-linux'
  'wl-clipboard'
  'xdg-utils'
  'xorg-xwayland'
)
makedepends=('asar' 'perl' 'python' 'unzip')
optdepends=('uwsm: managed Hyprland autostart with wispr-flow --autostart')
provides=("wispr-flow=${pkgver}")
conflicts=('wispr-flow')
options=('!strip' '!debug')
install=wispr-flow-hyprland.install

_support_commit='091bcb9dcac2221be3d007d56eb98704e2407d61'
_port_commit='6fb43cd809f8319a9e05da4b4e7a2d3264c126ab'
_electron_version='42.3.0'
_nupkg="WisprFlow-${pkgver}-full.nupkg"
_electron_zip="electron-v${_electron_version}-linux-x64.zip"
_sqlite="node_sqlite3-${CARCH}.node"

source=(
  "${pkgname}-support-${_support_commit}.tar.gz::https://codeload.github.com/kukapu/whsprflow-arch/tar.gz/${_support_commit}"
  "${pkgname}-port-${_port_commit}.tar.gz::https://codeload.github.com/wispr-flow-linux/wispr-flow-linux/tar.gz/${_port_commit}"
  "${_nupkg}::https://dl.wisprflow.com/wispr-flow/win32/x64/${_nupkg}"
  "${_electron_zip}::https://github.com/electron/electron/releases/download/v${_electron_version}/${_electron_zip}"
  "${_sqlite}::https://github.com/wispr-flow-linux/native-modules/releases/download/native-v1/${_sqlite}"
  'wispr-flow.desktop'
  '70-wispr-flow-input.rules'
)
noextract=("${_nupkg}" "${_electron_zip}")
sha256sums=(
  'a26c0b35682176888dbd9229b997e7aa69f05c7301d167612bd4a1d777714884'
  '365c68a8b3915a643a51634c298ac178cd0e441bd112707878f318cdef8dcac2'
  'c5a6175c74028c30b11c9a96a295df1b47780929ceaf3753a96ffa855b591f03'
  '487a667ca6a734b958c16cff1df74d9d44d2c18a6cccdb4dd51f6301a356c420'
  'c9bd0419f77efb3b5d3a691fda04e265f740ad8dc195f0b56003cdeac92e9a34'
  '3b65d10698a9c944c5494cfd9a5fa3f04dd7b5a02f8fce0ace9333b6f1646ba5'
  '3d7d9cab9b2af22cfd60b0dd965ff1b0f6e315e03c203add9f9646ae320bb97d'
)

build() {
  local support_dir="$srcdir/whsprflow-arch-${_support_commit}"
  local port_dir="$srcdir/wispr-flow-linux-${_port_commit}"

  rm -rf -- "$srcdir/runtime"
  "$support_dir/scripts/assemble-app.sh" \
    --version "$pkgver" \
    --nupkg "$srcdir/${_nupkg}" \
    --electron-zip "$srcdir/${_electron_zip}" \
    --sqlite "$srcdir/${_sqlite}" \
    --helper "$support_dir/assets/wispr-flow-linux-helper-${CARCH}" \
    --port-dir "$port_dir" \
    --output-dir "$srcdir/runtime" \
    --asar-bin /usr/bin/asar
}

check() {
  local support_dir="$srcdir/whsprflow-arch-${_support_commit}"
  local app_asar="$srcdir/runtime/resources/app.asar"
  local sqlite="$srcdir/runtime/resources/app.asar.unpacked/.webpack/main/native_modules/build/Release/node_sqlite3.node"
  local helper="$srcdir/runtime/resources/Release/wispr-flow-linux-helper"
  local check_app="$srcdir/check-app"
  local asar_files="$srcdir/asar-files.txt"
  local smoke_root="$srcdir/wrapper-smoke"
  local smoke_output

  [[ $(< "$srcdir/runtime/app-version") == "$pkgver" ]]
  printf '%s  %s\n' \
    '5f069506ccf51964f05ba6b06b7a1bfbb42cd2a5d64437c965abba628c4b45b0' \
    "$helper" | sha256sum -c -
  printf '%s  %s\n' \
    'c9bd0419f77efb3b5d3a691fda04e265f740ad8dc195f0b56003cdeac92e9a34' \
    "$sqlite" | sha256sum -c -

  /usr/bin/asar list "$app_asar" > "$asar_files"
  ! grep -qE 'crypt32-|[.]orig$' "$asar_files"
  rm -rf -- "$check_app"
  /usr/bin/asar extract "$app_asar" "$check_app"
  [[ $(node -e 'process.stdout.write(require(process.argv[1]).version)' \
    "$check_app/package.json") == "$pkgver" ]]
  local main_bundle="$check_app/.webpack/main/index.js"
  local marker
  for marker in \
    WISPR_LINUX_HIDE_STATUS_WINDOW_SHOW \
    WISPR_LINUX_HIDE_STATUS_WINDOW_DICTATION \
    WISPR_LINUX_LOCAL_START_SOUND \
    WISPR_LINUX_LOCAL_STOP_SOUND \
    WISPR_LINUX_COMPACT_STATUS_WINDOW \
    WISPR_LINUX_TRANSIENT_STATUS_HIDE
  do
    grep -qF "$marker" "$main_bundle"
  done

  rm -rf -- "$smoke_root"
  mkdir -p "$smoke_root/usr/lib" "$srcdir/check-home" "$srcdir/check-config"
  ln -s "$srcdir/runtime" "$smoke_root/usr/lib/wispr-flow"
  smoke_output="$(
    HOME="$srcdir/check-home" \
    XDG_CONFIG_HOME="$srcdir/check-config" \
    WISPR_FLOW_INSTALL_ROOT="$smoke_root" \
      "$support_dir/bin/wispr-flow" --status
  )"
  grep -qF 'Electron principal: 0' <<< "$smoke_output"
  grep -qF 'Helper: 0' <<< "$smoke_output"
}

package() {
  local support_dir="$srcdir/whsprflow-arch-${_support_commit}"
  local port_dir="$srcdir/wispr-flow-linux-${_port_commit}"
  local app_dir="$pkgdir/opt/wispr-flow-hyprland/usr/lib/wispr-flow"
  local license_dir="$pkgdir/usr/share/licenses/$pkgname"

  install -d "$pkgdir/opt/wispr-flow-hyprland/usr/lib"
  cp -a "$srcdir/runtime" "$app_dir"
  chmod 4755 "$app_dir/chrome-sandbox"

  install -Dm755 "$support_dir/bin/wispr-flow" \
    "$support_dir/bin/wispr-flow-configure" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/wispr-flow.desktop" \
    "$pkgdir/usr/share/applications/wispr-flow.desktop"
  install -Dm644 "$srcdir/70-wispr-flow-input.rules" \
    "$pkgdir/usr/lib/udev/rules.d/70-wispr-flow-input.rules"
  install -Dm644 "$app_dir/resources/assets/logos/flow-symbol.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/wispr-flow.svg"

  install -Dm644 "$support_dir/LICENSE" "$license_dir/SUPPORT-0BSD"
  install -Dm644 "$support_dir/assets/UNLICENSE" "$license_dir/HELPER-UNLICENSE"
  install -Dm644 "$port_dir/UNLICENSE" "$license_dir/PORT-UNLICENSE"
  install -Dm644 "$app_dir/LICENSE" "$license_dir/ELECTRON-MIT"
  install -Dm644 "$app_dir/LICENSES.chromium.html" \
    "$license_dir/ELECTRON-THIRD-PARTY.html"
  cat > "$license_dir/WISPR-FLOW-PROPRIETARY-NOTICE" <<'EOF'
The Wispr Flow client is proprietary software and remains subject to Wispr's
terms and policies. This community package and its support code grant no
license to the client. See https://wisprflow.ai/terms-of-service/ before use.
EOF
}
