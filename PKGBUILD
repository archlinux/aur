# Maintainer: Jove Yu <yushijun110@126.com>
# Contribuor: luosoy <249799588@qq.com>
pkgname=com.qq.weixin.deepin
_appname=WeChat
_pkgname="Deepin-${_appname}"
pkgver=3.9.5.80deepin10
pkgrel=1
pkgdesc="Deepin Wine WeChat"
arch=('x86_64')
url="http://pc.weixin.qq.com/"
_imdevurl="https://deepin-wine.i-m.dev/"
license=('Proprietary')
depends=(
  'deepin-wine6-stable>=6.0.0.58'
  'deepin-wine-helper'
)
conflicts=(
  'deepin-wine-wechat'
  'com.qq.weixin.spark'
)
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.deb::https://community-store-packages.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}_i386.deb"
  "libldap24.tar.gz"
  "${pkgname}.install"
  "${pkgname}.sh"
)
sha256sums=('2967aad7806e0c72980aa9e1880ddf82ab793b322fd9af83ff54d477ac4fdb81'
            'af3327e55951d901c3bca2851f933e643ce71be3270715c2d01993a6acf0675b'
            '9fc08b3f39ab99a3335449f6ea69aff4bb67d8b4dd2b243009738369af544201'
            'ba600b75b6754bd5a82d9d8dd0ba727f997135662fff37521470fb3c690bdec8')
package() {
  sed "s|@bottlename@|${_pkgname}|g" -i "${srcdir}/${pkgname}.install"
  sed -e "s|@bottlename@|${_pkgname}|g" \
      -e "s|@appver@|${pkgver}|g" \
      -e "s|@appname@|${_appname}|g" \
      -e "s|@pkgname@|${pkgname}|g" \
      -i "${srcdir}/${pkgname}.sh"
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  sed "s|\"/opt/apps/${pkgname}/files/run.sh\"|${pkgname}|g" -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/libldap24/"* -t "${pkgdir}/opt/apps/${pkgname}/files/lib"
  install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/48x48/apps/${pkgname}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}