# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

_name=treehole
pkgname=$_name-ocr
_itemname=tools-ocr
pkgver=1.2.0
pkgrel=2
pkgdesc="A Cross-Platform OCR Tool"
arch=(any)
url="https://github.com/AnyListen/${_itemname}"
license=('GPL3')
makedepends=('imagemagick')
depends=('java-openjfx' 'java-runtime=8')
source=(
  "https://github.com/AnyListen/$_itemname/releases/download/V$pkgver/treehole-$pkgver.dmg"
  "https://github.com/AnyListen/$_itemname/raw/master/src/main/resources/img/logo.png"
  ${pkgname}.desktop
)
noextract=("treehole-$pkgver.dmg")

prepare() {
  7z x -y treehole-$pkgver.dmg
}

build() {
  mkdir -p "$srcdir/pngs"
  cd "$srcdir/pngs"
  cp ../logo.png 128x128.png
  convert -resize 50% 128x128.png 64x64.png
  convert -resize 37.8% 128x128.png 48x48.png
  convert -resize 25% 128x128.png 32x32.png
  convert -resize 18.75% 128x128.png 24x24.png
  convert -resize 12.5% 128x128.png 16x16.png
}

package() {
  install -d "${pkgdir}/usr/share/applications"
  sed 's/^Version=$/Version='$pkgver'/g' ${pkgname}.desktop > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  
  cd "$srcdir/pngs"
  for png in *.png; do
    install -D ./${png} "${pkgdir}/usr/share/icons/hicolor/${png%.*}/apps/${pkgname}.png"
  done
  
  install -d "${pkgdir}/usr/share/${pkgname}/lib"
  cp -r "$srcdir/treehole/treehole.app/Contents/Java/"* "${pkgdir}/usr/share/${pkgname}"
  
  install -d "${pkgdir}/usr/bin"
  echo "#!/bin/bash
PATH=/usr/lib/jvm/java-8-openjdk/bin:\$PATH
java -jar /usr/share/${pkgname}/$_name-$pkgver-jfx.jar
" > "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
sha256sums=('3d38b14b5b9dca801cab79f8eb483d512699b79adfad377bf6e200fb7c70b572'
            'd73ab0e0b7b6775d3346217d80324ce6d56fe567859be5744bb9810b3c176f7a'
            '36379443dba98f830f0bbe60bc79b6b4be8130e67bb10ac4faeadf6a1a4de7d5')


