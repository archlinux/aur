# Maintainer: Maxim De Clercq <maximdeclercq00@gmail.com>

pkgname=creality-print-appimage
pkgver=3.11.1
pkgrel=1
pkgdesc="Creality Print is a slicer dedicated to FDM printers."
arch=('x86_64')
url="https://www.creality.com/pages/download"
license=('unknown')
depends=('fuse2')
provides=('creality-print')
conflicts=('creality-print')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated

_filename="Creality_Print-v${pkgver}-Ubutu-${arch[0]}-Release.AppImage"
_appimage_name="Creality-Print.AppImage"
_install_path="/opt/appimages/${_appimage_name}"

noextract=("${_filename}")
md5sums=(
  "1946156fb58ee2564ae71424e44c05a3"
  "eba3c0e5365cc454862becb642e113a9"
)
sha512sums=(
  "0175d37fcd222da52ae12c16fbd9b55f730fa77bb587cfb2699de32e06d8592c26781c615c3d41404a62f7cc53afa26bef1edb189001a0dbf0e6ad9750fdcc68"
  "5c0982b7475dae73cbc0ce5b96771b969ff7779daae452cf2e0d5d26fb43981c3e614485593f5306dfda9b3d3a6a2a8f319ef62b07d668479c60d82c8c1631b0"
)
source=(
  "https://file2-cdn.creality.com/file/${md5sums[0]}/${_filename}"
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
