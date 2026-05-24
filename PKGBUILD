#AUR package maintainer: L1oly, Cogfly creator: Nix-main on Github
pkgname=cogfly-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="A cross-platform mod manager for Hollow Knight: Silksong."
arch=(x86_64)
url="https://github.com/Nix-main/Cogfly"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme' 'zenity')
makedepends=('sed')
conflicts=('cogfly','cogfly-git')
options=(!strip)

_appimage=("Cogfly-${pkgver}.AppImage")
source=("${_appimage}::https://github.com/Nix-main/Cogfly/releases/download/${pkgver}/${_appimage}")
sha256sums=('a32506dcbe03a0af33efdae7bec8f08051284a8debcd0c2f960e3d97278b0aa8')

prepare() {
  cd "${srcdir}"
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract > /dev/null
  sed -i 's/^Exec=Cogfly$/Exec=cogfly/' squashfs-root/Cogfly.desktop
  sed -i 's/^Icon=icon$/Icon=cogfly/g' squashfs-root/Cogfly.desktop

}

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/* "${pkgdir}/opt/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/cogfly"

  install -Dm644 squashfs-root/Cogfly.desktop \
    "${pkgdir}/usr/share/applications/cogfly.desktop"
  install -Dm644 squashfs-root/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/cogfly.png"
}
