# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=iptvnator-appimage
pkgver=0.13.0
pkgrel=1
pkgdesc="Cross-platform IPTV player app, supports m3u+m3u8 playlists, favorites, TV guide, TV archive/catchup and more"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/4gray/iptvnator/"
license=('MIT')
depends=('fuse2' 'mpv')
provides=("iptvnator-appimage=${pkgver}")
conflicts=('iptvnator-appimage' 'iptvnator-bin')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source_x86_64=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}.AppImage")
source_aarch64=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}-arm64.AppImage")
source_armv7h=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}-armv7l.AppImage")
sha256sums_x86_64=('57e690bfa3308a95bbc2da65099ee348e405625c4f07837f41e7f7f4ec674e8d')
sha256sums_aarch64=('7604191492d8943e589be03714b2c626b641d1481514f06b972686a868f9db54')
sha256sums_armv7h=('fd7ea5414b21af7e8fb79527cf38d32c271d4505ca60f3b1c0e829fefba8fcfa')
[ $CARCH = "x86_64" ] && _image="$(basename "${source_x86_64[0]}")"
[ $CARCH = "aarch64" ] && _image="$(basename "${source_aarch64[0]}")"
[ $CARCH = "armv7h" ] && _image="$(basename "${source_armv7h[0]}")"

prepare() {
  cd "${srcdir}"
  chmod +x "${_image}"
  ./"${_image}" --appimage-extract
  sed -i -e "s/AppRun/\/usr\/bin\/iptvnator/" "${srcdir}/squashfs-root/iptvnator.desktop"
  cat > iptvnator.sh <<EOF
#!/bin/sh
/opt/iptvnator/iptvnator.AppImage "\$@"
EOF
}

package() {
  install -Dm755 "${srcdir}/${_image}" "${pkgdir}/opt/iptvnator/iptvnator.AppImage"
  install -Dm755 "${srcdir}/iptvnator.sh" "${pkgdir}/usr/bin/iptvnator"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm644 "${srcdir}/squashfs-root/iptvnator.desktop" "${pkgdir}/usr/share/applications/iptvnator.desktop"
}
