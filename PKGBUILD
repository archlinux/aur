# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mindfulness-at-the-computer
pkgver=1.0.0.alpha.6
_pkgver=1.0.0-alpha.6
pkgrel=1
pkgdesc='Helps you stay mindful of your breathing while using your computer'
arch=('any')
url='https://mindfulness-at-the-computer.gitlab.io'
license=('GPL3')
install="${pkgname}.install"
depends=('python-pyqt5'
         'python-sip')
makedepends=('python-setuptools' 'gendesk' 'imagemagick')
source=("${pkgname}-${_pkgver}.tar.gz::https://gitlab.com/mindfulness-at-the-computer/mindfulness-at-the-computer/-/archive/v${_pkgver}/mindfulness-at-the-computer-v${_pkgver}.tar.gz")
sha256sums=('f41778e6f3d73b057e76903878b17e4e2345343a06a90ac19f54da0dce5d27a3')

prepare() {
  cd "${pkgname}-v${_pkgver}"
  sed -i "s|==|>=|" setup.py
  rm -rf varia
  rm CONTRIBUTING.md LICENSE.txt
}

package() {
  install -d "${pkgdir}/opt/" "${pkgdir}/usr/bin"
  cp -aR "${pkgname}-v${_pkgver}" "${pkgdir}/opt/${pkgname}"
  echo "#!/usr/bin/env bash
  cd /opt/${pkgname}/
  ./mindfulness-at-the-computer.py" > ${pkgname}.sh 
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  convert -verbose "${pkgname}-v${_pkgver}/icons/icon.ico" ${pkgname}.png
  install -Dm644 ${pkgname}.png -t "${pkgdir}/usr/share/pixmaps"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Mindfulness at the Computer" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgname}-v${_pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  #Unsecure permission work around
  chmod 007 "${pkgdir}/opt/mindfulness-at-the-computer/user_files/"
  chmod 007 "${pkgdir}/opt/mindfulness-at-the-computer"
}
# vim:set ts=2 sw=2 et: