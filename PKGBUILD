# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=neeto-vue-bin
_pkgname=${pkgname%-bin}
_filename=Neeto-Vue
pkgver=0.0.22
pkgrel=1
pkgdesc="Yet another wiznote client Made with Vue."
arch=('x86_64')
url="https://github.com/TankNee/Neeto-Vue"
license=('MIT')
depends=('electron9')
makedepends=("icoutils")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.zip::https://github.com/TankNee/Neeto-Vue/releases/download/v${pkgver}/${_filename}-linux-x64.zip"
        "${_pkgname}.sh"
        "https://raw.githubusercontent.com/TankNee/Neeto-Vue/master/LICENSE"
        "${_pkgname}.ico::https://raw.githubusercontent.com/TankNee/Neeto-Vue/master/public/favicon.ico"
        "${_pkgname}.desktop")
sha256sums=('6ee9fd6c3a9c4790490d6069e45c6fe7ab54c81709f41d4af237bab212e6d1a8'
            'cb8b0fc5bf6548c87143f7eed0317031f5154bf0bc2f461648201e79e1858501'
            '09141f28d3723a64b16c54cbecd3b239301c879fc2f229dd70528cf75878b812'
            '5b0cb7c05b15b187d1b9383091267f8294a5161fbe6fc9509b2283a51378183e'
            '7868ad5caf58b07d081d5983ed5592b401886ac9f7eac57761b1001345d473b0')

prepare() {
  # extract ico to png
  mkdir -p ${srcdir}/icons
  icotool -x ${_pkgname}.ico -o ${srcdir}/icons
}

package() {
  cd ${_filename}-linux-x64

  # app.asar
  install -Dm644 resources/app.asar -t ${pkgdir}/usr/lib/${_pkgname}

  # script wrapper
  install -Dm755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_filename}

  # icons
  for size in 256 128 96 72 64 48 32 24 16
  do
    install -Dm644 ${srcdir}/icons/*${size}x${size}*.png "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done
  
  # desktop entry
  install -Dm644 ${srcdir}/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications/

  # LISENSE
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim: set sw=2 ts=2 et:
