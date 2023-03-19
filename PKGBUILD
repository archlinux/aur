# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>
pkgname=iptvnator-appimage
pkgver=0.12.0
pkgrel=1
pkgdesc="Cross-platform IPTV player app, supports m3u+m3u8 playlists, favorites, TV guide, TV archive/catchup and more"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/4gray/iptvnator/"
license=('MIT')
depends=('fuse2')
provides=("iptvnator-appimage=${pkgver}")
conflicts=('iptvnator-appimage' 'iptvnator-bin')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source_x86_64=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}.AppImage")
source_aarch64=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}-arm64.AppImage")
source_armv7h=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}-armv7l.AppImage")
sha256sums_x86_64=('9939bbd758b52232b915f1a0189e3442f6427ae6cdde4fe1f10ef7c23ee97521')
sha256sums_aarch64=('2dcf36f954d526cd594f5f0ba763978d76b1c23c87dd74b0d5f8cb9034b027dd')
sha256sums_armv7h=('c0c371288a06fa170ce2993a8a148208a232442129c618ab50270f06cacc8a20')
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
