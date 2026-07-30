# Maintainer: Igor Aguiar Rodrigues <igor_aguiar@yahoo.com.br>
# Maintainer: Sheikh Limon <sheikhlimon404@gmail.com>

pkgname=goose-desktop-bin
pkgver=1.45.0
pkgrel=1
pkgdesc="Goose Desktop and CLI (prebuilt) - an open source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM"
arch=('x86_64')
url="https://github.com/aaif-goose/goose"
license=('Apache-2.0')
provides=('goose-desktop')
conflicts=('goose-desktop')
depends=(
  'glibc' 'gcc-libs'
  'gtk3' 'libnotify' 'nss' 'xdg-utils'
  'at-spi2-core' 'libdrm' 'mesa' 'libxcb'
  'alsa-lib' 'trash-cli'
)
optdepends=(
  'vulkan-icd-loader: hardware GPU acceleration'
  'libcups: printing support'
)
options=(!strip)
source=(
    "goose_${pkgver}_amd64-vulkan.deb::https://github.com/aaif-goose/goose/releases/download/v${pkgver}/goose_${pkgver}_amd64-vulkan.deb"
    "goose-cli-${pkgver}.tar.bz2::https://github.com/aaif-goose/goose/releases/download/v${pkgver}/goose-x86_64-unknown-linux-gnu.tar.bz2"
)
b2sums=('7acdfff11f7643e2b4eefaea33d147beeb18e95289ba37303efb3a80837dff07b773a8383b50dce99fb1340471ec86988b089a38074848745b85e63bc59d2cd9'
        '25ecc4355aa685e40de6eb14fe776cc1c0c7b0d48b5fcaae232ae17bb07b5cfae4974dd36512a6523a0f63309c8048a9c63399b8e5d8c3191cc2149db5c3171a')

build() { :; }

package() {
  # unpack the deb
  bsdtar -xf "${srcdir}/goose_${pkgver}_amd64-vulkan.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"

  rm -f "${pkgdir}/usr/bin/goose"

  # 2) Relocate the Electron bundle to a desktop-specific dir to avoid name ambiguity
  #    (optional but cleaner). Keep it under /opt/goose-desktop.
  install -d "${pkgdir}/opt/goose-desktop"
  mv "${pkgdir}/usr/lib/goose/"* "${pkgdir}/opt/goose-desktop/"
  rmdir "${pkgdir}/usr/lib/goose" || true

  # Optional: setuid sandbox (many Electron -bin packages do this; harmless if userns is enabled)
  if [[ -f "${pkgdir}/opt/goose-desktop/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/goose-desktop/chrome-sandbox" || true
  fi

  # 3) Provide a desktop-specific launcher on PATH
  install -d "${pkgdir}/usr/bin"
  # The real Electron binary in your tree is capital 'Goose'
  cat > "${pkgdir}/usr/bin/goose-desktop" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
APPDIR="/opt/goose-desktop"
[[ -x "$APPDIR/Goose" ]] || APPDIR="/usr/lib/goose-desktop"
EXEC="$APPDIR/Goose"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
FLAGS_FILE="$XDG_CONFIG_HOME/goose-desktop-flags.conf"
if [[ -f "$FLAGS_FILE" ]]; then
  GOOSE_USER_FLAGS="$(sed 's/#.*//' "$FLAGS_FILE" | tr '\n' ' ')"
fi
exec "$EXEC" "$@" ${GOOSE_USER_FLAGS:-}
EOF
  chmod 755 "${pkgdir}/usr/bin/goose-desktop"

  # 4) Fix the desktop entry to call goose-desktop and give it a unique filename
  if [[ -f "${pkgdir}/usr/share/applications/goose.desktop" ]]; then
    mv "${pkgdir}/usr/share/applications/goose.desktop" \
       "${pkgdir}/usr/share/applications/goose-desktop.desktop"
    sed -i \
      -e 's|^Exec=.*|Exec=/usr/bin/goose-desktop %U|' \
      -e 's|^Name=Goose$|Name=Goose Desktop|' \
      "${pkgdir}/usr/share/applications/goose-desktop.desktop"
    # Keep Icon=goose (it refers to /usr/share/pixmaps/goose.png already shipped)
  fi

  # 5) (Optional) standard Arch license path if upstream included copyright file
  if [[ -f "${pkgdir}/usr/share/doc/goose/copyright" ]]; then
    install -Dm644 "${pkgdir}/usr/share/doc/goose/copyright" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

  # 6) Install the CLI binary from the second source (CLI tarball)
  tar -xjf "${srcdir}/goose-cli-${pkgver}.tar.bz2" -C "${srcdir}"
  install -m755 "${srcdir}/goose" "${pkgdir}/usr/bin/goose"
}
