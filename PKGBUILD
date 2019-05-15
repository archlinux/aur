# Maintainer: David Runge <dave@sleepmap.de>
pkgname=easytranscript
pkgver=2.51.2
pkgrel=1
pkgdesc="Easy to use transcription-software with a high feature volume"
arch=('i686' 'x86_64')
url="http://e-werkzeug.eu/index.php/en/products/easytranscript"
license=('Apache' 'CCPL' 'GPL3' 'LGPL2.1')
depends=('java-openjfx' 'java-commons-logging' 'java-commons-io' 'vlc')
makedepends=('java-environment-openjdk=8' 'unzip')
makedepends=('unzip')
source=("${pkgname}-${pkgver}.zip::https://www.e-werkzeug.eu/software/easytranscript/versions/${pkgver}/${pkgname}.zip"
  "${pkgname}.desktop"
  "${pkgname}")
noextract=("${pkgname}-${pkgver}.zip")
sha512sums=('45f967f740972c6978f2f05844ae679e4430c36d67e70e0a366dec7c58147c23282a23a0806660f421729e15d68350f8b908b6f4e871ffa2e5990a3d3ec08da9'
            '210a9ef94a3d068e58392ff5d4aed85f4665d8fd614a6aa809ab7e7357b68b689788bf72da508650808e722f862f7c1b25c3f61babb15582b4ffc9593ae34a21'
            '0284a7505437bd68c484f307ee674716e6d955b8e2e8eba391f596bc4535e5a804d13274de968fd6c154f4e1728a4a54d665e6f204135bc5c8e386233b4f25bd')

build() {
  mkdir -vp "${pkgname}-${pkgver}"
  unzip "${pkgname}-${pkgver}.zip" -d "${pkgname}-${pkgver}"
}

package() {
  # TODO: replace beansbinding and commons-collection (which doesn't build)
  local libs=('AbsoluteLayout' 'beansbinding' 'commons-collections'
  'commons-net' 'commons-vfs' 'dom4j' 'jdom' 'jintellitype' 'jna' 'JXGrabKey'
  'mail' 'platform' 'poi' 'vlcj' 'xmlbeans')
  cd "${pkgname}-${pkgver}"
  install -vDm 644 "README (Troubleshooting Linux).txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm 644 easysysteminspector.jar \
    -t "${pkgdir}/usr/share/java/${pkgname}"
  install -vDm 644 "${pkgname}.jar" \
    -t "${pkgdir}/usr/share/java/${pkgname}"
  install -vDm 644 updater.jar \
    -t "${pkgdir}/usr/share/java/${pkgname}"
  for library in "${libs[@]}"; do
    install -vDm 644 "lib/${library}"*.jar \
      -t "$pkgdir/usr/share/java/${pkgname}/lib/"
  done
  install -vDm 755 lib/libJXGrabKey.so "${pkgdir}/usr/share/java/${pkgname}/lib/"
  install -vDm 644 logo.ico "${pkgdir}/usr/share/icons/${pkgname}.ico"
  install -vDm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm 644 "${srcdir}/${pkgname}.desktop" \
    -t "${pkgdir}/usr/share/applications"
}
