# Maintainer: Conor Anderson <conor.anderson@mail.utoronto.ca>
pkgname=wire-desktop
_pkgname=wire
pkgver=2.11.2668
pkgrel=2
pkgdesc='Modern, private messenger. Based on Electron.'
arch=('x86_64' 'i686')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop-bin')
depends=('nss' 'alsa-lib' 'libxss' 'gconf' 'gtk2' 'libxtst')
makedepends=('npm' 'grunt-cli' 'gendesk' 'python2')
provides=('wire-desktop')
source=("https://github.com/wireapp/wire-desktop/archive/release/"$pkgver".tar.gz")        
sha256sums=('9763de9e96124f5d307ea42a7dbab9e61902a7c569f3dafe4e8d6750cbd170c2')

prepare() {
  gendesk -f -n --name=Wire --pkgname=${_pkgname} --pkgdesc="${pkgdesc}" --exec="${_pkgname}" --categories="Network"
}

build() {
  cd ${srcdir}/${pkgname}-release-${pkgver}
  npm install
  grunt 'clean:linux' 'update-keys' 'release-prod'
  if [ $CARCH == 'x86_64' ]; then
    node_modules/.bin/build --linux --x64 --dir
  elif [ $CARCH == 'i686' ]; then
    node_modules/.bin/build --linux --ia32 --dir
  else
    echo "Unknown architecture"; exit 1;
  fi
}

package() {
  # Place files
  install -d ${pkgdir}/usr/lib/${_pkgname}
  if [ $CARCH == 'x86_64' ]; then
    cp -a ${srcdir}/${pkgname}-release-${pkgver}/wrap/dist/linux-unpacked/* ${pkgdir}/usr/lib/${_pkgname}
  elif [ $CARCH == 'i686' ]; then
    cp -a ${srcdir}/${pkgname}-release-${pkgver}/wrap/dist/linux-ia32-unpacked/* ${pkgdir}/usr/lib/${_pkgname}
  else
    echo "Unknown architecture"; exit 1;
  fi
  
  # Symlink main binary
  install -d ${pkgdir}/usr/bin
  ln -s "/usr/lib/${_pkgname}/Wire" "${pkgdir}/usr/bin/${_pkgname}"
  
  # Place desktop entry and icon
  install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm644 ${srcdir}/${pkgname}-release-${pkgver}/electron/img/wire.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

  # Place license files
  install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"
  rm "${pkgdir}/usr/lib/${_pkgname}/LICENSE"
  rm "${pkgdir}/usr/lib/${_pkgname}/LICENSES.chromium.html"
}
