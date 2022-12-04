# Maintainer: sukanka <su975853527 at gmail dot com>

_pkgname=BookxNotePro
pkgname=${_pkgname,,}-bin
_rev=1086
pkgver=2.0.0.${_rev}
pkgrel=1
pkgdesc="Proprietary  ${_flang} dictionary software for linux"
arch=('x86_64')
url="Electronic notebook"
license=('unknown')
provides=("${_pkgname,,}")
depends=('qt5-base' 'qt5-speech')
makedepends=('patchelf')
source=("${_pkgname}-${pkgver}.deb::http://www.bookxnote.com/setup/${_pkgname}_ubuntu_amd64-${_rev}.deb"
"${_pkgname}.sh"
)
sha512sums=('e53dc40acc130d8cb6df2bc064d73ffeac0d19465f5482f0d2deb8935cc2f646a7fe2220153cd49e3f33ca0eb5b2b3bd1b76d98bc42b56db519a60fa00c0a87c'
            '0b605046f657ddc9b3c566c022e702ca81bb5cc58aba3fd71d0ae73ce22af1cbc60fbaac6949a09b81fa6ee5f2a2818579a07798e2a92be2f03a1c0e52fcd924')


prepare() {
  cd ${srcdir}
  mkdir -p build
  tar -xf data.tar.xz -C build
  cd build/usr/share/applications
  sed -i "s|^Exec=.*|Exec=${_pkgname} %u|g" ${_pkgname}.desktop
  sed -i "s|^Icon=.*|Icon=${_pkgname}|g" ${_pkgname}.desktop
  cd ${srcdir}/build/usr/local/${_pkgname}
  chmod a+r lang/zh_cn.xml
  patchelf --remove-rpath ${_pkgname}
}

package() {
  cd ${srcdir}/build/usr
  install -Dm644 share/applications/*.desktop  -t ${pkgdir}/usr/share/applications/
  install -Dm644 local/${_pkgname}/bxn_pro_logo.png  ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png
  install -d ${pkgdir}/usr/lib/${_pkgname}
  cp -pvrf local/${_pkgname}/{lang,theme,${_pkgname}} ${pkgdir}/usr/lib/${_pkgname}
  install -Dm755 ${srcdir}/${_pkgname}.sh  ${pkgdir}/usr/bin/${_pkgname}
}
# vim: ts=2 sw=2 et:
