# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=neeto-vue-bin
_pkgname=${pkgname%-bin}
_filename=Neeto-Vue
pkgver=1.0.1
pkgrel=1
pkgdesc="Yet another wiznote client Made with Vue."
arch=('x86_64')
url="https://github.com/TankNee/Neeto-Vue"
license=('MIT')
depends=('electron9')
makedepends=("icoutils"
             "asar")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# strip takes too long time, so skip it.
options=('!strip')
source=("${_pkgname}-${pkgver}.zip::https://github.com/TankNee/Neeto-Vue/releases/download/v${pkgver}/${_filename}-linux-x64.zip"
        "https://raw.githubusercontent.com/TankNee/Neeto-Vue/master/LICENSE"
        "${_pkgname}.sh"
        "${_pkgname}.ico::https://raw.githubusercontent.com/TankNee/Neeto-Vue/master/public/icon.ico"
        "${_pkgname}.desktop")
sha256sums=('a4190ad079a2abd8303cfaadc02b23a4a006ca1fa8181c24461208b23fe7c8da'
            '09141f28d3723a64b16c54cbecd3b239301c879fc2f229dd70528cf75878b812'
            '778fefd87355aa3ce977e510f236bfe25b9873eb6f86d4b34f5e5c8ddcdf93f9'
            'dd95ba9191a5a1c02ac830eb2f5f1dd3bafcfc6897f8b9a2fef7e919294608e6'
            '7868ad5caf58b07d081d5983ed5592b401886ac9f7eac57761b1001345d473b0')

prepare() {
  # extract ico to png
  mkdir -p ${srcdir}/icons
  index=0
  for size in 64 32 24 16
  do
    convert ${_pkgname}.ico[${index}] -thumbnail ${size}x${size} -flatten ${srcdir}/icons/${_pkgname}-${size}x${size}.png
    let ++index
  done
}

package() {
  cd ${_filename}-linux-x64

  # extract app.asar
  asar extract resources/app.asar ${pkgdir}/usr/lib/${_pkgname}

  # script wrapper
  install -Dm755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_filename}

  # icons
  for size in 64 32 24 16
  do
    install -Dm644 ${srcdir}/icons/*${size}x${size}*.png "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done
  
  # desktop entry
  install -Dm644 ${srcdir}/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications/

  # LISENSE
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim: set sw=2 ts=2 et:
