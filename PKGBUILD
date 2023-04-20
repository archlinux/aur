# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>

pkgname=cura-modern-appimage
pkgver=5.3.1
pkgrel=1
pkgdesc="State-of-the-art slicer app to prepare your 3D models for your 3D printer. (Modern AppImage)"
arch=('x86_64')
url="https://github.com/Ultimaker/Cura"
license=('LGPL3')
depends=('fuse2')
provides=('cura')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated

_filename="UltiMaker-Cura-${pkgver}-linux-modern.AppImage"
_appimage_name="Ultimaker-Cura-modern.AppImage"
_install_path="/opt/appimages/${_appimage_name}"

noextract=("${_filename}")
source=(
  "https://github.com/Ultimaker/Cura/releases/download/5.3.1/UltiMaker-Cura-5.3.1-linux-modern.AppImage"
  "https://raw.githubusercontent.com/Ultimaker/Cura/5.3.1/LICENSE"
  "cura.desktop.patch"
)
sha512sums=(
  "81bb4ecdd050b0d2eaaa7ed45251a2613ce83084e7e57ba4a0d660c71d59bac22e2cad47531fedefe7d00dbdc0781834fa8604ef95c7342d68bdcbd465afa38b"
  "d163a24c8255b008c556a4b3f97559b18105a75fcdb74af52fad479b6b66ff25305c28df1df160b16a72beadc7b55900f31de39b04732beb2de4c1cf2e576c62"
  "fec6685d0c435b3f1f115ad5377dee09f5865a4dcc6288aaef6353bd81a21e3be03ef3ce7f1dd826e9e546c696492fdbfb7d8cfb56d8afdd291d050dcc097ae7"
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