# Maintainer: freb

pkgname=burpsuite-pro
pkgver=2023.4.2
pkgrel=1
pkgdesc="An integrated platform for performing security testing of web applications (professional edition)"
url="https://portswigger.net/burp/"
depends=('java-runtime>=9')
makedepends=('zip')
arch=('any')
license=('custom')
noextract=("${pkgname}-${pkgver}.jar")
source=("${pkgname}-${pkgver}.jar::https://portswigger.net/burp/releases/download?product=pro&version=${pkgver}&type=Jar"
        burpsuite-pro.desktop
        icon128.png
        splash.png)
install=burpsuite-pro.install
sha256sums=(
  '3841a3b7e8e19c44bb239a4a3fe585425b932c5c48dfd032528d8a5f296615fc' # jar
  '740a01fd3feacee5b0563edc4c6634219d367bf2590ecfc954959a95354506c8' # burpsuite-pro.desktop
  'f9b8bedbab02c8f0e03b2f5e3f99fa003c58d767168c3c4aa135233b3b533d4b' # icon128.png
  '3aaa84dd4c3d31a88cd065b8445d164737c7fad4fb56833fb994de0bf6dbe3be' # splash.png
)

prepare() {
  cd ${srcdir}
  # remove useless chromium versions
  zip -d ${pkgname}-${pkgver}.jar 'chromium-macosx*.zip' 'chromium-win*.zip'
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{applications,pixmaps,${pkgname}}

  cd ${srcdir}
  install -m644 ${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}.jar
  install -m644 burpsuite-pro.desktop ${pkgdir}/usr/share/applications/
  install -m644 icon128.png ${pkgdir}/usr/share/pixmaps/burpsuite-pro.png
  install -m644 splash.png ${pkgdir}/usr/share/pixmaps/burpsuite-pro-splash.png

  # Create startup file for burpsuite-pro.
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
  echo "exec \"\$JAVA_HOME/bin/java\" \"-splash:/usr/share/pixmaps/burpsuite-pro-splash.png\" \"--add-opens\" \"java.base/java.lang=ALL-UNNAMED\" \"--add-opens\" \"java.base/javax.crypto=ALL-UNNAMED\" \"--add-opens\" \"java.desktop/javax.swing=ALL-UNNAMED\" \"--illegal-access=permit\" \"-jar\" \"/usr/share/${pkgname}/${pkgname}.jar\" \"\$@\"" >> ${pkgdir}/usr/bin/${pkgname}
  chmod 755 ${pkgdir}/usr/bin/${pkgname}
}
