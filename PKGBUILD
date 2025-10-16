# Maintainer: Fethbita <aur AT fethbita DOT com>
# Former maintainer: Adrien Jussak <adrien.jussak@wascardev.com>
# Former maintainer: Prem Buczkowski <prem@prem.moe>
# Former maintainer: Rein Fernhout <me@levitati.ng>

pkgname=visual-paradigm
_pkgver_major=17.3
_pkgver_minor=20250943
pkgver=${_pkgver_major}.${_pkgver_minor}
pkgrel=2
pkgdesc="UML design application (Free 30-day trial)"
url='https://www.visual-paradigm.com/download/'
arch=('x86_64')
depends=('java-environment-common' 'java-runtime-common' 'jdk11-openjdk')
license=('custom')

source=("https://eu8.dl.visual-paradigm.com/visual-paradigm/vpce${_pkgver_major}/${_pkgver_minor}/Visual_Paradigm_CE_${pkgver//./_}_Linux64_InstallFree.tar.gz"
  'visual-paradigm.desktop'
  'visual-paradigm.png'
  'LICENSE.txt'
  'x-visual-paradigm.xml')

sha256sums=('1172b89482e3e55eed345d4db375410263099c3d986845afa5acdd30fcb951c3'
            'f59e20eeeae9f03c95edff2f0d0302db872221fb7a5493ca736077f1d7bab7df'
            '41517b5c2326c0ba2fe3b6647f9594f094ccf03185cf73cb87d6cf19b355ff15'
            'd2201888fc79de759b34c2d4c16610151b9fb2eae00990fe729a8588ec1e1727'
            'a3b898bc9c43cf54baa1c643c619ee172a8103cd15031d574380ca463eb1ec1c')

prepare() {
  cd ${srcdir}/Visual_Paradigm_CE_${_pkgver_major}/Application/bin
  sed -i 's|# INSTALL4J_JAVA_HOME_OVERRIDE=|INSTALL4J_JAVA_HOME_OVERRIDE=/usr/lib/jvm/java-11-openjdk|' Visual_Paradigm
  sed -i 's|app_home=../../|app_home=/usr/share/visual-paradigm|' Visual_Paradigm
  cd ${srcdir}/Visual_Paradigm_CE_${_pkgver_major}/Application/scripts
  sed -i 's|JAVA="../jre/bin/java"|JAVA="/usr/lib/jvm/java-11-openjdk/bin/java"|' *.sh
}

package() {
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/Application"
  cp -r "${srcdir}/Visual_Paradigm_CE_${_pkgver_major}/Application/" "${pkgdir}/usr/share/${pkgname}/"
  cp -r "${srcdir}/Visual_Paradigm_CE_${_pkgver_major}/.install4j/" "${pkgdir}/usr/share/${pkgname}/.install4j/"
  install -Dm 644 "visual-paradigm.desktop" "${pkgdir}/usr/share/applications/visual-paradigm.desktop"
  install -Dm 644 "visual-paradigm.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/visual-paradigm.png"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sr "${pkgdir}/usr/share/${pkgname}/Application/bin/Visual_Paradigm" "${pkgdir}/usr/bin/${pkgname}"
  mkdir -p ${pkgdir}/usr/share/mime/packages
  install -Dm 644 "x-visual-paradigm.xml" "${pkgdir}/usr/share/mime/packages/x-visual-paradigm.xml"

  # Fix permissions
  cd "${pkgdir}/usr/share/${pkgname}/Application/scripts"
  chmod +x *.sh
}
