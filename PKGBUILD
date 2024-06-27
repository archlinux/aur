pkgname=creality-print-appimage
pkgver=4.3.8.6991
pkgrel=1
pkgdesc="Creality Print is a slicer dedicated to FDM printers."
arch=('x86_64')
url="https://github.com/CrealityOfficial/CrealityPrint"
license=('unknown')
depends=('fuse2')
provides=('creality-print')
conflicts=('creality-print')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated

_semver_version=$(echo ${pkgver} | cut -d'.' -f 1,2,3)
_filename="Creality-Print-v${pkgver}-${arch[0]}.AppImage"
_appimage_name="Creality-Print.AppImage"
_install_path="/opt/appimages/${_appimage_name}"

noextract=("${_filename}")
sha512sums_x86_64=(
  '600f86b5a1f635b6ffecc2f64c79044e03290edc1ccc2b2b86f103b9294bb9025d90c707317fd01f204301ad7b5c984bc135ba29e7ae2e74f0be6b424c7e605e'
  '5c0982b7475dae73cbc0ce5b96771b969ff7779daae452cf2e0d5d26fb43981c3e614485593f5306dfda9b3d3a6a2a8f319ef62b07d668479c60d82c8c1631b0'
)
source_x86_64=(
  "${_filename}::https://github.com/CrealityOfficial/CrealityPrint/releases/download/v${_semver_version}/Creality_Print-v${pkgver}-${arch[0]}-Release.AppImage"
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
