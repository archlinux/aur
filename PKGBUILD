# Maintainer: Jose Marino <jose.marino <at> gmail <dot> com>
# NOTE (Jose): I have no idea how to properly build an electron application.
#              The easiest way I could figure out was to extract the binary
#              from the AppImage package.

pkgname=inboxer
pkgver=1.0.2
pkgrel=1
pkgdesc="Unofficial, free and open-source Google Inbox Desktop App"
arch=('x86_64')
url="https://denysdovhan.com/inboxer/"
license=('MIT')
depends=('nss>=3 gtk2')
makedepends=('')
checkdepends=()
optdepends=()
options=()
install=
source=("https://github.com/denysdovhan/inboxer/releases/download/v${pkgver}/inboxer-${pkgver}-x86_64.AppImage"
        "inboxer.sh")
sha256sums=('9a83ec32f222697786c19a3f51e7b4cbce307d413bf2f1eabf9e4aee3a3111d9'
            'ec740d8e9aa0ae6485a0ca44e5bbee959337ca414d40478d3e420abf22522544')
validpgpkeys=()

prepare() {
  chmod u+x inboxer-${pkgver}-x86_64.AppImage
  ./inboxer-${pkgver}-x86_64.AppImage --appimage-extract > /dev/null 2>&1
  # Set directory permissions to drwxr-xr-x
  find squashfs-root -type d -exec chmod 755 {} \;

  # fix .desktop file: executable and categories
  sed -i -e "s/Exec=.*/Exec=inboxer/" squashfs-root/inboxer.desktop
  sed -i -e "s/Categories=.*/Categories=Network;Email/" squashfs-root/inboxer.desktop
}

package() {
  install -D inboxer.sh -t "${pkgdir}/opt/${pkgname}/"
  install -Dm644 squashfs-root/inboxer.desktop -t "${pkgdir}/usr/share/applications/"
  cp -a --no-preserve=ownership squashfs-root/app/* "${pkgdir}/opt/${pkgname}/"
  cp -a --no-preserve=ownership squashfs-root/usr/lib "${pkgdir}/opt/${pkgname}/"
  cp -a --no-preserve=ownership squashfs-root/usr/share/icons "${pkgdir}/usr/share/"

  # modify installation folder in executable script
  sed -i -e "s_@FOLDER@_/opt/${pkgname}_" "${pkgdir}/opt/${pkgname}/inboxer.sh"

  # create executable link
  install -d "${pkgdir}/usr/bin/"
  ln -sf "/opt/${pkgname}/inboxer.sh" "${pkgdir}/usr/bin/inboxer"
}
