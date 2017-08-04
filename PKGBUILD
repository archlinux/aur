# Mantainer: MCMic <come@chilliet.eu>

pkgname=eggnogg+
pkgver=20151221
pkgrel=2
pkgdesc="A competitive arcade game of immortals sword-fighting to the death"
arch=('i686' 'x86_64')
url="https://madgarden.itch.io/eggnogg"
license=('nonfree')
makedepends=('unzip' 'curl' 'gendesk')
depends=()
source=('http://madgarden.net/junkz/madgarden/eggnogg/icon-1.png')
md5sums=('a6eb8862c233b3a85a70ada0f8542edc')
_name='EGGNOGG+'
_categories='Game;ArcadeGame'

prepare() {
  gendesk -n -f ../PKGBUILD
}

build() {
  cd ${srcdir}/
  game_url=$(curl -s -XPOST "https://madgarden.itch.io/eggnogg/file/138869?after_download_lightbox=true" | grep -Po '"url":.*?[^\\]",' | cut -c8- | rev |cut -c3- | rev | sed 's/\\\//\//g')
  curl -o eggnoggplus-linux.zip ${game_url}
  unzip -o eggnoggplus-linux.zip
}

package() {
  cd ${srcdir}/eggnoggplus-linux

  mkdir -p ${pkgdir}/usr/share/games/${pkgname}
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/64x64/apps/
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cp ${srcdir}/icon-1.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png
  cp -a eggnoggplus data README.txt ${pkgdir}/usr/share/games/${pkgname}/
  # The game needs to be launched from the data parent directory and it needs write access to this folder
  echo -e "#!/bin/sh\ncd /usr/share/games/${pkgname}\n./eggnoggplus" > ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}
}
