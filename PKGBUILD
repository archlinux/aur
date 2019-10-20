# Maintainer: Will Price <will.price94@gmail.com>

# Inspired by https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=jetbrains-toolbox
# and https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=hyper-appimage

pkgname=gingko
pkgver=2.4.3
pkgrel=1
pkgdesc='Gingko is a new kind of tool, that lets you shape your ideas with lists, outlines and cards, all in the same clean interface.'
arch=('x86_64' 'i686')
url='https://gingko.io/'
license=('Commercial')
depends=()
options=('!strip')
source=("https://github.com/gingko/client/releases/download/v${pkgver}/Gingko-${pkgver}.AppImage"
        "gingko.desktop")
sha512sums=(
    'dc3e97f009517d7828db1a0c53a276e5c185c32d4e0e30df965810d5a5b18ec9656b4422f2872c7567e0a308431dc9e2c56bd75f0f2e021b9d8bb37c9f52c677'
    'c11e9c2541211d0ff43d4ff26fd23f6c64d8bb8008bddbbe174a420a69cc981120c3c5466e47894515fee0dbaccd95309eb61a16ffc3b3193af0609e62b46820'
)

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
