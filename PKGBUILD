# Maintainer: dashboard-LAB contributors <https://github.com/p-changki/dashboard-LAB>
pkgname=dashboard-lab-bin
_pkgname=dashboard-lab
pkgver=0.1.15
pkgrel=1
pkgdesc='Local-first AI workspace dashboard with Electron desktop packaging'
arch=('x86_64')
url='https://github.com/p-changki/dashboard-LAB'
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
)
optdepends=(
  'libnotify: desktop notifications'
  'xdg-utils: open URLs in default browser'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=('!strip' '!debug')
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/p-changki/dashboard-LAB/releases/download/v${pkgver}/dashboard-lab-${pkgver}.tar.gz"
  "dashboard-lab.desktop"
)
sha256sums=(
  'f324ccf305ff29afe32ce81fa305406b8182771caa1b0346a41338a4674ac3d8'
  'SKIP'
)
noextract=("${_pkgname}-${pkgver}.tar.gz")

prepare() {
  mkdir -p "${srcdir}/${_pkgname}-${pkgver}"
  bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}.tar.gz" \
    -C "${srcdir}/${_pkgname}-${pkgver}" --strip-components=1

  # Remove empty residual directory left by bsdtar strip-components
  rmdir "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}" 2>/dev/null || true
}

package() {
  # Install the entire bundled app to /opt
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a "${srcdir}/${_pkgname}-${pkgver}/"* "${pkgdir}/opt/${_pkgname}/"

  # Launcher script
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" << 'LAUNCHER'
#!/bin/bash
# Allow running as root with --no-sandbox for system administrators
if [ "$(id -u)" -eq 0 ]; then
  exec /opt/dashboard-lab/dashboard-lab --no-sandbox "$@"
else
  exec /opt/dashboard-lab/dashboard-lab "$@"
fi
LAUNCHER
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop entry
  install -Dm644 "${srcdir}/dashboard-lab.desktop" \
    "${pkgdir}/usr/share/applications/dashboard-lab.desktop"

  # Icons (multiple sizes from upstream icon.png)
  install -Dm644 "${pkgdir}/opt/${_pkgname}/resources/app/build-resources/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/dashboard-lab.png"

  # Symlink for the pixmaps fallback
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/usr/share/icons/hicolor/512x512/apps/dashboard-lab.png" \
    "${pkgdir}/usr/share/pixmaps/dashboard-lab.png"

  # License
  install -Dm644 "${pkgdir}/opt/${_pkgname}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  if [ -f "${pkgdir}/opt/${_pkgname}/LICENSES.chromium.html" ]; then
    install -Dm644 "${pkgdir}/opt/${_pkgname}/LICENSES.chromium.html" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
  fi

  # chrome-sandbox: either setuid or rely on user namespaces (default on Arch)
  # Most modern Arch installs have unprivileged user namespaces enabled,
  # so we do NOT set suid. If needed, users can:
  #   sudo chmod 4755 /opt/dashboard-lab/chrome-sandbox
  chmod 0755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
}
