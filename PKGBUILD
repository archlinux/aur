pkgname=creality-print-appimage
pkgver=6.3.0.3417
pkgrel=1
pkgdesc="Creality Print is a slicer dedicated to FDM printers."
arch=('x86_64')
url="https://github.com/CrealityOfficial/CrealityPrint"
license=('AGPL-3.0-only')
depends=('fuse2')
provides=('creality-print')
conflicts=('creality-print')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated

_semver_version=$(echo ${pkgver} | cut -d'.' -f 1,2,3)
_filename="CrealityPrint-V${pkgver}-${arch[0]}.AppImage"
_appimage_name="Creality-Print.AppImage"
_install_path="/opt/appimages/${_appimage_name}"

noextract=("${_filename}")
sha512sums_x86_64=(
  'd1a6d2516317cb36d49c6c0760ff05fa7118e95bbe8e3ab27345c4acc6a90cd535bd6bbe704236ec6a355f2d1aea575a701374ced43e3fa75757f021b16edcf3'
  '7e038ab385f767433de39e8686f29c096fe6d5967e74f185570d37786583554957e483f14489a512fa652048dfcffc10ccc1782d20645e04d2759d475f88b65a'
)
source_x86_64=(
  "${_filename}::https://github.com/CrealityOfficial/CrealityPrint/releases/download/v${_semver_version}/CrealityPrint_Ubuntu2404-V${pkgver}-${arch[0]}-Release.AppImage"
  "CrealityPrint.desktop.patch"
)

prepare() {
  cd "${srcdir}"

  # Extract desktop file and application icon from AppImage
  chmod +x "./${_filename}"
  ./${_filename} --appimage-extract "CrealityPrint.*"
  patch -Np0 <./CrealityPrint.desktop.patch
}

package() {
  cd "${srcdir}"

  # Install AppImage and symlink it
  install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "${_install_path}" "${pkgdir}/usr/bin/${provides[0]}"
  # Install desktop file and application icon
  install -Dm644 "${srcdir}/squashfs-root/CrealityPrint.desktop" "${pkgdir}/usr/share/applications/${provides[0]}.desktop"
  install -Dm644 "${srcdir}/squashfs-root/CrealityPrint.png" "${pkgdir}/usr/share/icons/${provides[0]}.png"
}
