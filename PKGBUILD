# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=treehole-ocr
_pkgname=tools-ocr
_hutool_ver=5.3.3
pkgver=1.2.2
pkgrel=2
pkgdesc="A Cross-Platform OCR Tool"
arch=(any)
url="https://github.com/AnyListen/${_pkgname}"
license=('GPL3')
makedepends=('imagemagick' 'java-environment-openjdk=8')
depends=('java8-openjfx')
source=(
  "https://github.com/AnyListen/${_pkgname}/archive/V${pkgver}.tar.gz"
  "https://github.com/kwhat/jnativehook/releases/download/2.1.0/jnativehook-2.1.0.zip"
  "https://repo1.maven.org/maven2/org/imgscalr/imgscalr-lib/4.2/imgscalr-lib-4.2.jar"
  "https://repo1.maven.org/maven2/cn/hutool/hutool-all/${_hutool_ver}/hutool-all-${_hutool_ver}.jar"
  ${pkgname}.desktop
)
noextract=("hutool-all-${_hutool_ver}.jar" "imgscalr-lib-4.2.jar")

build() {
  PATH=/usr/lib/jvm/java-8-openjdk/bin:$PATH
  
  cd "${srcdir}/${_pkgname}-${pkgver}"
echo "Manifest-Version: 1.0
Main-Class: com.luooqi.ocr.MainFm
Class-Path: lib/jnativehook-2.1.0.jar lib/hutool-all-${_hutool_ver}.jar lib/imgscalr-lib-4.2.jar" > MANIFEST.MF
  
  mkdir lib
  cp -f "${srcdir}/imgscalr-lib-4.2.jar" lib/
  mv -f "${srcdir}/jnativehook/jar/jnativehook-2.1.0.jar" lib/
  cp -f "${srcdir}/hutool-all-${_hutool_ver}.jar" lib/
  mkdir bin png
  find ./src/main/java -name "*.java" | xargs \
    javac -d bin -classpath "lib/hutool-all-${_hutool_ver}.jar:lib/imgscalr-lib-4.2.jar:lib/jnativehook-2.1.0.jar"
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
sha256sums=('bb0eb0b3b5b52870e97b9cc635d313ddefa3505e8066b95a03d6e422a42aee17'
            '753c9b72e79f0b7fd389ebf6aa834f359b9f6ed6475e25a0d931baa141643ee6'
            '6f128a71c5e87a16f810513a73ad3c77d0ee0bb622ee0ce1ead115bccbc76d0a'
            'b1a079317cdb6c496955ed41c48afa3695ab664d004c2e2e0850e4180c749da4'
            '897410c55bbb0ae04c25b21522e4abde8430332dc09cf9e130057e9351f2eb8e')
