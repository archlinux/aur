# Maintainer: Jove Yu <yushijun110@126.com>
# Contribuor: luosoy <249799588@qq.com>
pkgname=com.qq.weixin.deepin
_appname=WeChat
_pkgname="Deepin-${_appname}"
pkgver=3.9.7deepin9
pkgrel=2
pkgdesc="Deepin Wine WeChat"
arch=('x86_64')
url="http://pc.weixin.qq.com/"
_imdevurl="https://deepin-wine.i-m.dev/"
license=('LicenseRef-Proprietary')
conflicts=(
  'deepin-wine-wechat'
  'com.qq.weixin.spark'
)
depends=(
  'deepin-wine8-stable'
  'deepin-wine-helper'
  'hicolor-icon-theme'
  'xdg-utils'
  'libldap24'
  'wqy-microhei'
)
makedepends=(
  'p7zip'
)
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.deb::https://community-store-packages.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}_amd64.deb"
  "LICENSE.html"
  "${pkgname}.sh"
)
sha256sums=('ca3ea9f9e78e74dc09104f629a4215323e83226145dc8c3a1a75dd967bccf8db'
            'ad20820e5436c46685d4c3c2dadfb7eccf04ecbc9a6e2fb563370cc8901d4d3f'
            '12d50f3612f2e94f741506bef96d5789ff01a0d6d93c5f215bedb8d9f7a7bb4f')
build() {
  sed -e "s|@bottlename@|${_pkgname}|g" \
      -e "s|@appver@|${pkgver}|g" \
      -e "s|@appname@|${_appname}|g" \
      -e "s|@pkgname@|${pkgname}|g" \
      -i "${srcdir}/${pkgname}.sh"
  bsdtar -xf "${srcdir}/data."*
  install -Dm755 -d "${srcdir}/tmp"
  7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
  sed '753,756d' -i "${srcdir}/tmp/user.reg"
  7z u "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/user.reg"
  sed "s|\"/opt/apps/${pkgname}/files/run.sh\"|${pkgname}|g;s|=chat;|=Network;|g" -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
}
package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
  cp -r "${srcdir}/opt" "${pkgdir}"
  install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/48x48/apps/${pkgname}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}