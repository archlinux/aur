# Maintainer: Agustin Cisneros <agustincc@tutanota.com>
pkgname=ticktick
pkgver=1.0.11
pkgrel=1
pkgdesc='Official desktop application for the to-do & task management cloud service.'
arch=('x86_64')
url='https://ticktick.com'
license=('custom')
depends=(
  'alsa-lib'
  'gtk3'
  'nss'
  'libxtst'
  'xdg-utils'
)
conflicts=('ticktick-nativefier')
source=("${pkgname}-${pkgver}.deb::https://appest-public.s3.amazonaws.com/download/linux/linux_deb_x64/${pkgname}-${pkgver}-amd64.deb"
        'LICENSE')
sha256sums=('04fa5b48213719fdb79eaa5515908ff2a1b37f0233ae44cc96530919ef2827b2'
            '2d866fcb749c30d931fa96cc1578869b3fa9fc61a5c5f30e0316ddb00abb5814')

package() {
  cd "${srcdir}"

  tar -xf data.tar.xz -C "${pkgdir}"
  gunzip "${pkgdir}/usr/share/doc/ticktick/changelog.gz"

  # Use symlink to run the program
  sed -i 's/^Exec=.*/Exec=ticktick %U/' "${pkgdir}/usr/share/applications/ticktick.desktop"

  mv "${pkgdir}/opt/TickTick" "${pkgdir}/opt/ticktick"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -sf "/opt/ticktick/ticktick" "${pkgdir}/usr/bin/ticktick"

  # Install license from https://ticktick.com/about/tos
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Included licenses in .deb
  mv "${pkgdir}/opt/ticktick/LICENSE.electron.txt" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  mv "${pkgdir}/opt/ticktick/LICENSES.chromium.html" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
