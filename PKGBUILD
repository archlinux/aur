# Maintainer:     Jaja <jaja@mailbox.org>
# Co-maintainer:  alisoftware <admin@situsali.com>
#

pkgname=jsignpdf
pkgver=1.6.4
pkgrel=1
pkgdesc="Digital sign PDF files with X.509 certificates."
arch=('any')
url="http://jsignpdf.sourceforge.net/"
license=('LGPL' 'MPL')
depends=('java-runtime>=8')
provides=('jsignpdf')
source=("https://downloads.sourceforge.net/project/jsignpdf/stable/JSignPdf%20${pkgver}/JSignPdf-${pkgver}.zip"
  "jsignpdf.sh"
  "jsignpdf.png"
  "jsignpdf.desktop")
md5sums=('a459876cba8e2d30abcf9baaf16ff986'
         '84b680dbdc61784f05d94a66a012c51d'
         '8ea58c7a94f615d15a5f736a9e0b100d'
         '8a242f0bc9cfda5f77f53f644d44000b')

package() {
  mkdir -p ${pkgdir}/usr/share/java/jsignpdf/
  cd ${srcdir}/${pkgname}-${pkgver}
  cp -R * ${pkgdir}/usr/share/java/jsignpdf/
  find ${pkgdir}/usr/share/java/jsignpdf/* -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr/share/java/jsignpdf/* -type d -exec chmod 755 {} \;
  chown -R root.root ${pkgdir}/usr/share/java/jsignpdf/* || return 1
  # The executable script
  mkdir -p ${pkgdir}/usr/bin/
  install -Dm755 ${srcdir}/jsignpdf.sh \
  ${pkgdir}/usr/bin/jsignpdf || return 1
  # Force Java 8
  # sed -i 's@exec java@exec /usr/lib/jvm/java-8-openjdk/jre/bin/java@' \
  # ${pkgdir}/usr/bin/jsignpdf
  # .icon and .desktop files
  install -Dm644 ${srcdir}/jsignpdf.png \
  ${pkgdir}/usr/share/icons/hicolor/scalable/apps/jsignpdf.png || return 1
  install -Dm644 ${srcdir}/jsignpdf.desktop \
  ${pkgdir}/usr/share/applications/jsignpdf.desktop || return 1
  # Docs and License
  mkdir -p ${pkgdir}/usr/share/docs/${pkgname}
  mkdir -p ${pkgdir}/usr/share/license/${pkgname}
  cp ${pkgdir}/usr/share/java/jsignpdf/docs/ChangeLog.txt ${pkgdir}/usr/share/docs/${pkgname}/
  cp ${pkgdir}/usr/share/java/jsignpdf/docs/JSignPdf.pdf ${pkgdir}/usr/share/docs/${pkgname}/
  cp ${pkgdir}/usr/share/java/jsignpdf/docs/JSignPdf_signed.pdf ${pkgdir}/usr/share/docs/${pkgname}/
  cp ${pkgdir}/usr/share/java/jsignpdf/docs/ReleaseNotes.txt ${pkgdir}/usr/share/docs/${pkgname}/
  cp ${pkgdir}/usr/share/java/jsignpdf/docs/lgpl-2.1.txt ${pkgdir}/usr/share/license/${pkgname}/
  cp ${pkgdir}/usr/share/java/jsignpdf/docs/MPL-1.1.txt ${pkgdir}/usr/share/license/${pkgname}/
  cp -R ${pkgdir}/usr/share/java/jsignpdf/docs/ThirdPartyLicenses/ ${pkgdir}/usr/share/license/${pkgname}/
  # Removing unneeded files
  rm -rf ${pkgdir}/usr/share/java/jsignpdf/docs/ || return 1
}
