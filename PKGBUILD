# Mantainer: MCMic <come@chilliet.eu>

pkgname=wyrmsun
pkgver=1.9.9
pkgrel=1
pkgdesc="Real-time strategy game based on history, mythology and fiction"
arch=('i686' 'x86_64')
url="http://www.indiedb.com/games/wyrmsun"
license=('GPL' 'CC-BY-SA')
depends=('sdl')
makedepends=('cmake' 'gendesk' 'tolua++')
source=("wyrmsun-${pkgver}.tar.gz::https://github.com/Andrettin/Wyrmsun/archive/v${pkgver}.tar.gz" 
        "wyrmgus-${pkgver}.tar.gz::https://github.com/Andrettin/Wyrmgus/archive/v${pkgver}.tar.gz")
md5sums=('4378095bbd62a97b8cc7b7e97e949265'
         '562ccdce2881eeb46fa4e076dd322933')
_name='Wyrmsun'
_categories='Game;StrategyGame'

prepare() {
  gendesk -n -f ../PKGBUILD
}

build() {
  cd ${srcdir}/Wyrmgus-${pkgver}
  cmake -DENABLE_USEGAMEDIR=OFF
  make
}

package() {
  cd ${srcdir}/
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/
  echo -e "#!/bin/sh\nexec /usr/bin/wyrmgus -d /usr/share/${pkgname}" > ${pkgdir}/usr/bin/${pkgname} 
  chmod +x ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m755 ${srcdir}/Wyrmgus-${pkgver}/stratagus ${pkgdir}/usr/bin/wyrmgus
  cd ${srcdir}/Wyrmsun-${pkgver}
  cp -a graphics maps music scripts sounds translations ${pkgdir}/usr/share/${pkgname}/
  cp graphics/ui/icons/wyrmsun_icon_128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png
}
