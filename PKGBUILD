# Maintainer: Will Price <will.price94@gmail.com>

# Inspired by https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=jetbrains-toolbox
# and https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=hyper-appimage

pkgname=gingko
pkgver=2.0.11
pkgrel=1
pkgdesc='Manage all your JetBrains Projects and Tools'
arch=('x86_64' 'i686')
url='https://gingko.io/'
license=('Commercial')
depends=()
options=('!strip')
source=("https://github.com/gingko/client/releases/download/v${pkgver}/gingko-client-${pkgver}-x86_64.AppImage"
        "gingko.desktop")
sha512sums=('e3f9508579892d1c71f34b132c5f66990d8b2660c081e9dbd61f5ec3e5919ea9f248451b3bf8d7764273522b3a22682907f7cb88ea73aab8866be03bb8dfe778'
            'c11e9c2541211d0ff43d4ff26fd23f6c64d8bb8008bddbbe174a420a69cc981120c3c5466e47894515fee0dbaccd95309eb61a16ffc3b3193af0609e62b46820')

prepare() {
    chmod +x "${srcdir}/gingko-client-${pkgver}-x86_64.AppImage"
    "${srcdir}/gingko-client-${pkgver}-x86_64.AppImage" --appimage-extract
}

package() {
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/opt/${pkgname}"
  cp -Rr "${srcdir}/squashfs-root/app/"* "${pkgdir}/opt/${pkgname}"

  install -d -m755 "${pkgdir}/usr/share/icons/hicolor"
  cp -Rr "${srcdir}/squashfs-root/usr/share/icons/hicolor/" \
         "${pkgdir}/usr/share/icons/"

  install -D -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  ln -s "/opt/${pkgname}/gingko-client" "${pkgdir}/usr/bin/${pkgname}"

  # fix file permissions - all files as 644 - directories as 755
  # by default directories come out as 700
  find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
  find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;
  chmod +x "${pkgdir}/opt/${pkgname}/gingko-client"
}
