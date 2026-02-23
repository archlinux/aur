# Maintainer: Janek Thomaschewski <janek[at]artos-hosting[dot]de>
# Contributor: Axel Navarro <navarroaxel[at]gmail[dot]com>
# Contributor: Testuser_01 <arch[at]nico-siebler[dot]de>
# Contributor: Pablo Vilas <pablovilas89[at]gmail[dot]com>

pkgbase=webstorm-eap
pkgname=(webstorm-eap webstorm-eap-jre)
_pkgname=WebStorm
pkgver=261.21525.30
_pkgver=2026.1
pkgrel=1
pkgdesc="JavaScript IDE and HTML editor. Early Access Program."
arch=('x86_64')
options=('!strip')
url="http://www.jetbrains.com/webstorm"
license=('custom')

source=(https://download.jetbrains.com/webstorm/${_pkgname}-${pkgver}.tar.gz
        jetbrains-webstorm-eap.desktop
        ${_pkgname}_license.txt)

sha512sums=('21556e06cdc7ff27742603888bd016396b83f4916f34bc52075c4610fce2c7fe057dcad4dda22f1f92716fe670e56ddab67e3a565dbe6866aab63f86e861884b'
            'ec23fd12819b10e328e93d4f176b108c3e34ca12f19148d576541b6ea348f8e797a14294819b0714e9bbc5cc11e7485f534825aaa21dd6ba79740f071c391f15'
            '1f8d58d9ede3631e7cc78a73dfc1687b0b9f9c134e0142c31cb606d0f82835d81f1ede7afb7c55b266283660b6e23f58c3580b39e220cc43a00bb3a6dd2cf804')

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

  install -m 644 "jetbrains-${pkgname}.desktop" "${pkgdir}/usr/share/applications"
  install -m 644 "${pkgdir}/opt/${pkgname}/bin/webstorm.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -m 644 "${_pkgname}_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/${_pkgname}_license.txt"

  ln -s "/opt/${pkgname}/bin/webstorm" "${pkgdir}/usr/bin/${pkgname}"
}

package_webstorm-eap-jre() {
  pkgdesc="JBR (JetBrains Runtime) for WebStorm EAP - a patched JRE"
  url='https://github.com/JetBrains/JetBrainsRuntime'

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}/${_pkgname}-${pkgver}/jbr" "${pkgdir}/opt/${pkgbase}"
}
