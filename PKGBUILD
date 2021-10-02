# Mantainer: MCMic <come@chilliet.eu>

pkgname=hammer-dongers
pkgver=0.55
pkgrel=1
pkgdesc="Up to 4 player party game with destroyable terrain!"
arch=('x86_64')
url="https://cravecraw.itch.io/hammer-dongers"
license=('nonfree')
makedepends=('unzip' 'curl' 'gendesk')
depends=()
source=()
md5sums=()
_name='Hammer Dongers'
_categories='Game;ActionGame'

prepare() {
  gendesk -n -f ../PKGBUILD
}

build() {
  cd ${srcdir}/
  # https://cravecraw.itch.io/hammer-dongers/data.json
  game_url=$(curl -s -XPOST "https://cravecraw.itch.io/hammer-dongers/file/4119554?after_download_lightbox=true" | grep -Po '"url":.*?[^\\]",' | cut -c8- | rev |cut -c3- | rev | sed 's/\\\//\//g')
  curl -o ${pkgname}-linux.zip ${game_url}
  unzip -o ${pkgname}-linux.zip
}

package() {
  cd "${srcdir}/${_name} Linux - ${pkgver}"

  mkdir -p ${pkgdir}/usr/share/games/${pkgname}
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/64x64/apps/
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cp "${pkgname}-${pkgver}_Data/Resources/UnityPlayer.png" ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png
  cp -a . ${pkgdir}/usr/share/games/${pkgname}
  chmod +x "${pkgdir}/usr/share/games/${pkgname}/${pkgname}-${pkgver}.x86_64"
  # The game needs to be launched from the data parent directory and it needs write access to this folder
  echo -e "#!/bin/sh\ncd /usr/share/games/${pkgname}\n./\"${pkgname}-${pkgver}.x86_64\"" > ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}
}
