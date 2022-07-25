# Maintainer: Joseph Ryan <josephryan3.14@gmail.com>
pkgname=eggnogg
pkgver=1.0
pkgrel=1
pkgdesc="Classic version of sword fighting arcade game"
arch=('any')
url="https://madgarden.itch.io/eggnogg"
license=('custom')
makedepends=('tar' 'curl' 'gendesk')
depends=('lib32-libglvnd' 'lib32-sdl_mixer')
source=('http://madgarden.net/junkz/madgarden/eggnogg/icon-1.png')
md5sums=('a6eb8862c233b3a85a70ada0f8542edc')
_name='EGGNOGG'
_categories='Game;ArcadeGame'

prepare() {
    gendesk -n -f ${startdir}/PKGBUILD
}

build() {
  cd ${srcdir}/
  game_url=$(curl -s -XPOST "https://madgarden.itch.io/eggnogg/file/908?after_download_lightbox=true" | grep -Po '"url":.*?[^\\]",' | cut -c8- | rev | cut -c3- | rev | sed 's/\\\//\//g')
  curl -o eggnogg-linux.tar.gz ${game_url}
  tar xzf eggnogg-linux.tar.gz
}

package() {
  cd ${srcdir}/eggnogg-linux

  mkdir -p ${pkgdir}/usr/share/games/${pkgname}
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/64x64/apps/
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cp ${srcdir}/icon-1.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png
  cp -a eggnogg data README.txt ${pkgdir}/usr/share/games/${pkgname}/
  # The game needs to be launched from the data parent directory and it needs write access to this folder
  echo -e "#!/bin/sh\ncd /usr/share/games/${pkgname}\n./eggnogg" > ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}
}
