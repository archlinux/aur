# Maintainer: Conor Anderson <conor.anderson@mail.utoronto.ca>
pkgname=wire-desktop
_pkgname=Wire
pkgver=2.10.2652
pkgrel=2
pkgdesc='Modern, private messenger. Based on Electron.'
arch=('x86_64' 'i686')
url='https://wire.com/'
license=('GPL3')
depends=('nss' 'alsa-lib' 'libxss' 'gconf' 'gtk2' 'libxtst' 'gcc-libs-multilib')
makedepends=('npm' 'nodejs-grunt-cli' 'gendesk')
provides=('wire-desktop')
source=("git://github.com/ConorIA/wire-desktop.git"
        'icon.svg')
sha256sums=(SKIP
            b268a13cc5f5bcd6aebe0ee630e576fe7a9145a0bb05e2117856171c2bfa87ba)

prepare() {
  # create desktop file and run script
  gendesk -f -n --name=${_pkgname} --pkgname=${pkgname} --pkgdesc="${pkgdesc}" --exec="${pkgname}"
  echo "cd /opt/${pkgname}/ && ./Wire ." > ${pkgname}-1
}

build() {
	cd ${srcdir}/${pkgname}
	npm install
	grunt linux
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
  install -Dm644 ${srcdir}/icon.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg
}
