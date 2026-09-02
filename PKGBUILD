# Maintainer: thenomadcode <thenomadcodeinfo@gmail.com>

pkgname=stably-orca-bin
pkgver=1.4.195
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
sha256sums=('6fbb4b9b46e2ce06406df96ce1c835543ded13dd011820d6b88b3a152897b814'
            '99a4d39e313a217f68cae6eb5e5437f2522da037b99de989291e34524484795c'
            '05728d7dfad97b6b8d6b10dc3859fff566334500e480df4c5c8372491cf4f172')
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
  # Upstream names the Linux executable and its icon `orca-ide` (GNOME Orca
  # already owns `orca`), and has renamed it before, so match whatever single
  # icon each hicolor size ships instead of hardcoding a basename.
  local found=0 size src
  for size in 16 24 32 48 64 128 256 512; do
    for src in "${sqfs}/usr/share/icons/hicolor/${size}x${size}/apps/"*.png; do
      [[ -f "${src}" ]] || continue
      install -Dm644 "${src}" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/stably-orca.png"
      found=1
      break
    done
  done
  if (( found == 0 )); then
    for src in "${sqfs}"/*.png; do
      [[ -f "${src}" ]] || continue
      install -Dm644 "${src}" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/stably-orca.png"
      found=1
      break
    done
  fi
  # Fail loudly: a silently icon-less package looks fine in CI but ships a
  # blank launcher entry, which is how the orca -> orca-ide rename went
  # unnoticed in the first place.
  if (( found == 0 )); then
    echo "ERROR: no application icon found under ${sqfs}."
    echo "Upstream icon layout changed. Inspect the extracted tree and update PKGBUILD."
    return 1
  fi
}
