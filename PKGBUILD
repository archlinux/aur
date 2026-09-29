# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=zano-appimage
pkgver=2.2.3.600
pkgrel=1
pkgdesc="Zano desktop wallet"
provides=('zano')
conflicts=('zano')
arch=('x86_64')
depends=('nss' 'nspr')
url="https://zano.org/"
options=(!strip)
_desktop_name=Zano.desktop
_build=98bbd72
_filename=zano-linux-x64-gui-release-v${pkgver}[${_build}].AppImage
source=(
  https://build.zano.org/builds/${_filename}
  ${_desktop_name}
  zano.sh
)
sha256sums=('aaaec9a168704203f7aa41c604d8bdcd8de1f385cf4d20c3ffafb285a4dca6b1'
            'e785a9f027e154168678354c7d8a04e302214e49fc24e20ab1c1fe0941d75cc0'
            '539ee35ef567352e435e88875fe6df5ad0197184021edaaf8989f018fa9a88cc')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x ${_filename}
  ./${_filename} --appimage-extract
  # Use system NSS/NSPR: the bundled copies are too old for the system libsoftokn3 NSS loads
  rm -f squashfs-root/usr/lib/{libnss3,libnssutil3,libsmime3,libnspr4,libplc4,libplds4}.so
}

package() {
  echo "Starting install"
  install -d "${pkgdir}"/opt
  cp -r squashfs-root "${pkgdir}"/opt/zano
  echo "Installing launcher script"
  install -Dm755 zano.sh "${pkgdir}"/usr/bin/zano
  echo "Installing desktop launcher"
  install -Dm644 ${_desktop_name} "${pkgdir}"/usr/share/applications/${_desktop_name}
  echo "Installing icon"
  install -Dm644 squashfs-root/Zano.svg ${pkgdir}/usr/share/pixmaps/Zano.svg
}
