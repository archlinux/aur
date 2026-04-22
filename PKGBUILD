# Maintainer: thenomadcode <thenomadcodeinfo@gmail.com>

pkgname=stably-orca-bin
pkgver=1.3.9
pkgrel=1
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
sha256sums=('7fe91e4869ab3192ab487e5989dc912f7f726f10b91ab148dbe0c9dab724b95f'
            '99a4d39e313a217f68cae6eb5e5437f2522da037b99de989291e34524484795c'
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
