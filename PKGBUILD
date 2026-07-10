pkgname=alt-sendme
pkgver=0.5.0
pkgrel=1
pkgdesc="Peer-to-peer file and folder transfer app without cloud storage"
arch=('x86_64' 'aarch64')
url="https://github.com/tonyantony300/alt-sendme"
license=('AGPL3')
options=('!lto')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
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
conflicts=(
  'alt-sendme-bin'
  'alt-sendme-git'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '648ba56d58ec19e0cf70c3b18baca78d6bb311c1e91bfeda9a404efd4cb6606b'
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

  env \
    CC=clang \
    CXX=clang++ \
    CC_wasm32_unknown_unknown=clang \
    CXX_wasm32_unknown_unknown=clang++ \
    CFLAGS= \
    CXXFLAGS= \
    CPPFLAGS= \
    LDFLAGS= \
    CFLAGS_wasm32_unknown_unknown="-O2" \
    CXXFLAGS_wasm32_unknown_unknown="-O2" \
    pnpm run build:wasm

  pnpm run build

  local _tauri_config='{"build":{"beforeBuildCommand":"true"}}'
  pnpm run tauri build --no-bundle --config "${_tauri_config}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local _built_bin="src-tauri/target/release/${pkgname}"
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
Name=AltSendme
Comment=Send files and folders directly without cloud storage
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
Categories=Network;FileTransfer;
Keywords=file;folder;transfer;send;receive;p2p;peer-to-peer;
StartupNotify=true
StartupWMClass=alt-sendme
EOF
}
