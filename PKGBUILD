# Maintainer: Mindsaver <Mindsaver@users.noreply.github.com>
pkgname=linux-sensor-tray-bin
_pkgname=linux-sensor-tray
_appimage_name=Linux-Sensor-Tray
pkgver=0.2.0
pkgrel=1
pkgdesc="Tray-first Electron app for live CPU/GPU/mainboard/storage stats on Linux (AppImage repackage)"
arch=('x86_64')
url="https://github.com/Mindsaver/linux-sensor-tray"
license=('MIT')
depends=(
  'hicolor-icon-theme'
  'gtk3'
  'nss'
  'alsa-lib'
  'libcups'
  'libxkbcommon'
  'libxcomposite'
  'libxdamage'
  'libxrandr'
  'libxfixes'
  'libxext'
  'libx11'
  'libxcb'
  'pango'
  'cairo'
  'mesa'
  'gdk-pixbuf2'
  'at-spi2-core'
  'nspr'
  'libdbusmenu-glib'
)
optdepends=(
  'lshw: richer System info enrichment'
  'polkit: pkexec-based root helpers'
  'zenpower3-dkms: extra AMD CPU sensors (Vcore, V SoC, per-CCD temps)'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!strip !debug)
source=(
  "${_appimage_name}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appimage_name}-${pkgver}.AppImage"
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
  "${_pkgname}.sh"
  "${_pkgname}.desktop"
)
sha256sums=('ff313f77e8702df50158bf1bd4fdbaf42d4ee208efe1085997bd058440f9ad7f'
            'e552a4ea6b18459048d98882b05ff09dc1d1b6d0fb32443de4f7367335d14348'
            'f1e53185b3695f2fabdca9474b782fb6db31fc248b925beb5208494b82ca5343'
            '4af4bed1cb787c29e0f5345330f7ba83bbcb97ea5d42dde20f3e77b56522697a')
noextract=("${_appimage_name}-${pkgver}.AppImage")

prepare() {
  cd "$srcdir"
  chmod +x "${_appimage_name}-${pkgver}.AppImage"
  rm -rf squashfs-root
  "./${_appimage_name}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
  cd "$srcdir"

  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -a squashfs-root/. "${pkgdir}/opt/${_pkgname}/"

  # AppImage internals are mode 0700 by default; relax so the system user can read/exec.
  chmod -R go+rX "${pkgdir}/opt/${_pkgname}"

  # Strip AppImage cruft we replace with proper system install
  rm -f "${pkgdir}/opt/${_pkgname}/AppRun" \
        "${pkgdir}/opt/${_pkgname}/.DirIcon" \
        "${pkgdir}/opt/${_pkgname}"/*.desktop \
        "${pkgdir}/opt/${_pkgname}"/*.png

  # chrome-sandbox needs setuid root unless unprivileged user namespaces are enabled.
  # On modern Arch kernels user namespaces are on by default, but keep this for safety.
  chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"

  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
