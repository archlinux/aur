# Contributor: Tomas Kopecny aka Georgo10 <georgo10@gmail.com>
# Contributor: scorpfa
# Contributor: fi-dschi <fi-dschi_archlinux - at - arcor - dot - de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mucommander
pkgver=1.2.0
_pkgrel=1
pkgrel=1
pkgdesc="A lightweight, cross-platform file manager with a dual-pane interface written in Java"
url="http://www.mucommander.com"
depends=('java-runtime>=11' 'bash')
arch=('any')
license=('GPL')
install=${pkgname}.install
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}-${_pkgrel}/${pkgname}-${pkgver}-${_pkgrel}.tgz"
        "${pkgname}.png" "${pkgname}.desktop")
sha256sums=('3a5306cbf793e21fdbc30213b9875c9180fccf8ee781d80b883d00a897ea704f'
            '2595fd4f7299750b6762a9d978feebc1e8b375a54b722391e86c972963384f55'
            '96672efdbb19448736c0038a55ed82d1634380499f03293bd5900194301a482f')

prepare() {
  # Patching
  sed -e "s|MUCOMMANDER_JAR=\$CURRENT_DIR/mucommander.jar|MUCOMMANDER_JAR=/usr/share/mucommander/mucommander-${pkgver}.jar|" -i "${srcdir}"/mucommander.sh
  sed -e 's;java.library.path=/usr/local/lib;java.library.path=/usr/lib;' -i "${srcdir}"/mucommander.sh
}

package() {
  # Install jars
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}-${pkgver}.jar

  # budle
  cp -r bundle app ${pkgdir}/usr/share/${pkgname}

  # Install license
  install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt

  # Install icon
  install -Dm644 ${srcdir}/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

  # Install desktop file
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # Install run script
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/share/${pkgname}/${pkgname}.sh
  mkdir -m755 -p ${pkgdir}/usr/bin
  mkdir -m777 -p ${pkgdir}/usr/share/${pkgname}/felix-cache
  ln -sf /usr/share/${pkgname}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
