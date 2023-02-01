# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>

pkgname=freecad-assembly3-appimage
pkgver=2023.01.31
pkgrel=1
pkgdesc="Assembly3 workbench for FreeCAD."
arch=('x86_64')
url="https://github.com/realthunder/FreeCAD"
license=('LGPLv2')
depends=('fuse2')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated

_filename="FreeCAD-asm3-${pkgver}.AppImage"
_squashfs_desktop_file="freecad_link.desktop"
_desktop_file="/usr/share/applications/freecad-asm3-appimage.desktop"
_appimage_name="FreeCAD-asm3.AppImage"
_install_path="/opt/appimages/${_appimage_name}"

noextract=("${_filename}")
source=(
  "${_filename}::https://github.com/realthunder/FreeCAD/releases/download/2023.01.31-edge/FreeCAD-asm3-Daily-Conda-Py3.10-20230131-glibc2.12-x86_64.AppImage"
  "https://raw.githubusercontent.com/realthunder/FreeCAD/2023.01.31-edge/LICENSE"
  "freecad_link.desktop.patch"
)
sha512sums=(
  "7d2bb4992b2f25f036cbc1eef2269f07879cd817c24cdede6c5eb9f84d623ffda42281f7aa1a2d92121bfb575cc7328503ba09da86c5b54fe91858efe5d998de"
  "4d1b0998dc55adcfb2ac2f33382bce6467078aaa33dbd3bedf5c2102da853d4186836ad4103ea6100f34068751a5a9d627c022bf2f01deb712e88c6c58e0e292"
  "6f8f60c9a823ac328c1d70db36486adf5268bd8d2cb2d5acd6058254b67b40e4cfa2806d01da679ac092d9ca6b7688f6435415c12e05e6afe207fb8e1b6a622e"
)

prepare() {
  cd "${srcdir}"

  chmod +x "${_filename}"

  # Extract relevant files in AppImage
  "./${_filename}" --appimage-extract "usr/share/icons" > /dev/null
  "./${_filename}" --appimage-extract "${_squashfs_desktop_file}" > /dev/null

  # Patch the .desktop file
  patch -Np0 < ./freecad_link.desktop.patch

  # Rename icons
  find "squashfs-root/usr/share/icons" -type f -not -name 'freecad_link.*' -delete
  find "squashfs-root/usr/share/icons" -type d -empty -delete
  find "squashfs-root/usr/share/icons" -type f -name "freecad_link.svg" -execdir mv {} "${pkgname}.svg" \;
  find "squashfs-root/usr/share/icons" -type f -name "freecad_link.png" -execdir mv {} "${pkgname}.png" \;
}

package() {
  # Copy AppImage file
  install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"

  # Make AppImage available as freecad-asm3 in PATH
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "${_install_path}" "${pkgdir}/usr/bin/freecad-asm3"

  # Copy Desktop entry
  install -Dm644 "${srcdir}/squashfs-root/freecad_link.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Copy icons
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Copy license file
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}