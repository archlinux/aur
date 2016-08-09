# Maintainer: Conor Anderson <conor.anderson@mail.utoronto.ca>
pkgname=wire-desktop
_pkgname=Wire
pkgver=2.9.2645
pkgrel=1
pkgdesc='Modern, private messenger. Based on Electron.'
arch=('x86_64' 'i686')
url='https://wire.com/'
license=('GPL3')
depends=()
makedepends=('npm' 'nodejs-grunt-cli' 'gendesk')
provides=('wire-desktop')
source=("https://github.com/wireapp/wire-desktop/archive/release/"$pkgver".tar.gz")
sha256sums=('3db51a50bafc4f7a8070db823e5451b7734567effc6e4458acdb0af702bc8a87')

prepare() {
  # create desktop file and run script
  gendesk -f -n --name=${_pkgname} --pkgname=${pkgname} --pkgdesc="${pkgdesc}" --exec="${pkgname}"
  echo "cd /opt/${pkgname}/ && ./Wire ." > ${pkgname}
}

build() {
	cd ${srcdir}/${pkgname}-release-${pkgver}
	npm install
	grunt linux
}

package() {
  mkdir -p ${pkgdir}/opt/${pkgname}
  if [ $CARCH == 'x86_64' ]; then
    cp -R ${srcdir}/${pkgname}-release-${pkgver}/wrap/build/Wire-linux-x64/* ${pkgdir}/opt/${pkgname}
  else
    cp -R ${srcdir}/${pkgname}-release-${pkgver}/wrap/build/Wire-linux-ia32/* ${pkgdir}/opt/${pkgname}
  fi
  
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${srcdir}/${pkgname}-release-${pkgver}/resources/win/icon.256x256.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}
