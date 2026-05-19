pkgname=alt-sendme
pkgver=0.3.5
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
  'libappindicator-gtk3'
  'pango'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'librsvg'
  'nodejs>=20'
  'npm'
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
  '2cf8cc3546eeb2e74ae1859a5fa897a240c6074c25920cd0bfd9690dbd70eb92'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_HTTP_CAINFO=/etc/ssl/cert.pem
  export npm_config_cache="${srcdir}/npm-cache"

  cargo fetch --manifest-path src-tauri/Cargo.toml
  npm ci --no-audit --no-fund
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_HTTP_CAINFO=/etc/ssl/cert.pem
  export npm_config_cache="${srcdir}/npm-cache"
  export CI=true

  npm run tauri -- build --no-bundle
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
