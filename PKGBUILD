# Maintainer: Alessandro Macilenti <p2tydw73n@mozmail.com>
# Taken from lagerfeuer's filen-desktop-appimage PKGBUILD

pkgname=filen-desktop-appimage-git
pkgver=1
pkgrel=latest
pkgdesc="Filen.io Desktop Client - Zero knowledge end-to-end encrypted cloud storage. Git version."
arch=('x86_64')
url="https://filen.io/"
license=('MIT')
conflicts=(filen-desktop-appimage)
depends=(fuse2)
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  "https://cdn.filen.io/desktop/release/filen_x86_64.AppImage"
  filen-desktop.desktop.patch
  filen-desktop.sh
)
sha512sums=('SKIP'
            'ebe6e5fd8569c6ce16eb3a880bac7a119c39d718f08632e750d6d6ce8aeac2c11fb070da4cb7941c1a096fd419885203af06ff5ecc0df8a42c4c98d25f7000b0'
            '9d24075d297be466fcb2d7dead6b856b6336daf7f2dbd6fb123201a775a384d986044a2d74d47efbe3435fc1b9d165a6e5a3290ef2cfacec195b8e942ad8bdcb'
)

_name="filen-desktop"
_filename="./${_name}.AppImage"

prepare() {
  cd "${srcdir}"
  mv "./filen_${arch[0]}.AppImage" "${_filename}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract >/dev/null 2>&1
  patch -Np0 < "./${_name}.desktop.patch"
}


package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_name}.AppImage"
  install -Dm755 "${srcdir}/${_name}.sh" "${pkgdir}/usr/bin/${_name}"

  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${srcdir}/squashfs-root/${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
}
