# Mantainer: MCMic <come@chilliet.eu>

pkgname=wyrmsun
pkgver=1.9.6
pkgrel=1
pkgdesc="Real-time strategy game based on history, mythology and fiction"
arch=('i686' 'x86_64')
url="http://www.indiedb.com/games/wyrmsun"
license=('GPL' 'CC-BY-SA')
depends=()
makedepends=('cmake' 'gendesk' 'sdl' 'tolua++')
source=("wyrmsun.tar.gz::https://github.com/Andrettin/Wyrmsun/archive/v${pkgver}.tar.gz" 
        "wyrmgus.tar.gz::https://github.com/Andrettin/Wyrmgus/archive/v${pkgver}.tar.gz")
md5sums=('5232b391f9d2142da566d5441996709e'
         '35c24d85e645032f33d6e97752910304')
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
  echo -e "#!/bin/sh\nexec /usr/bin/wyrmgus -d /usr/share/${pkgname}" > ${pkgdir}/usr/bin/${pkgname} 
  chmod +x ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m755 ${srcdir}/Wyrmgus-${pkgver}/stratagus ${pkgdir}/usr/bin/wyrmgus
  cd ${srcdir}/Wyrmsun-${pkgver}
  cp -a graphics maps music scripts sounds translations ${pkgdir}/usr/share/${pkgname}/
}
