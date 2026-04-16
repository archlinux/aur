# Maintainer: thenomadcode <thenomadcodeinfo@gmail.com>

pkgname=stably-orca-bin
pkgver=1.2.2
pkgrel=3
pkgdesc="Stably AI Orca - Electron-based agentic coding IDE (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/stablyai/orca"
license=('MIT')
depends=(
  'zlib'
  'hicolor-icon-theme'
  'gtk3'
  'nss'
  'alsa-lib'
  'libnotify'
  'libxss'
  'libxtst'
  'libsecret'
)
provides=('stably-orca')
conflicts=('stably-orca' 'stably-orca-git')
options=('!strip' '!debug')
source=(
  "${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/orca-linux.AppImage"
  'stably-orca.sh'
  'stably-orca.desktop'
)
sha256sums=('139a7ebfbe20d2f7197cb389ccdd84dace2e610b5c9b4891003c5825b205969d'
            '174c3e1cd049c23d239e456c21e26f96b4ff325bd367397fd41db43a0d722c02'
            '6e05296c09a37e0c28b9a2886b804d167a0c025ef1e72f955e9ba744be2f1dcd')
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
  cd "${srcdir}"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
  local sqfs="${srcdir}/squashfs-root"

  # Install the extracted AppImage tree rather than the AppImage file.
  # AppImageLauncher hooks AppImage execution at the binfmt_misc level and
  # would intercept every launch; shipping a normal directory with AppRun
  # avoids that entirely, and also drops the fuse2 runtime dependency.
  install -dm755 "${pkgdir}/opt/stably-orca"
  cp -a "${sqfs}/." "${pkgdir}/opt/stably-orca/"
  # Extracted AppImages can ship with 0700 on the root dir; make everything
  # world-readable and dirs world-traversable so non-root users can launch.
  chmod -R u+rwX,go+rX "${pkgdir}/opt/stably-orca"
  chmod 755 "${pkgdir}/opt/stably-orca/AppRun"

  install -Dm755 "${srcdir}/stably-orca.sh" \
    "${pkgdir}/usr/bin/stably-orca"
  install -Dm644 "${srcdir}/stably-orca.desktop" \
    "${pkgdir}/usr/share/applications/stably-orca.desktop"

  # Theme-aware icon install (in addition to the copies inside /opt).
  local found=0
  for size in 16 32 48 64 128 256 512; do
    local src="${sqfs}/usr/share/icons/hicolor/${size}x${size}/apps/orca.png"
    if [[ -f "${src}" ]]; then
      install -Dm644 "${src}" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/stably-orca.png"
      found=1
    fi
  done
  if [[ "${found}" -eq 0 && -f "${sqfs}/orca.png" ]]; then
    install -Dm644 "${sqfs}/orca.png" \
      "${pkgdir}/usr/share/icons/hicolor/512x512/apps/stably-orca.png"
  fi
}
