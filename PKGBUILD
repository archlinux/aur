# Maintainer: Sheikh Limon <sheikhlimon404@gmail.com>

pkgname=goose-desktop-bin
pkgver=1.61.1
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
    "goose-cli-${pkgver}-vulkan.tar.bz2::https://github.com/aaif-goose/goose/releases/download/v${pkgver}/goose-x86_64-unknown-linux-gnu-vulkan.tar.bz2"
)
b2sums=('47e0b164c5da883df591e014a7b870b48fd26c2b9f8f7c7728ce596dd35b57f082f5bb969c4ddfebfc2d4414f3e6909e13714f2f99d2d4ad4e5afd77268b1bf4'
        '5a111e0cef382b1c8d23a69ec51a85bc8e0c9538cf011b9e56a4a84184bc8024d14f35556317f6a251397280bc256cc3f557575c4c182e9a90cfceabac8f38fe')

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

  # 4) Fix the desktop entry to call goose-desktop and set StartupWMClass for Wayland window matching
  if [[ -f "${pkgdir}/usr/share/applications/goose.desktop" ]]; then
    mv "${pkgdir}/usr/share/applications/goose.desktop" \
       "${pkgdir}/usr/share/applications/goose-desktop.desktop"
    sed -i \
      -e 's|^Exec=.*|Exec=/usr/bin/goose-desktop %U|' \
      -e 's|^Name=Goose$|Name=Goose Desktop|' \
      "${pkgdir}/usr/share/applications/goose-desktop.desktop"
    if ! grep -q '^StartupWMClass=' "${pkgdir}/usr/share/applications/goose-desktop.desktop"; then
      echo "StartupWMClass=Goose" >> "${pkgdir}/usr/share/applications/goose-desktop.desktop"
    else
      sed -i 's|^StartupWMClass=.*|StartupWMClass=Goose|' "${pkgdir}/usr/share/applications/goose-desktop.desktop"
    fi
    # Keep Icon=goose (it refers to /usr/share/pixmaps/goose.png already shipped)
  fi

  # 5) (Optional) standard Arch license path if upstream included copyright file
  if [[ -f "${pkgdir}/usr/share/doc/goose/copyright" ]]; then
    install -Dm644 "${pkgdir}/usr/share/doc/goose/copyright" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

  # 6) Install the CLI binary from the second source (CLI tarball)
  tar -xjf "${srcdir}/goose-cli-${pkgver}-vulkan.tar.bz2" -C "${srcdir}"
  install -m755 "${srcdir}/goose" "${pkgdir}/usr/bin/goose"
}
