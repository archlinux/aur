# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=iptvnator-appimage
pkgver=0.14.0
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
sha256sums_x86_64=('e7d9f5e9f666eda4be74c986ec65f879c8ad2ffde08102cc79262ef4e6897c0b')
sha256sums_aarch64=('912fbc09b0bf660470d09c88ecceaed5430b9f7a8ca0052fe8ec0209dd57d131')
sha256sums_armv7h=('4de76fe4a4d3d69a47286e1f7a86834dbf841ec1749a6584f201b0e6725a91e9')
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
