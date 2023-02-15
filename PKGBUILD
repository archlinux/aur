# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>
pkgname=iptvnator-appimage
pkgver=0.11.1
pkgrel=1
pkgdesc="Cross-platform IPTV player app, supports m3u+m3u8 playlists, favorites, TV guide, TV archive/catchup and more"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/4gray/iptvnator/"
license=('MIT')
depends=('fuse2')
provides=("iptvnator-appimage=${pkgver}")
conflicts=('iptvnator-appimage' 'iptvnator-bin')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=('iptvnator.sh')
source_x86_64=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}.AppImage")
source_aarch64=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}-arm64.AppImage")
source_armv7h=("${url}releases/download/v${pkgver}/IPTVnator-${pkgver}-armv7l.AppImage")
sha256sums=('759c6ebedf7483aa1211599f7c088fd716ddecc6aae571d20cc63c5d3fe29d0a')
sha256sums_x86_64=('c940068a1d40f5a032fa416d1e707a608935e97a43b1315f403e2ef8848a12b5')
sha256sums_aarch64=('798c5cb6520b97ceee1b4947325c1668a9057faafd916d26f9f02bd73b7fe434')
sha256sums_armv7h=('4b5a37c58a627af5e72e50638c8b1a4d32b9b67e0680bc1dd756804ba1f0ab3c')
[ $CARCH = "x86_64" ] && _image="$(basename "${source_x86_64[0]}")"
[ $CARCH = "aarch64" ] && _image="$(basename "${source_aarch64[0]}")"
[ $CARCH = "armv7h" ] && _image="$(basename "${source_armv7h[0]}")"

prepare() {
  cd "${srcdir}"
  chmod +x "${_image}"
  ./"${_image}" --appimage-extract
  sed -i -e "s/AppRun/\/usr\/bin\/iptvnator/" "${srcdir}/squashfs-root/iptvnator.desktop"
}

package() {
  install -Dm755 "${srcdir}/${_image}" "${pkgdir}/opt/iptvnator/iptvnator.AppImage"
  install -Dm755 "${srcdir}/iptvnator.sh" "${pkgdir}/usr/bin/iptvnator"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm644 "${srcdir}/squashfs-root/iptvnator.desktop" "${pkgdir}/usr/share/applications/iptvnator.desktop"
}
