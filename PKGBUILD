# Maintainer: gandalf3 <zzyxpaw at gmail dot com>

pkgname=('enigma-dev-git')
pkgver=0.0.0
pkgrel=3
pkgdesc="ENIGMA, the Extensible Non-Interpreted Game Maker Augmentation."
url="http://enigma-dev.org"
arch=('x86_64' 'i686')
license=('GPL')
depends=('alure' 'zlib' 'openal' 'libx11' 'libgl' 'mesa' 'gtk2' 'dumb' 'java-runtime' 'desktop-file-utils' \
  'hicolor-icon-theme')

makedepends=('git' 'python')
conflicts=('lateralgm')
provides=('lateralgm')
install='enigma-dev-git.install'
source=('lateralgm' 'lateralgm.desktop' 'git://github.com/enigma-dev/enigma-dev.git' 'http://enigma-dev.org/docs/wiki/images/4/47/Lateralgmlogo.png')
md5sums=('b6eea00e8293de6307bc96a78956159f' '0eca65efd1ad5b863e22a284be894b59' 'SKIP' 'e6daacba04f0491b256f8a4d2cc9181a')

build() {
  cd "${srcdir}/enigma-dev"
  msg "Starting python config.."
  python install.py
  
  cd "${srcdir}/enigma-dev"
  msg "Starting compile.."
  make
  }
  
pkgver () {
  cd "${srcdir}/enigma-dev"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  }

package() {
  mkdir "${pkgdir}/opt/"
  
#   Change .desktop settings
  sed -i 's/enigma/enigma-dev-git/' "${srcdir}/enigma-dev/packages/linux/usr/bin/enigma-dev"
  sed -i 's/Terminal=true/Terminal=false/' "${srcdir}/enigma-dev/packages/linux/usr/share/applications/enigma-dev.desktop"
  echo 'Comment=ENIGMA, the Extensible Non-Interpreted Game Maker Augmentation.' >> "${srcdir}/enigma-dev/packages/linux/usr/share/applications/enigma-dev.desktop"
  
  mkdir -p "${pkgdir}/usr/share"
  mkdir "${pkgdir}/usr/bin"
  cp -r -a "${srcdir}/enigma-dev/packages/linux/usr/share" "${pkgdir}/usr/"
  cp -r -a "${srcdir}/enigma-dev/packages/linux/usr/bin" "${pkgdir}/usr/"
  cp -r -a "${srcdir}/enigma-dev" "${pkgdir}/opt/${pkgname}"
  chmod -R 755 "${pkgdir}/opt/${pkgname}"
  
  cd "${pkgdir}/usr/bin/"
  install -D "${srcdir}/lateralgm" "${pkgdir}/usr/bin/lateralgm"
  chmod +x "${pkgdir}/usr/bin/lateralgm"
  chmod +x "${pkgdir}/usr/bin/enigma-dev"
  install -D "${srcdir}/lateralgm.desktop" "${pkgdir}/usr/share/applications/lateralgm.desktop"
  install -D "${srcdir}/Lateralgmlogo.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/lateralgm.png"
  install -D "${pkgdir}/usr/share/pixmaps/enigma-dev.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/enigma-dev.svg"
  
# remove some extra stuff to help reduce package size; more of this is may be possible.
  rm -rf "${pkgdir}/usr/share/${pkgname}/packages"
}