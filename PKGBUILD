# Maintainer: Maxim De Clercq <maximdeclercq00@gmail.com>
# Contributor: Anders Blenstrup-Pedersen <abp at ryuu dot technology>
pkgname=creality-print-appimage
pkgver=4.3.6.6257
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
  "b8490ba0b1da918096cd99ae44794bd2"
  "eba3c0e5365cc454862becb642e113a9"
)
sha512sums_x86_64=(
  "12448e0826d4d5fb130d1764ea073c64967dfe061b6cacc827de4e12e119a500d2883b90e1914e1c774f03f47f51a92ef0eb3969d977fbf8f601628442e0be6b"
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
