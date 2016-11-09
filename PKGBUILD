# Maintainer: Conor Anderson <conor.anderson@mail.utoronto.ca>
pkgname=wire-desktop-git
_pkgname=wire-desktop
_name=wire
pkgver=2.11.2673.r0.gce43739
pkgrel=1
pkgdesc='Modern, private messenger. Based on Electron.'
arch=('x86_64' 'i686')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop-bin' 'wire-desktop')
depends=('nss' 'alsa-lib' 'libxss' 'gconf' 'gtk2' 'libxtst')
makedepends=('yarn' 'grunt-cli' 'gendesk' 'python2')
provides=('wire-desktop')
source=("git://github.com/wireapp/wire-desktop.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/release\///g'
}

prepare() {
  gendesk -f -n --name=Wire --pkgname=${_name} --pkgdesc="${pkgdesc}" --exec=${_name} --categories="Network"
}

build() {
  cd ${srcdir}/${_pkgname}
  yarn
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
  install -d ${pkgdir}/usr/lib/${_name}
  if [ $CARCH == 'x86_64' ]; then
    cp -a ${srcdir}/${_pkgname}/wrap/dist/linux-unpacked/* ${pkgdir}/usr/lib/${_name}
  elif [ $CARCH == 'i686' ]; then
    cp -a ${srcdir}/${_pkgname}/wrap/dist/linux-ia32-unpacked/* ${pkgdir}/usr/lib/${_name}
  else
    echo "Unknown architecture"; exit 1;
  fi
  
  # Symlink main binary
  install -d ${pkgdir}/usr/bin
  ln -s "/usr/lib/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"
  
  # Place desktop entry and icon
  install -Dm644 ${_name}.desktop ${pkgdir}/usr/share/applications/${_name}.desktop
  install -Dm644 ${srcdir}/${_pkgname}/electron/img/wire.png ${pkgdir}/usr/share/pixmaps/${_name}.png

  # Place license files
  install -Dm644 "${pkgdir}/usr/lib/${_name}/LICENSE" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
  install -Dm644 "${pkgdir}/usr/lib/${_name}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_name}/LICENSES.chromium.html"
  rm "${pkgdir}/usr/lib/${_name}/LICENSE"
  rm "${pkgdir}/usr/lib/${_name}/LICENSES.chromium.html"
}
