pkgname=openwork-bin
pkgver=0.11.212
pkgdesc='Unofficial OpenWork binary package with Arch-specific launcher fixes'
arch=('x86_64')
url='https://github.com/different-ai/openwork'
license=('MIT')
pkgrel=2
options=('!strip')
depends=(
  'dbus'
  'glib2'
  'gtk3'
  'libayatana-appindicator'
  'librsvg'
  'libsoup3'
  'openssl'
  'webkit2gtk-4.1'
)
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/openwork-desktop-linux-amd64.deb")
sha256sums=('6d7fb51bf979634e7fd6eb6c90d30fe15e48ee05d4f778ea3e03b269b112a428')
noextract=("${pkgname}-${pkgver}.deb")

package() {
  local sidecars=(
    'OpenWork-Dev'
    'chrome-devtools-mcp'
    'opencode'
    'opencode-router'
    'openwork-orchestrator'
    'openwork-server'
    'versions.json'
  )
  local exposed_bins=(
    'chrome-devtools-mcp'
    'opencode-router'
    'openwork-orchestrator'
    'openwork-server'
  )

  bsdtar -O -xf "${srcdir}/${pkgname}-${pkgver}.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -

  install -dm755 "${pkgdir}/opt/openwork-bin"

  local file
  for file in "${sidecars[@]}"; do
    mv "${pkgdir}/usr/bin/${file}" "${pkgdir}/opt/openwork-bin/"
  done

  cat > "${pkgdir}/usr/bin/OpenWork-Dev" <<'EOF'
#!/usr/bin/env bash
export PATH="/opt/openwork-bin:${PATH}"
export OPENCODE_BIN_PATH="/opt/openwork-bin/opencode"
export OPENCODE_INSTALL_DIR="/opt/openwork-bin"
cd /opt/openwork-bin
exec ./OpenWork-Dev "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/OpenWork-Dev"

  local bin
  for bin in "${exposed_bins[@]}"; do
    ln -s "../../opt/openwork-bin/${bin}" "${pkgdir}/usr/bin/${bin}"
  done
}
