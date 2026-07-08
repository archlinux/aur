# Maintainer: duanluan <duanluan@outlook.com>

pkgname=navicat17-premium-cs
pkgver=17.3.9
pkgrel=2
pkgdesc='Navicat Premium is a multi-connection database development tool. (Chinese Simplified)'
arch=('x86_64' 'aarch64')
url='https://www.navicat.com.cn/products/navicat-premium'
license=('NOASSERTION')
options=('!strip')
source_x86_64=("navicat17-premium-cs-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-x86_64.AppImage")
source_aarch64=("navicat17-premium-cs-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-aarch64.AppImage")
sha256sums_x86_64=('e9d90e5f25127da984d26d48796b028d560f2559643a6e565f0d2df36cca149c')
sha256sums_aarch64=('7023cea7eaa5841f266e1d59fd9e17e6bca3cbd80c51cdd888486c952c04abba')

package() {
  cd "${srcdir}"

  chmod +x "${srcdir}/navicat17-premium-cs-${CARCH}-${pkgver}.AppImage"
  "${srcdir}/navicat17-premium-cs-${CARCH}-${pkgver}.AppImage" --appimage-extract

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${pkgname}/"

  # Prefer Arch's system copies low-level libraries to avoid
  # symbol-version conflicts with host libmount/libudev users.
  rm -f \
    "${pkgdir}/opt/${pkgname}/usr/lib/libsystemd.so"* \
    "${pkgdir}/opt/${pkgname}/usr/lib/libudev.so"* \
    "${pkgdir}/opt/${pkgname}/usr/lib/libblkid.so"* \
    "${pkgdir}/opt/${pkgname}/usr/lib/libselinux.so"*

  install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/navicat.desktop" \
    "${pkgdir}/usr/share/applications/navicat.desktop"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/navicat-icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-icon.png"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/navicat"

  sed -i \
    -e 's|^Exec=.*|Exec=navicat %U|' \
    -e 's|^Icon=.*|Icon=navicat-icon|' \
    -e 's|^Categories=.*|Categories=Development;Database;|' \
    "${pkgdir}/usr/share/applications/navicat.desktop"
}
