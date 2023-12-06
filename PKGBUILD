# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Alex Talker <alextalker at openmailbox dot org>
# Contributor: Simonas Racinas <racinas at icloud.com>
# Contributor: Rein Fernhout <me@levitati.ng>
pkgname=visual-paradigm-community
pkgver=17.1.20231111
pkgverminor=`echo $pkgver| sed 's/\(\.[^.]*\)\..*/\1/'`
pkgrel=1
pkgdesc="UML design application"
url='http://www.visual-paradigm.com/download/community.jsp'
arch=('x86_64')
depends=('java-environment-common' 'java-runtime-common' 'jdk11-openjdk')
install=visual-paradigm-community.install
license=('custom')

# Possible values: ca1 usa10 usa11 usa13 usa14 uk3 uk5 germany4 germany5 germany6 france3
_server=germany4
_version="${pkgver//./_}"
# https://eu6.visual-paradigm.com/visual-paradigm/vpce14.2/20180101/Visual_Paradigm_CE_14_2_20180101_Linux64.sh
source=("https://www.visual-paradigm.com/downloads/${_server}/vpce/Visual_Paradigm_CE_Linux64_InstallFree.tar.gz"
  'visual-paradigm-community.install'
  'visual-paradigm.desktop'
  'visual-paradigm.png'
  'LICENSE.txt'
  'x-visual-paradigm.xml')

sha256sums=('191e170466d21a1f2cf2eaa3324cb3121071cc7ad83df324c4d5f98bcad774b3'
            '52d244345f2ce8080d2b20c8c75b3ef833dfe9c5d605cac7129013b087bf2806'
            '5cdc0f50573d805938172c1f35664aa264fc5964fd92daed09b467565a6347b1'
            '41517b5c2326c0ba2fe3b6647f9594f094ccf03185cf73cb87d6cf19b355ff15'
            'cd30460cb1c29f9f42723197dbe72b2537aaed09cc2d44dcb3e6868fb5dbf12b'
            'a3b898bc9c43cf54baa1c643c619ee172a8103cd15031d574380ca463eb1ec1c')

prepare() {
  cd ${srcdir}/Visual_Paradigm_CE_${pkgverminor}/Application/bin
  sed -i 's|# INSTALL4J_JAVA_HOME_OVERRIDE=|INSTALL4J_JAVA_HOME_OVERRIDE=/usr/lib/jvm/java-11-openjdk|' Visual_Paradigm
  sed -i 's|app_home=../../|app_home=/usr/share/visual-paradigm-community|' Visual_Paradigm
}

package() {
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/Application"
  cp -r "${srcdir}/Visual_Paradigm_CE_${pkgverminor}/Application/" "${pkgdir}/usr/share/${pkgname}/"
  cp -r "${srcdir}/Visual_Paradigm_CE_${pkgverminor}/.install4j/" "${pkgdir}/usr/share/${pkgname}/.install4j/"
  cp "visual-paradigm.desktop" "${pkgdir}/usr/share/applications/visual-paradigm.desktop"
  cp "visual-paradigm.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/visual-paradigm.png"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sr "${pkgdir}/usr/share/${pkgname}/Application/bin/Visual_Paradigm" "${pkgdir}/usr/bin/${pkgname}"
  mkdir -p ${pkgdir}/usr/share/mime/packages
  cp "x-visual-paradigm.xml" "${pkgdir}/usr/share/mime/packages/x-visual-paradigm.xml"
}
