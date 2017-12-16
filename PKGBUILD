# Mantainer: MCMic <come@chilliet.eu>

pkgname=wyrmsun
pkgver=3.1.0
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
md5sums=('d30b9698a47e8c62a1ba7fb54568a6ab'
         '917f6ed1fa4c4c1b918f50c6ef8c30d3'
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
