# Mantainer: MCMic <come@chilliet.eu>

pkgname=witchblast
pkgver=0.7.5
pkgrel=3
pkgdesc="Roguelite dungeon crawler game"
arch=('i686' 'x86_64')
url="https://github.com/Cirrus-Minor/witchblast"
license=('GPL' 'CC-BY-NC-SA')
depends=('sfml')
makedepends=('cmake' 'gendesk' 'imagemagick')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Cirrus-Minor/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('edf276ebec886ba659916869d250032e')
_name='Witch Blast'
_categories='Game;ArcadeGame'

prepare() {
  gendesk -n -f ../PKGBUILD
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake .
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/share/games/${pkgname}
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/64x64/apps/
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  convert src/ressources/${pkgname}.ico ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png
  install -D -m755 Witch_Blast ${pkgdir}/usr/bin/Witch_Blast
  cp -a media data ${pkgdir}/usr/share/games/${pkgname}/
  # The game needs to be launched from the data parent directory and it needs write access to this folder
  echo -e "#!/bin/sh\ncd /usr/share/games/${pkgname}\n/usr/bin/Witch_Blast" > ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}
  chmod a+w ${pkgdir}/usr/share/games/${pkgname}/data
  chmod a+w ${pkgdir}/usr/share/games/${pkgname}/
}
