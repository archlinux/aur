# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>

pkgname=cura-modern-appimage
pkgver=5.4.0
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
  "https://github.com/Ultimaker/Cura/releases/download/5.4.0/UltiMaker-Cura-5.4.0-linux-modern.AppImage"
  "https://raw.githubusercontent.com/Ultimaker/Cura/5.4.0/LICENSE"
  "cura.desktop.patch"
)
sha512sums=(
  "e1a174f79b5b67359126b607aabbab57eba03cf265d443608cee884e2ed18d49ccd0ebfe4fa5178e0eeb7f831e732eaf9ebd39d2ff205f5d8104cb7d783ec43a"
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