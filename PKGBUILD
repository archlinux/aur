# Maintainer: Vasu Bhatia <aur at vbh dot ai>

pkgname=filen-desktop-appimage-bin
pkgver=3.0.47
pkgrel=1
pkgdesc="Filen.io Desktop Client - Zero knowledge end-to-end encrypted cloud storage"
arch=('x86_64')
url="https://filen.io/"
license=('MIT')
conflicts=()
depends=(fuse2)
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  "https://github.com/FilenCloudDienste/filen-desktop/releases/download/v${pkgver}/Filen_linux_${arch[0]}.AppImage"
  filen-desktop.desktop.patch
  filen-desktop.sh
)
sha512sums=('b6f67d999f0a11a885bf5a5e2008321253f520093ecd03b75472dabc3dc2fd02a94a41dc00f84b57b2e69e371a97dbaaf1b12ec8e8ace9e10c5695af90ccba52'
            '742825bb01b1674af349bc772ffefdbe61fb1301ef1f0a1f37fbce56b8463ad565088e1ea07bf07f37b50382055b1ad0777494f397fe4d53b68ba1e92fa702ec'
            '9d24075d297be466fcb2d7dead6b856b6336daf7f2dbd6fb123201a775a384d986044a2d74d47efbe3435fc1b9d165a6e5a3290ef2cfacec195b8e942ad8bdcb')

_name="filen-desktop"
_filename="./${_name}.AppImage"

prepare() {
  cd "${srcdir}"
  mv "./Filen_linux_${arch[0]}.AppImage" "${_filename}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract >/dev/null 2>&1
  patch -Np0 < "./${_name}.desktop.patch"
}


package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_name}.AppImage"
  install -Dm755 "${srcdir}/${_name}.sh" "${pkgdir}/usr/bin/${_name}"

  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${srcdir}/squashfs-root/@filendesktop.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
}
