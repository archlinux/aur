# Maintainer: Janek Thomaschewski <janek[at]artos-hosting[dot]de>
# Contributor: Axel Navarro <navarroaxel[at]gmail[dot]com>
# Contributor: Testuser_01 <arch[at]nico-siebler[dot]de>
# Contributor: Pablo Vilas <pablovilas89[at]gmail[dot]com>

pkgbase=webstorm-eap
pkgname=(webstorm-eap webstorm-eap-jre)
_pkgname=WebStorm
pkgver=231.8770.31
_pkgver=2023.1.1
pkgrel=1
pkgdesc="JavaScript IDE and HTML editor. Early Access Program."
arch=('x86_64')
options=('!strip')
url="http://www.jetbrains.com/webstorm"
license=('custom')

source=(https://download.jetbrains.com/webstorm/${_pkgname}-${pkgver}.tar.gz
        jetbrains-webstorm-eap.desktop
        ${_pkgname}_license.txt)

sha256sums=('ba2e98c6032fd4594deaae9830f62a621f8a7cdd521a7d5e51377357c8bf37f9'
            'e8d1be7f980b7d371ef5aa65f2375397d970e887659bf3b280601cced8498e32'
            '8464fc766dbb4f6a0de4acd84007fc2916b50ca48ce7d22654144f549c8c6f4c')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  rm Install-Linux-tar.txt
  rm help/ReferenceCardForMac.pdf
}

package_webstorm-eap() {
  optdepends=('webstorm-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if webstorm-eap-jre is not installed')

  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp --recursive ${srcdir}/${_pkgname}-${pkgver}/* "${pkgdir}/opt/${pkgname}"
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${startdir}/jetbrains-${pkgname}.desktop" "${pkgdir}/usr/share/applications"
  install -m 644 "${pkgdir}/opt/${pkgname}/bin/webstorm.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -m 644 "${startdir}/${_pkgname}_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/${_pkgname}_license.txt"

  ln -s "/opt/${pkgname}/bin/webstorm.sh" "${pkgdir}/usr/bin/${pkgname}"
}

package_webstorm-eap-jre() {
  pkgdesc="JBR (JetBrains Runtime) for WebStorm EAP - a patched JRE"
  url='https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime'

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}/${_pkgname}-${pkgver}/jbr" "${pkgdir}/opt/${pkgbase}"
}
