# Maintainer: Conor Anderson <conor.anderson@mail.utoronto.ca>
pkgname=wire-desktop
_pkgname=Wire
pkgver=2.10.2653
pkgrel=2
pkgdesc='Modern, private messenger. Based on Electron.'
arch=('x86_64' 'i686')
url='https://wire.com/'
license=('GPL3')
depends=('nss' 'alsa-lib' 'libxss' 'gconf' 'gtk2' 'libxtst' 'gcc-libs-multilib')
makedepends=('npm' 'nodejs-grunt-cli' 'gendesk' 'python2')
provides=('wire-desktop')
source=("git://github.com/wireapp/wire-desktop.git")
sha256sums=(SKIP)

prepare() {
  # create desktop file and run script
  gendesk -f -n --name=${_pkgname} --pkgname=${pkgname} --pkgdesc="${pkgdesc}" --exec="${pkgname}" --categories="Network"
  echo "cd /opt/${pkgname}/ && ./Wire ." > ${pkgname}-1
}

build() {
	cd ${srcdir}/${pkgname}
	npm install
	grunt linux-prod
}

package() {
  mkdir -p ${pkgdir}/opt/${pkgname}
  if [ $CARCH == 'x86_64' ]; then
    cp -R ${srcdir}/${pkgname}/wrap/build/Wire-linux-x64/* ${pkgdir}/opt/${pkgname}
  else
    cp -R ${srcdir}/${pkgname}/wrap/build/Wire-linux-ia32/* ${pkgdir}/opt/${pkgname}
  fi
  
  install -Dm755 ${pkgname}-1 ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${srcdir}/${pkgname}/electron/img/wire.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}
