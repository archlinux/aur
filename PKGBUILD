# Maintainer: Rasmus Moorats <xx+aur@nns.ee>
# Contributor: freb

pkgname=burpsuite-pro-earlyadopter
pkgver=2023.3.3
pkgrel=1
pkgdesc="An integrated platform for performing security testing of web applications (professional edition) (early adopter)"
url="https://portswigger.net/burp/"
depends=('java-runtime>=17', 'hicolor-icon-theme')
makedepends=('zip')
arch=('any')
license=('custom')
noextract=("${pkgname}-${pkgver}-orig.jar")
source=("${pkgname}-${pkgver}-orig.jar::https://portswigger.net/burp/releases/download?product=pro&version=${pkgver}&type=Jar"
  ${pkgname}.desktop
  splash.png
  icon16.png
  icon24.png
  icon32.png
  icon48.png
  icon128.png
  icon256.png
  icon512.png
  icon.svg)
sha256sums=('039ff9e0d50d811c4c882c7431851b6676506d8c43c4228a1587929bb0e1f193'
            'dabd0e917c65245aeab77f251481cdc77ac04bb756f757bb477d3969b12a75c5'
            'be5226ff91b37f6102e143a1b8cf54c41ea66b2da6cff2d5df660b3b1a411c86'
            'ff0b230af06fb76af053090ac021bf45b88341d746e67f6bb9e94ba40957d9d8'
            'a6791fcaee558f6744b4f5a3fc0af2c9ad7ce244033e224c4e4464563ac9b911'
            '48d529f2a045b1179d9cd87ffdeb7fd469d963f7606fd22b7edc665d0515e1d2'
            '2b2407b8ab2ee181bfd64e3ba3e3090a328cbef8f53cce20ba76cffbfb3bc1d1'
            '28d17763c17e010936ad8ed44427d9ce6523510f580aefce52eb7c0f26b48045'
            'da6469f32b0acfcad2057cf0920c128bbbf64bc72ec6a4d5e5ba10d5b8a2d859'
            '6bbfd022aa451efeb439a89527b814ae06f7ce6196f7ad8db276e9ad372a7e32'
            '8777077ed5b1809c8adde4c056a315f8ec8f1b79f4c4c0e60eb3582c4d7ab71d')

prepare() {
  cd ${srcdir}
  cp ${pkgname}-${pkgver}-orig.jar ${pkgname}-${pkgver}.jar
  # remove useless chromium versions
  zip -d ${pkgname}-${pkgver}.jar 'chromium-macosx*.zip' 'chromium-win*.zip'
}

package() {
  cd ${srcdir}
  install -Dm644 ${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}.jar
  install -Dm644 ${pkgname}.desktop -t ${pkgdir}/usr/share/applications/
  install -Dm644 splash.png ${pkgdir}/usr/share/pixmaps/${pkgname}-splash.png

  # install icons
  for size in {16,24,32,48,128,256,512}; do
    install -Dm644 icon${size}.png ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/burpsuite-pro-earlyadopter.png
  done
  install -Dm644 icon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/burpsuite-pro-earlyadopter.svg

  # create startup file for burpsuite-pro-earlyadopter.
  mkdir -m755 ${pkgdir}/usr/bin
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
  echo "exec \"\$JAVA_HOME/bin/java\" \"-splash:/usr/share/pixmaps/${pkgname}-splash.png\" \"--add-opens\" \"java.base/java.lang=ALL-UNNAMED\" \"--add-opens\" \"java.base/javax.crypto=ALL-UNNAMED\" \"--add-opens\" \"java.desktop/javax.swing=ALL-UNNAMED\" \"-jar\" \"/usr/share/${pkgname}/${pkgname}.jar\" \"\$@\"" >> ${pkgdir}/usr/bin/${pkgname}
  chmod 755 ${pkgdir}/usr/bin/${pkgname}
}
