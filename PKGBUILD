# Maintainer: duanluan <duanluan@outlook.com>

# Naming: Photon Studio is non-free software without available sources, so per
# the Arch nonfree packaging guidelines the -bin suffix must not be used.
# See docs/aur-packaging-rules.md in the source repository.
pkgname=photon-studio
pkgver=0.1.42
pkgrel=1
pkgdesc='Offline image editor with Photoshop-equivalent capabilities and native PSD support'
arch=('x86_64')
url='https://tenzen.studio/photon/'
license=('LicenseRef-Proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'util-linux'
  'util-linux-libs'
  'xdg-utils'
)
provides=("photon-studio-bin=${pkgver}")
conflicts=('photon-studio-bin')
options=('!strip' '!lto')
source=(
  "photon-studio-${pkgver}-x86_64.AppImage::https://downloads.tenzen.studio/photon/stable/linux/${pkgver}/Photon-Studio-${pkgver}-linux-x64.AppImage"
  'photon-studio.desktop'
  'photon-studio.sh'
  'photon-studio.png'
)
sha256sums=(
  'ee000c70569440c7f6c191b1393d8d3315a231ac7e835122532b76bf8f5bd841'
  '29ec994ac0ffd028dbc0a86e4a1df1d25dc0de8988458cb0f579a1330ffd5f5d'
  '3dbdf2ebbc5979699219a3d332245a19ab0409f21185a886efd92f8bcdc65969'
  'd49bb3c106257c1f75995fa793737113dc87418be5bec19388e6a523ffaafc18'
)

package() {
  cd "${srcdir}"

  chmod +x "${srcdir}/photon-studio-${pkgver}-x86_64.AppImage"
  "${srcdir}/photon-studio-${pkgver}-x86_64.AppImage" --appimage-extract >/dev/null

  local approot="${srcdir}/squashfs-root"
  for required_path in \
    "${approot}/AppRun" \
    "${approot}/photon-studio.bin" \
    "${approot}/resources/app.asar"; do
    [[ -e "${required_path}" ]] || {
      printf 'missing required upstream path: %s\n' "${required_path}" >&2
      return 1
    }
  done

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a "${approot}/." "${pkgdir}/opt/${pkgname}/"

  # Electron's sandbox helper must retain its setuid bit for sandboxed renderers.
  chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"

  install -Dm755 "${srcdir}/photon-studio.sh" \
    "${pkgdir}/usr/bin/photon-studio"
  install -Dm644 "${srcdir}/photon-studio.desktop" \
    "${pkgdir}/usr/share/applications/photon-studio.desktop"
  # Official brand logo (https://tenzen.studio/assets/brand/photon-logo.png,
  # already 512x512). Installed into 512x512 because hicolor's index.theme
  # declares no 1024x1024 directory, so icons placed there are never found.
  install -Dm644 "${srcdir}/photon-studio.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/photon-studio.png"

  install -Dm644 "${approot}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${approot}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
