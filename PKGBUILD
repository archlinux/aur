# Maintainer: Agustin Cisneros <agustincc@tutanota.com>

pkgname=ticktick
pkgver=1.0.40
pkgrel=1
pkgdesc='Official desktop application for Linux'
arch=('x86_64')
url='https://ticktick.com/about/download'
license=('custom')
conflicts=('ticktick-nativefier')
depends=('alsa-lib' 'gtk3' 'nss')
source=("${pkgname}-${pkgver}.deb::https://appest-public.s3.amazonaws.com/download/linux/linux_deb_x64/${pkgname}-${pkgver}-amd64.deb"
        'LICENSE')
sha256sums=('f5696d44bec38a6498a8cee068435cecea95ba88abebea62d8ac6c92025d0748'
            '2d866fcb749c30d931fa96cc1578869b3fa9fc61a5c5f30e0316ddb00abb5814')

package() {
  cd "${srcdir}"

  tar -xf data.tar.xz -C "${pkgdir}"
  gunzip "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz"

  # Use symlink to run the program
  sed -i 's/^Exec=.*/Exec=ticktick %U/' "${pkgdir}/usr/share/applications/ticktick.desktop"

  mkdir -p "${pkgdir}/usr/lib" "${pkgdir}/usr/bin/"
  mv "${pkgdir}/opt/TickTick" "${pkgdir}/usr/lib/${pkgname}"
  rmdir "${pkgdir}/opt"
  ln -srf "${pkgdir}/usr/lib/${pkgname}/ticktick" "${pkgdir}/usr/bin/ticktick"

  # Install license from https://ticktick.com/about/tos
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Included licenses in .deb
  mv "${pkgdir}/usr/lib/${pkgname}/LICENSE.electron.txt" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  mv "${pkgdir}/usr/lib/${pkgname}/LICENSES.chromium.html" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
