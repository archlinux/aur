# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=signal
pkgver=0.33.0
pkgrel=2
license=('GPL3')
pkgdesc='Signal Private Messenger for the Desktop'
depends=('nwjs-bin')
makedepends=('npm' 'ruby-sass')
arch=("i686" "x86_64")
url='https://whispersystems.org'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WhisperSystems/Signal-Desktop/archive/v${pkgver}.tar.gz"
	"installer-window.patch")
sha512sums=('e453fbec30f300a14890843d907380f28cef6d56116a785e3a4ab9c7a342f5b3429cd77e5ba06cb8d6dfce366a267db227ddd053d70605ed3a60b9c98a9313ad'
	    'a6cdbd4758109df4e9f0c54e55eb93eb09903b092ff43d3f29e304cef2851826b7f798c0067fbaf2862a5cc5d0ffc9f91d8c08cf250a3d914bc697a0376d5ae8')

prepare() {
  cd "Signal-Desktop-${pkgver}"
  patch -p0 -i "${srcdir}/installer-window.patch"
}

build() {
  cd "Signal-Desktop-${pkgver}"
  npm install
  node_modules/grunt-cli/bin/grunt -f
}

package() {
  cd "Signal-Desktop-${pkgver}/dist"
  install -Ddm755 "${pkgdir}/opt/${pkgname}"
  install -Ddm755 "${pkgdir}/usr/bin"
  #zip -r "${pkgdir}/opt/${pkgname}/signal.nw" *
  cp -r * "${pkgdir}/opt/${pkgname}/"
  echo -e "#!/bin/bash\n/usr/bin/nw /opt/signal" > "${pkgdir}/usr/bin/signal"
  chmod +x "${pkgdir}/usr/bin/signal"
}
