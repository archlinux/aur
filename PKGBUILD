# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=superconductor-appimage
pkgver=0.11.3
pkgrel=2
pkgdesc='A playout client that will let you control CasparCG Server, BMD ATEM, OBS Studio, vMix, OSC-compatible devices, HTTP (REST)-compatible devices, and more'
arch=('x86_64')
url="https://github.com/SuperFlyTV/SuperConductor"
license=('LicenseRef-unknown' 'AGPL-3.0-only')
depends=('fuse2' 'glibc' 'hicolor-icon-theme' 'zlib')
optdepends=('tsr-bridge: External application which handles the actual playout and control of the connected devices')
provides=('superconductor')
conflicts=('superconductor')
options=(!strip)
source=("${url}/releases/download/v${pkgver}/SuperConductor-${pkgver}-Linux-Executable.AppImage")
sha256sums=('62e3ab5446d39fa0cd84ff90f1d9cfff983c4e7f07c3f2e8b4afd723849334f7')
_file="SuperConductor-Linux-Executable.AppImage"
_install_path="/opt/appimages/${_file}"

package() {
  mv "SuperConductor-${pkgver}-Linux-Executable.AppImage" "${_file}"
  chmod +x "${_file}"
  for i in 16 24 32 48 64 96 128 256 512 1024; do
    mkdir -p squashfs-root/usr/share/icons/hicolor/${i}x${i}/apps
  done
  ./${_file} --appimage-extract "usr/share/icons/hicolor/*/apps/superconductor.png"
  ./${_file} --appimage-extract superconductor.desktop
  ./${_file} --appimage-extract LICENSE.electron.txt
  sed -E "s|Exec=AppRun|Exec=${_install_path}|" -i "squashfs-root/superconductor.desktop"

  # Install icons
  for i in 16 24 32 48 64 96 128 256 512 1024; do
    install -Dm644 squashfs-root/usr/share/icons/hicolor/${i}x${i}/apps/superconductor.png \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/superconductor.png"
  done

  # Install .desktop file and image file
  # Disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
  # Disable AppimageLauncher integration prompt
  # https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
  sed -E "s|Exec=${_install_path}|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/superconductor|" \
    -i "squashfs-root/superconductor.desktop"
  install -Dm644 squashfs-root/superconductor.desktop "${pkgdir}/usr/share/applications/superconductor.desktop"
  install -Dm755 ${_file} "${pkgdir}/${_install_path}"
  install -d "${pkgdir}/usr/bin/"
  ln -s ${_install_path} "${pkgdir}/usr/bin/superconductor"

  # Install license
  install -Dm644 ${srcdir}/squashfs-root/LICENSE.electron.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Disable AppImage integration prompt
  # https://github.com/electron-userland/electron-builder/issues/1962
  install -dm755 "${pkgdir}/usr/share/appimagekit"
}

# vim:set ts=2 sw=2 et:
