# Maintainer: Agustin Cisneros <agustincc@tutanota.com>
pkgname=ticktick
pkgver=0.0.5
pkgrel=1
pkgdesc='Official desktop application for the to-do & task management cloud service.'
arch=('x86_64')
url='https://ticktick.com'
license=('BSD-2-Clause' 'custom')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'libappindicator-gtk3'
  'libsecret'
)
provides=('ticktick')
conflicts=('ticktick-nativefier')
source=("${pkgname}-${pkgver}.deb::https://appest-public.s3.amazonaws.com/download/linux/linux_deb_x64/${pkgname}-${pkgver}-amd64.deb"
        'LICENSE')
sha256sums=('bb84fcce2ffa35d4c087fdb03e71cd772d1d6a5a255d65d8d988ce5affc67cce'
            '2d866fcb749c30d931fa96cc1578869b3fa9fc61a5c5f30e0316ddb00abb5814')

package() {
  cd "${srcdir}"

  tar -xf data.tar.xz -C "${pkgdir}"
  gunzip "${pkgdir}/usr/share/doc/ticktick/changelog.gz"

  # Use symlink to run the program
  sed -i 's/^Exec=.*/Exec=ticktick %U/' "${pkgdir}/usr/share/applications/ticktick.desktop"

  mv "${pkgdir}/opt/TickTick" "${pkgdir}/opt/ticktick"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -sf "${pkgdir}/opt/ticktick/ticktick" "${pkgdir}/usr/bin/ticktick"

  # Install license (https://ticktick.com/about/tos)
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Included licenses in .deb
  mv "${pkgdir}/opt/ticktick/LICENSE.electron.txt" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  mv "${pkgdir}/opt/ticktick/LICENSES.chromium.html" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
