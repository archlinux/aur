# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=treehole-ocr
_pkgname=tools-ocr
pkgver=1.2.0
pkgrel=1
pkgdesc="A Cross-Platform OCR Tool"
arch=(any)
url="https://github.com/AnyListen/${_pkgname}"
license=('GPL3')
makedepends=('ant' 'imagemagick' 'java-runtime-openjdk=8')
depends=('java-openjfx' 'java-runtime=8')
source=(
  "https://github.com/AnyListen/${_pkgname}/archive/V${pkgver}.tar.gz"
  "https://github.com/kwhat/jnativehook/releases/download/2.1.0/jnativehook-2.1.0.zip"
  "https://github.com/rkalla/imgscalr/archive/4.2-release.tar.gz"
  "https://repo1.maven.org/maven2/cn/hutool/hutool-all/4.5.5/hutool-all-4.5.5.jar"
  ${pkgname}.desktop
)
noextract=('hutool-all-4.5.5.jar')

build() {
  PATH=/usr/lib/jvm/java-8-openjdk/bin:$PATH
  
  cd "${srcdir}/imgscalr-4.2-release"
  ant
  
  cd "${srcdir}/${_pkgname}-${pkgver}"
echo 'Manifest-Version: 1.0
Main-Class: com.luooqi.ocr.MainFm
Class-Path: lib/jnativehook-2.1.0.jar lib/hutool-all-4.5.5.jar lib/imgscalr-lib-4.2.jar' > MANIFEST.MF
  
  mkdir lib
  mv -f "${srcdir}/imgscalr-4.2-release/dist/imgscalr-lib-4.2.jar" lib/
  mv -f "${srcdir}/jnativehook/jar/jnativehook-2.1.0.jar" lib/
  cp -f "${srcdir}/hutool-all-4.5.5.jar" lib/
  mkdir bin png
  find ./src/main/java -name "*.java" | xargs \
    javac -d bin -classpath "lib/hutool-all-4.5.5.jar:lib/imgscalr-lib-4.2.jar:lib/jnativehook-2.1.0.jar"
  jar -cfm ${pkgname}.jar MANIFEST.MF -C bin . -C src/main/resources .
  cp src/main/resources/img/logo.png 128x128.png
  convert -resize 50% 128x128.png 64x64.png
  convert -resize 37.8% 128x128.png 48x48.png
  convert -resize 25% 128x128.png 32x32.png
  convert -resize 18.75% 128x128.png 24x24.png
  convert -resize 12.5% 128x128.png 16x16.png
}

package() {
  install -D ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for png in *.png; do
    install -D ./${png} "${pkgdir}/usr/share/icons/hicolor/${png%.*}/apps/${pkgname}.png"
  done
  
  install -D "./${pkgname}.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
  cp -r "./lib" "${pkgdir}/usr/share/${pkgname}/lib"
  
  install -d "${pkgdir}/usr/bin"
  echo "#!/bin/bash
PATH=/usr/lib/jvm/java-8-openjdk/bin:\$PATH
java -jar /usr/share/${pkgname}/${pkgname}.jar
" > "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
sha256sums=('a29d1fd12c6e5d25255fc64457b04b1bcb549dfe6518843a0cc079e6d992948f'
            '753c9b72e79f0b7fd389ebf6aa834f359b9f6ed6475e25a0d931baa141643ee6'
            'ccb27d21f8566f17323a845595bb6d52a2c8024dfc7ebd7005161ceacd9d5144'
            '69dc385ae41a76b30bd393626cff5c783cae8a7ece950d098f697af44460f795'
            'e73acb90b81056b7ee576dc1226ae08e00fc44d9b1e7e7f68085a1d8c8b044c0')
