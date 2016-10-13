# Maintainer: Conor Anderson <conor.anderson@mail.utoronto.ca>
pkgname=wire-desktop-git
_pkgname=wire-desktop
pkgver=2.11.2661.r1.ga433bf2
pkgrel=1
pkgdesc='Modern communication, full privacy.'
arch=('x86_64' 'i686')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop-bin' 'wire-desktop')
depends=('nss' 'alsa-lib' 'libxss' 'gconf' 'gtk2' 'libxtst')
makedepends=('npm' 'nodejs-grunt-cli' 'gendesk' 'python2')
provides=('wire-desktop')
source=("git://github.com/wireapp/wire-desktop.git")
sha256sums=(SKIP)

pkgver() {
  cd ${srcdir}/${_pkgname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/release\///g'
}

prepare() {
  gendesk -f -n --name=Wire --pkgname=${_pkgname} --pkgdesc="${pkgdesc}" --exec=wire --categories="Network"
}

build() {
  cd ${srcdir}/${_pkgname}
  npm install
  grunt linux-prod
}

package() {
  # Place files
  install -d ${pkgdir}/opt/${_pkgname}
  if [ $CARCH == 'x86_64' ]; then
    cp -a ${srcdir}/${_pkgname}/wrap/build/Wire-linux-x64/* ${pkgdir}/opt/${_pkgname}
  else
    cp -a ${srcdir}/${_pkgname}/wrap/build/Wire-linux-ia32/* ${pkgdir}/opt/${_pkgname}
  fi
  
  # Symlink main binary
  install -d ${pkgdir}/usr/bin
  ln -s "/opt/${_pkgname}/Wire" "${pkgdir}/usr/bin/wire"
  
  # Place desktop entry and icon
  install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm644 ${srcdir}/${_pkgname}/electron/img/wire.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

  # Place license files
  install -Dm644 "${pkgdir}/opt/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/opt/${_pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"
  rm "${pkgdir}/opt/${_pkgname}/LICENSE"
  rm "${pkgdir}/opt/${_pkgname}/LICENSES.chromium.html"
}
