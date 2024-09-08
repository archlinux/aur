# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=iptvnator-appimage
pkgver=0.15.1
pkgrel=2
pkgdesc='Cross-platform IPTV player application with multiple features, such as support of m3u and m3u8 playlists, favorites, TV guide, TV archive/catchup and more'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/4gray/iptvnator/'
license=('MIT')
depends=('fuse2' 'glibc' 'hicolor-icon-theme' 'zlib')
optdepends=('mpv: media player'
            'vlc: media player')
provides=(iptvnator)
conflicts=(iptvnator)
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source_x86_64=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}.AppImage")
source_aarch64=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}-arm64.AppImage")
source_armv7h=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}-armv7l.AppImage")
sha256sums_x86_64=('fd0d9de1122df031d46b2de572648f697f5bc0db91d84fb73f16f198e1a4a763')
sha256sums_aarch64=('6319a0dd3ff4e131af5381d3b398527d5ad375bab999a4f94ca988acb339336f')
sha256sums_armv7h=('e9666d23338e77e3a18601f97e4fe6c217bd73d841d056388e2e5fe53fea6961')
[ $CARCH = "x86_64" ] && _image="$(basename "${source_x86_64[0]}")"
[ $CARCH = "aarch64" ] && _image="$(basename "${source_aarch64[0]}")"
[ $CARCH = "armv7h" ] && _image="$(basename "${source_armv7h[0]}")"
_filename="${_image}"
_squashfs_desktop_file="iptvnator.desktop"
_desktop_file="/usr/share/applications/iptvnator.desktop"
_appimage_name=$(echo "${_filename}" | sed -E 's/-[0-9]*.[0-9]*.[0-9]*//')
_install_path="/opt/appimages/${_appimage_name}"

package() {
  chmod +x "${_filename}"
  for i in 16 32 48 64 128 192 512 1024; do
    mkdir -p squashfs-root/usr/share/icons/hicolor/${i}x${i}/apps
  done
  ./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/iptvnator.png"
  ./${_filename} --appimage-extract iptvnator.desktop
  ./${_filename} --appimage-extract LICENSE.electron.txt
  sed -E "s|Exec=AppRun|Exec=${_install_path}|" -i "squashfs-root/${_squashfs_desktop_file}"

  # Install icons
  for i in 16 32 48 64 128 192 512 1024; do
    install -Dm644 squashfs-root/usr/share/icons/hicolor/${i}x${i}/apps/iptvnator.png \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/iptvnator.png"
  done

  # Install .desktop file and image file
  # Disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
  # Disable AppimageLauncher integration prompt
  # https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
  sed -E "s|Exec=${_install_path}|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/iptvnator|" \
    -i "squashfs-root/${_squashfs_desktop_file}"
  install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
  install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
  mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
  ln -s "${_install_path}" "${pkgdir}/usr/bin/iptvnator"

  # Install license
  install -Dm644 ${srcdir}/squashfs-root/LICENSE.electron.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Disable AppImage integration prompt
  # https://github.com/electron-userland/electron-builder/issues/1962
  install -dm755 "${pkgdir}/usr/share/appimagekit"
}

# vim:set ts=2 sw=2 et:
