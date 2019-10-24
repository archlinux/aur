# Maintainer: Will Price <will.price94@gmail.com>

# Inspired by https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=jetbrains-toolbox
# and https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=hyper-appimage

pkgname=gingko
pkgver=2.4.5
pkgrel=1
pkgdesc='Gingko is a new kind of tool, that lets you shape your ideas with lists, outlines and cards, all in the same clean interface.'
arch=('x86_64' 'i686')
url='https://gingko.io/'
license=('Commercial')
depends=()
options=('!strip')
source=("https://github.com/gingko/client/releases/download/v${pkgver}/Gingko-${pkgver}.AppImage"
        "gingko.desktop")
sha512sums=('2916f89f3fa9afba5b0b4e790e46c6740f05c8e74d5bbd0cf1fb28f1c34e6b013d865017f793b9d5f418c2154bf6694120d66c2b1f185fa16fa9a1879e40469e'
            'c11e9c2541211d0ff43d4ff26fd23f6c64d8bb8008bddbbe174a420a69cc981120c3c5466e47894515fee0dbaccd95309eb61a16ffc3b3193af0609e62b46820')

prepare() {
    chmod +x "${srcdir}/Gingko-${pkgver}.AppImage"
    "${srcdir}/Gingko-${pkgver}.AppImage" --appimage-extract
}

package() {
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/opt/${pkgname}"
  cp -Rr "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}"

  install -d -m755 "${pkgdir}/usr/share/icons/hicolor"
  cp -Rr "${srcdir}/squashfs-root/usr/share/icons/hicolor/" \
         "${pkgdir}/usr/share/icons/"

  install -D -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/${pkgname}"

  # fix file permissions - all files as 644 - directories as 755
  # by default directories come out as 700
  find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
  for exe in AppRun gingko-client; do
      chmod +x "${pkgdir}/opt/${pkgname}/$exe"
  done
}
