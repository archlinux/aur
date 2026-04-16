# Maintainer: thenomadcode <thenomadcodeinfo@gmail.com>

pkgname=stably-orca-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Stably AI Orca - Electron-based agentic coding IDE (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/stablyai/orca"
license=('MIT')
depends=(
  'fuse2'
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
            'b412134da6b7ac048c6ac3fe7e2bb14fb3b2b12ab0aee994c51684349b98b309'
            '6e05296c09a37e0c28b9a2886b804d167a0c025ef1e72f955e9ba744be2f1dcd')
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
  cd "${srcdir}"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/opt/stably-orca/orca.AppImage"
  install -Dm755 "${srcdir}/stably-orca.sh" \
    "${pkgdir}/usr/bin/stably-orca"
  install -Dm644 "${srcdir}/stably-orca.desktop" \
    "${pkgdir}/usr/share/applications/stably-orca.desktop"

  local sqfs="${srcdir}/squashfs-root"
  if [[ -d "${sqfs}" ]]; then
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
  fi
}
