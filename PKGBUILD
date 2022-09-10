# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>

pkgname=cura-modern-appimage
pkgver=5.1.0
pkgrel=1
pkgdesc="State-of-the-art slicer app to prepare your 3D models for your 3D printer. (Modern AppImage)"
arch=('x86_64')
url="https://github.com/Ultimaker/Cura"
license=('LGPL3')
depends=('fuse2')
provides=('cura')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated

_filename="Ultimaker-Cura-modern-${pkgver}.AppImage"
_appimage_name="Ultimaker-Cura-modern.AppImage"
_install_path="/opt/appimages/${_appimage_name}"

noextract=("${_filename}")
source=(
  "${_filename}::https://github.com/Ultimaker/Cura/releases/download/5.1.0/Ultimaker-Cura-5.1.0-linux-modern.AppImage"
  "https://raw.githubusercontent.com/Ultimaker/Cura/5.1.0/LICENSE"
  "cura.desktop.patch"
)
sha512sums=(
  "aa4590c30ffd76fc51ab7343a461db4290f4c1481bda46a27780a86988214d1366bf32049fa838b72c838b6e5915838938163e481d7f21fa0d790daf86acc49b"
  "d163a24c8255b008c556a4b3f97559b18105a75fcdb74af52fad479b6b66ff25305c28df1df160b16a72beadc7b55900f31de39b04732beb2de4c1cf2e576c62"
  "25e638fea3a18087388dd960a746441dc95753b5ba00f9e011f723b6df74e884acb95c1b80611b4d97730fdc03f944b9aaee8277c9cc9a7578260383686c12e1"
)

prepare() {
    cd "${srcdir}"
    chmod +x "./${_filename}"
    ./${_filename} --appimage-extract cura-icon.png
    ./${_filename} --appimage-extract cura.desktop
    patch -Np0 < ./cura.desktop.patch
}

package() {
  # Copy AppImage file
  install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"

  # Make AppImage available as cura in PATH
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "${_install_path}" "${pkgdir}/usr/bin/cura"

  # Copy Desktop entry
  install -Dm644 "${srcdir}/squashfs-root/cura.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Copy icon
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  cp -dpr --no-preserve=ownership "squashfs-root/cura-icon.png" "${pkgdir}/usr/share/pixmaps/cura-icon.png"

  # Copy license file
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}