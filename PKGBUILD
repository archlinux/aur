# Mantainer: MCMic <come@chilliet.eu>

pkgname=wyrmsun
pkgver=2.3.0
pkgrel=1
pkgdesc="Real-time strategy game based on history, mythology and fiction"
arch=('i686' 'x86_64')
url="http://andrettin.github.io/"
license=('GPL' 'CC-BY-SA')
depends=('sdl' 'tolua++')
makedepends=('cmake' 'gendesk')
source=("wyrmsun-${pkgver}.tar.gz::https://github.com/Andrettin/Wyrmsun/archive/v${pkgver}.tar.gz" 
        "wyrmgus-${pkgver}.tar.gz::https://github.com/Andrettin/Wyrmgus/archive/v${pkgver}.tar.gz"
        "oaml-1.0.tar.gz::https://github.com/marcelofg55/oaml/archive/v1.0.tar.gz")
md5sums=('cf01ded12043350d599dfff8c38ec8d7'
         '478e41d0432ca94258f4df03bf3a041e'
         '97019b32af9a809d812a457a97ed1344')
_name='Wyrmsun'
_categories='Game;StrategyGame'

prepare() {
  gendesk -n -f ../PKGBUILD
  cp -a ${srcdir}/oaml-1.0/* ${srcdir}/Wyrmgus-${pkgver}/src/oaml/
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
