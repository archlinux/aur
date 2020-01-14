# Maintainer: Holger Döbler <holger.doebler@posteo.de>
pkgname=verapdf
pkgver=1.15.8
pkgrel=1
epoch=
pkgdesc="purpose-built, open source, file-format validator covering all PDF/A parts and conformance levels"
arch=('any')
url="https://verapdf.org/"
license=('GPL3' 'MPL2')
groups=()
depends=('java-runtime' 'bash')
makedepends=('unzip')
source=("https://software.verapdf.org/develop/1.15/${pkgname}-greenfield-${pkgver}-installer.zip"
        "$pkgname.png::https://avatars1.githubusercontent.com/u/9946925?s=280&v=4"
        "$pkgname.desktop"
        "auto-install.xml")
noextract=("${pkgname}-greenfield-${pkgver}-installer.zip" 'auto-install.sh')
md5sums=('c4f6f74a35db82391d0ee8bb85d2c457'
         '076b23717ab675281ed53dcf84471b89'
         '2aff225b781f8645123e8182ffeb295d'
         '312f8dc7e9c4a6ecfd25d75aff7b22c9')

prepare() {
  cd ${srcdir}
  unzip "${pkgname}-greenfield-${pkgver}-installer.zip"
  sed -e "s;/usr/share/verapdf;${pkgdir}/usr/share/${pkgname};" < auto-install.xml > ${pkgname}-greenfield-${pkgver}/auto-install.xml
}

package() {
  cd ${srcdir}/${pkgname}-greenfield-${pkgver}
  ./${pkgname}-install auto-install.xml
  rm ${pkgdir}/usr/share/verapdf/.installationinformation
  rm -r ${pkgdir}/usr/share/verapdf/Uninstaller
  mkdir -p ${pkgdir}/usr/bin
  for f in verapdf verapdf-gui ; do
    ln -s /usr/share/${pkgname}/$f ${pkgdir}/usr/bin/$f
  done
  install -Dm644 ${srcdir}/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -Dm644  ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
