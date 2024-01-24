# Maintainer: Jove Yu <yushijun110@126.com>
# Contribuor: luosoy <249799588@qq.com>
pkgname=com.qq.weixin.deepin
_appname=WeChat
_pkgname="Deepin-${_appname}"
pkgver=3.9.7deepin9
pkgrel=1
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
  'lib32-gnutls'
  'wqy-microhei'
)
makedepends=(
  'p7zip'
)
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.deb::https://community-store-packages.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}_amd64.deb"
  "${pkgname}.install"
  "${pkgname}.sh"
)
sha256sums=('ca3ea9f9e78e74dc09104f629a4215323e83226145dc8c3a1a75dd967bccf8db'
            '9fc08b3f39ab99a3335449f6ea69aff4bb67d8b4dd2b243009738369af544201'
            'c52d5eaae06ac64a1adbf28997cb1c03845c26fc7344755440fa1443b127fcd9')
build() {
  sed "s|@bottlename@|${_pkgname}|g" -i "${srcdir}/${pkgname}.install"
  sed -e "s|@bottlename@|${_pkgname}|g" \
      -e "s|@appver@|${pkgver}|g" \
      -e "s|@appname@|${_appname}|g" \
      -e "s|@pkgname@|${pkgname}|g" \
      -i "${srcdir}/${pkgname}.sh"
  bsdtar -xf "${srcdir}/data.tar.xz"
  install -Dm755 -d "${srcdir}/tmp"
  7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
  sed '753,756d' -i "${srcdir}/tmp/user.reg"
  7z u "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/user.reg"
  sed "s|\"/opt/apps/${pkgname}/files/run.sh\"|${pkgname}|g;s|=chat;|=Network;|g" -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
}
package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
  cp -r "${srcdir}/opt" "${pkgdir}"
  install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/48x48/apps/${pkgname}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}