pkgname=dashbeam
pkgver=0.7.0
pkgrel=1
pkgdesc="Peer-to-peer file and folder transfer app without cloud storage"
arch=('x86_64' 'aarch64')
url="https://github.com/tonyantony300/dashbeam"
license=('AGPL3')
options=('!lto')

depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libappindicator-gtk3'
  'pango'
  'webkit2gtk-4.1'
)

makedepends=(
  'cargo'
  'clang'
  'librsvg'
  'nodejs>=20'
  'pnpm'
  'rust-wasm'
  'wasm-bindgen'
)

optdepends=(
  'xdg-utils'
)

provides=(
  "alt-sendme=${pkgver}"
)

conflicts=(
  'alt-sendme'
  'alt-sendme-bin'
  'alt-sendme-git'
  'dashbeam-bin'
  'dashbeam-git'
)

replaces=(
  'alt-sendme'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
  '03facf6424e853de2a4bfe8d0c188e095e334d9dae7f18a9bca8af1de749c945'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_HTTP_CAINFO=/etc/ssl/cert.pem
  export npm_config_cache="${srcdir}/npm-cache"

  cargo fetch --manifest-path wasm-bridge/Cargo.toml --target wasm32-unknown-unknown
  cargo fetch --manifest-path src-tauri/Cargo.toml

  pnpm install --frozen-lockfile --store-dir "${srcdir}/pnpm-store"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_HTTP_CAINFO=/etc/ssl/cert.pem
  export npm_config_cache="${srcdir}/npm-cache"
  export CI=true
  export TAURI_LINUX_AYATANA_APPINDICATOR=1

  export CC=clang
  export CXX=clang++
  export CC_wasm32_unknown_unknown=clang
  export CXX_wasm32_unknown_unknown=clang++
  export CFLAGS=
  export CXXFLAGS=
  export CPPFLAGS=
  export LDFLAGS=
  export CFLAGS_wasm32_unknown_unknown="-O2"
  export CXXFLAGS_wasm32_unknown_unknown="-O2"

  pnpm run tauri build --no-bundle
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local _built_bin="src-tauri/target/release/DashBeam"
  if [[ ! -x "${_built_bin}" ]]; then
    echo "Could not find built binary at ${_built_bin}" >&2
    return 1
  fi
  install -Dm755 "${_built_bin}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 src-tauri/icons/32x32.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat >"${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Dashbeam
Comment=Send files and folders anywhere in the world without storing in cloud - any size, any format, no accounts, no restrictions (previously Altsendme)
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
Categories=Network;FileTransfer;
Keywords=file;folder;transfer;send;receive;p2p;peer-to-peer;
StartupNotify=true
StartupWMClass=dashbeam
EOF
}
