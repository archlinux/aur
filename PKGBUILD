# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=signal
pkgver=0.37.0
pkgrel=1
license=('GPL3')
pkgdesc='Signal Private Messenger for the Desktop'
depends=('nwjs-bin')
makedepends=('npm' 'ruby-sass')
arch=("i686" "x86_64")
url='https://whispersystems.org'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WhisperSystems/Signal-Desktop/archive/v${pkgver}.tar.gz"
	"signal.desktop")
sha512sums=('8376a11700bb0deae1a98082009d05abd4d5d0fba15f6939292631a0637835fd6ce91ef6b3159eae5496c1c13e1ebe1a0c37ad9e224d74d4ac4953c4e24b3602'
	    'cd52561a5dcac27a5b6bbffc328c1e0d3e1479f8ebf58eaa45b8fe1c1c2d633e0d6023bfcfc2966d8964705a7b8aa59b7d03e5d315e426483bbd2cb66052e455')

build() {
  cd "Signal-Desktop-${pkgver}"
  npm install
  node_modules/grunt-cli/bin/grunt -f
}

package() {
  cd "Signal-Desktop-${pkgver}/dist"

  install -Ddm755 "${pkgdir}/usr/lib/${pkgname}"
  install -Ddm755 "${pkgdir}/usr/bin"

  cp -r * "${pkgdir}/usr/lib/${pkgname}/"

  install -dm755 "${pkgdir}"/usr/share/icons/hicolor/256x256/apps
  cp images/icon_256.png \
      "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${pkgname}.png

  install -Dm644 "${srcdir}"/${pkgname}.desktop \
      "${pkgdir}"/usr/share/applications/${pkgname}.desktop

  echo -e "#!/bin/bash\n/usr/bin/nw /usr/lib/signal" > "${pkgdir}/usr/bin/signal"
  chmod +x "${pkgdir}/usr/bin/signal"
}
