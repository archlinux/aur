# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>

pkgname=freecad-assembly3-appimage
pkgver=2022.04.30
pkgrel=2
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
  "${_filename}::https://github.com/realthunder/FreeCAD/releases/download/2022.04.30-edge/FreeCAD-asm3-Stable-Conda-Py3-Qt5-20220430-glibc2.12-x86_64.AppImage"
  "https://raw.githubusercontent.com/realthunder/FreeCAD/2022.04.30-edge/LICENSE"
  "freecad_link.desktop.patch"
  "appimagetool::https://github.com/AppImage/AppImageKit/releases/download/13/appimagetool-x86_64.AppImage"
)
sha512sums=(
  "47b4e9e3a37170edfc26889ec2540ab1901885ba7d1524ed72e4b498a65341ecbca4dd58fdc07f49e5479c1a7dbd083f46ea0036433097e400d1460a258a2e42"
  "4d1b0998dc55adcfb2ac2f33382bce6467078aaa33dbd3bedf5c2102da853d4186836ad4103ea6100f34068751a5a9d627c022bf2f01deb712e88c6c58e0e292"
  "6a47efb5fb429829b31a322620b90fbd36b9def22479aa7fefbce20a51373720140c28b6aadae4c630bcf1629d6ca9099fceb2444e88954d0e5b53a9f612e233"
  "9225a5df355c4520c5430fc1946f60322c99de36f3446aa17ee8f14af68665bb5b1d2b918079606448e821d93c1dca5b5fbad9ff4ea3f33963181ad2f97b5d67"
)

prepare() {
  cd "${srcdir}"

  chmod +x "${_filename}"

  # We need to patch the AppImage at the moment, otherwise it won't launch.
  # See https://github.com/FreeCAD/FreeCAD-Bundle/issues/102
  # We keep this part well separated to ensure it'll be easy to remove as soon
  # as it is fixed upstream.
  chmod +x ./appimagetool
  "./${_filename}" --appimage-extract > /dev/null
  rm "./squashfs-root/usr/lib/libstdc++.so.6" "${_filename}"
  env -u SOURCE_DATE_EPOCH ./appimagetool squashfs-root "${_filename}"
  rm -Rf squashfs-root

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