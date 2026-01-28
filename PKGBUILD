# Maintainer: robertfoster
pkgname=codenomad-bin
_pkgname=CodeNomad
_binname='@neuralnomadscodenomad-electron-app'
pkgver=0.9.2 # renovate: datasource=github-releases depName=NeuralNomadsAI/CodeNomad
pkgrel=1
pkgdesc="A fast, multi-instance workspace for running OpenCode sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/NeuralNomadsAI/CodeNomad"
license=('LicenseRef-unknown')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
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
)
optdepends=('opencode: OpenCode CLI for AI coding sessions')
provides=('codenomad')
conflicts=('codenomad' 'codenomad-git')
options=('!strip' '!debug')

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"

  # Copy all files (zip extracts flat, not into a subdirectory)
  cp -r "${srcdir}"/* "${pkgdir}/opt/${pkgname}/"
  rm "${pkgdir}/opt/${pkgname}/codenomad.desktop"

  # Set permissions
  chmod 755 "${pkgdir}/opt/${pkgname}/${_binname}"
  chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"

  # Create wrapper script
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/codenomad" << EOF
#!/bin/bash
exec /opt/${pkgname}/${_binname} "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/codenomad"

  # Desktop entry
  install -Dm644 "${srcdir}/codenomad.desktop" \
    "${pkgdir}/usr/share/applications/codenomad.desktop"

  # Icon from resources
  if [[ -f "${pkgdir}/opt/${pkgname}/resources/icon.png" ]]; then
    install -Dm644 "${pkgdir}/opt/${pkgname}/resources/icon.png" \
      "${pkgdir}/usr/share/pixmaps/codenomad.png"
  fi
}

source=("codenomad.desktop")
source_x86_64=("${pkgname}-${pkgver}.zip::https://github.com/NeuralNomadsAI/CodeNomad/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}.zip::https://github.com/NeuralNomadsAI/CodeNomad/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.zip")
sha256sums=('099ff5f301ceebffbf8d386820bc8f4a9ab678d0f518fe5ef40aba32bf1f459f')
sha256sums_x86_64=('be288682609523baa6754a8bfc68dcc87bdf79a6cf5fea2ace0f6d10b70a1295')
sha256sums_aarch64=('6b25142e3cea29f0f1fc7385f1d09b4fe2e511271892316e9b16f2bbd25ffb74')
