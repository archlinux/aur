# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=tsr-bridge-appimage
pkgver=0.11.3
pkgrel=2
pkgdesc='Handles the actual playout and control of the connected devices'
arch=('x86_64')
url="https://github.com/SuperFlyTV/SuperConductor"
license=('LicenseRef-unknown' 'AGPL-3.0-only')
depends=('fuse2' 'glibc' 'hicolor-icon-theme' 'superconductor' 'zlib')
provides=('tsr-bridge')
conflicts=('tsr-bridge')
options=(!strip)
source=("${url}/releases/download/v${pkgver}/TSR-Bridge-${pkgver}-Linux-Executable.AppImage")
sha256sums=('94456d87c77fa74158f2571f08a3c15c0a507431c905e3ef8aec6852d2584941')
_file="TSR-Bridge-Linux-Executable.AppImage"
_install_path="/opt/appimages/${_file}"

package() {
  mv "TSR-Bridge-${pkgver}-Linux-Executable.AppImage" "$_file"
  chmod +x "${_file}"
  for i in 16 32 48 64 128 256; do
    mkdir -p squashfs-root/usr/share/icons/hicolor/${i}x${i}/apps
  done
  ./${_file} --appimage-extract "usr/share/icons/hicolor/*/apps/tsr-bridge.png"
  ./${_file} --appimage-extract tsr-bridge.desktop
  ./${_file} --appimage-extract LICENSE.electron.txt
  sed -E "s|Exec=AppRun|Exec=${_install_path}|" -i "squashfs-root/tsr-bridge.desktop"

  # Install icons
  for i in 16 32 48 64 128 256; do
    install -Dm644 squashfs-root/usr/share/icons/hicolor/${i}x${i}/apps/tsr-bridge.png \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/tsr-bridge.png"
  done

  # Install .desktop file and image file
  # Disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
  # Disable AppimageLauncher integration prompt
  # https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
  sed -E "s|Exec=${_install_path}|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/tsr-bridge|" \
    -i "squashfs-root/tsr-bridge.desktop"
  install -Dm644 squashfs-root/tsr-bridge.desktop "${pkgdir}/usr/share/applications/tsr-bridge.desktop"
  install -Dm755 ${_file} "${pkgdir}/${_install_path}"
  install -d "${pkgdir}/usr/bin/"
  ln -s ${_install_path} "${pkgdir}/usr/bin/tsr-bridge"

  # Install license
  install -Dm644 ${srcdir}/squashfs-root/LICENSE.electron.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Disable AppImage integration prompt
  # https://github.com/electron-userland/electron-builder/issues/1962
  install -dm755 "${pkgdir}/usr/share/appimagekit"
}

# vim:set ts=2 sw=2 et:
