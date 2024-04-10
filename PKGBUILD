# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>

pkgname=freecad-assembly3-appimage
pkgver=2024.04.07
pkgrel=2
pkgdesc="Assembly3 workbench for FreeCAD."
arch=('x86_64')
url="https://github.com/realthunder/FreeCAD"
license=('LGPLv2')
depends=('fuse2')
# prevent AppImage from being truncated
options=(
  '!strip'
  '!debug'
)

_filename="FreeCAD-asm3-${pkgver}.AppImage"
_squashfs_desktop_file="org.freecadweb.FreeCAD.Link.desktop"
_appimage_name="FreeCAD-asm3.AppImage"
_install_path="/opt/appimages/${_appimage_name}"

noextract=("${_filename}")
source=(
  "${_filename}::https://github.com/realthunder/FreeCAD/releases/download/20240407stable/FreeCAD-Link-Stable-Linux-x86_64-py3.11-20240407.AppImage"
  "https://raw.githubusercontent.com/realthunder/FreeCAD/20240407stable/LICENSE"
  "freecad_link.desktop.patch"
)
sha512sums=(
  "17d8478f493ef294abcc6cf6039fe5f8f95899e758bf0090ca3e89599de4a809aa02cc9c48c954901174d3bd07e75781f8b622260e18fec4158e9b5faa5d9d1f"
  "4d1b0998dc55adcfb2ac2f33382bce6467078aaa33dbd3bedf5c2102da853d4186836ad4103ea6100f34068751a5a9d627c022bf2f01deb712e88c6c58e0e292"
  "d7683d92271e9127b7bb0a0a5869caa8d8f8b17aa6426f342a48798568ae9ce8f10a454abf894ca53bd7440f0fc3085650eaa4b4128be525b8a62120360abced"
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
  find "squashfs-root/usr/share/icons" -type f -not -name 'org.freecadweb.FreeCAD.Link.*' -delete
  find "squashfs-root/usr/share/icons" -type d -empty -delete
  find "squashfs-root/usr/share/icons" -type f -name "org.freecadweb.FreeCAD.Link.svg" -execdir mv {} "${pkgname}.svg" \;
  find "squashfs-root/usr/share/icons" -type f -name "org.freecadweb.FreeCAD.Link.png" -execdir mv {} "${pkgname}.png" \;
}

package() {
  # Copy AppImage file
  install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"

  # Make AppImage available as freecad-asm3 in PATH
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "${_install_path}" "${pkgdir}/usr/bin/freecad-asm3"

  # Copy Desktop entry
  install -Dm644 "${srcdir}/squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Copy icons
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Copy license file
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}