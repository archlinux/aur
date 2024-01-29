# Maintainer: Anders Blenstrup-Pedersen <abp at ryuu dot technology>
pkgname=creality-print
pkgver=4.3.7.6627
pkgrel=1
pkgdesc="Creality Print is a slicer dedicated to FDM printers."
arch=('x86_64')
url="https://www.creality.com/pages/download"
license=('unknown')
depends=('fuse2')
provides=('creality-print')
conflicts=('creality-print')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated

_filename="Creality-Print-v${pkgver}-${arch[0]}.AppImage"
_appimage_name="Creality-Print.AppImage"
_install_path="/opt/appimages/${_appimage_name}"

noextract=("${_filename}")
md5sums_x86_64=(
  "05a4538e0c7222ce547eb8d58ef0251e"
  "eba3c0e5365cc454862becb642e113a9"
)
sha512sums_x86_64=(
  "7eccdbfeaf5696014dcde34a9faefa282a3954023315e8383afbde12dd5552f1a606df2c4cebcb11f10fcca1dbd344821b665f5dcf1d8aadda7ca72548d11d9f"
  "5c0982b7475dae73cbc0ce5b96771b969ff7779daae452cf2e0d5d26fb43981c3e614485593f5306dfda9b3d3a6a2a8f319ef62b07d668479c60d82c8c1631b0"
)
source_x86_64=(
  "${_filename}::https://file2-cdn.creality.com/file/${md5sums_x86_64[0]}/Creality_Print-v${pkgver}-${arch[0]}-Release.AppImage"
  "default.desktop.patch"
)

prepare() {
  cd "${srcdir}"

  # Extract desktop file and application icon from AppImage
  chmod +x "./${_filename}"
  ./${_filename} --appimage-extract "default.*"
  patch -Np0 < ./default.desktop.patch
}

package() {
  cd "${srcdir}"

  # Install AppImage and symlink it
  install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "${_install_path}" "${pkgdir}/usr/bin/${provides[0]}"

  # Install desktop file and application icon
  install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${provides[0]}.desktop"
  install -Dm644 "${srcdir}/squashfs-root/default.png" "${pkgdir}/usr/share/icons/${provides[0]}.png"
}
