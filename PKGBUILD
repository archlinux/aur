# Maintainer: Janek Thomaschewski <janek[at]artos-hosting[dot]de>
# Contributor: Axel Navarro <navarroaxel[at]gmail[dot]com>
# Contributor: Testuser_01 <arch[at]nico-siebler[dot]de>
# Contributor: Pablo Vilas <pablovilas89[at]gmail[dot]com>

pkgbase=webstorm-eap
pkgname=(webstorm-eap webstorm-eap-jre)
_pkgname=WebStorm
pkgver=253.29346.143
_pkgver=2025.3.1
pkgrel=1
pkgdesc="JavaScript IDE and HTML editor. Early Access Program."
arch=('x86_64')
options=('!strip')
url="http://www.jetbrains.com/webstorm"
license=('custom')

source=(https://download.jetbrains.com/webstorm/${_pkgname}-${_pkgver}.tar.gz
        jetbrains-webstorm-eap.desktop
        ${_pkgname}_license.txt)

sha512sums=('66dacc1e2fc1a702a1c3920fabee2f28719dfc93484f9a9d1f0c6167995508d835ebd2e88bec2bdaf35f3b89f68a123e1d7533ccbbcba985e639cc00157348dc'
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
