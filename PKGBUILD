# Maintainer: zoe <chp321 at gmail dot com>

pkgname=crochetcharts
PkgName=CrochetCharts
PkgName1="Crochet Charts"
pkgver=1.2.0
pkgrel=5
pkgdesc="Pattern design software for crochet charts"
url="http://stitchworkssoftware.com/"
arch=('x86_64')
license=('GPLv3')
makedepends=('tar')
depends=('qt4>=4.8')
install=${pkgname}.install
source=("https://github.com/StitchworksSoftware/${PkgName}/releases/download/${pkgver}/${PkgName}-${pkgver}-x86_64.deb")
md5sums=('663220d3d0e2b6a0b6de506039e40494')

build() {
  cd ${srcdir}
  tar xvf data.tar.gz
}

package() {
  cd ${srcdir}
  install -D -m755 usr/bin/${PkgName} ${pkgdir}/usr/bin/${pkgname}
  
  cd ${srcdir}/usr/share/applications/
  sed -i 's/CrochetCharts/crochetcharts/g' "${PkgName1}.desktop"
  sed -i 's|Icon=crochetcharts|Icon=/usr/share/icons/hicolor/64x64/apps/crochetcharts-64.png|' "${PkgName1}.desktop"
  install -D -m644 "${PkgName1}.desktop" ${pkgdir}/usr/share/applications/${pkgname}.desktop
  
  cd ${srcdir}/usr/share/  
  install -D -m644 -t ${pkgdir}/usr/share/mime/image/ ${PkgName}/vnd.stitchworks.pattern.xml
  install -D -m644 -t ${pkgdir}/usr/share/doc/${pkgname}/ ${PkgName}/CrochetCharts_User_Guide_1.2.0.pdf
  ## Crochet Charts impose la localisation de CrochetCharts_User_Guide_1.2.0.pdf pour la fonction help de l'appli :
  mkdir ${pkgdir}/usr/share/${PkgName}
  cp ${pkgdir}/usr/share/doc/${pkgname}/CrochetCharts_User_Guide_1.2.0.pdf ${pkgdir}/usr/share/${PkgName}/
  cp -R ${PkgName}/images/ ${pkgdir}/usr/share/doc/${pkgname}/
  
  
  ##---- Traitement des icônes ----##
  cd ${srcdir}/usr/share/${PkgName}/icons/
  
  for fichier in ${PkgName}-*.png
      do
          nb=${fichier%.*} ## enlève le suffixe .png
          nb=${nb#*-}      ## enlève le préfixe CrochetCharts-
          install -D -m644 ${fichier}    ${pkgdir}/usr/share/icons/hicolor/${nb}x${nb}/apps/${pkgname}-${nb}.png
      done
  
  for fichier in stitchworks-pattern-*.png
        do
            nb=${fichier%.*} ## enlève le suffixe .png
            nb=${nb#*-} ## enlève le préfixe stitchworks-
            nb=${nb#*-} ## enlève le préfixe pattern-
            install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/${nb}x${nb}/apps/ ${fichier}
        done
}
