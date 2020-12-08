# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=openmv-ide-bin
_pkgname=${pkgname%-bin}
pkgver=2.6.8
pkgrel=1
pkgdesc="QtCreator based OpenMV IDE."
arch=('x86_64' 'i686')
url="https://github.com/openmv/openmv-ide"
license=('MIT')
depends=('libpng' 'libusb')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
install='.INSTALL'
source=('https://raw.githubusercontent.com/openmv/openmv-ide/master/LICENSE'
        "${_pkgname}.qs"
        "${_pkgname}.desktop"
        "${_pkgname}.png")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.run::https://github.com/openmv/openmv-ide/releases/download/v${pkgver}/${_pkgname}-linux-x86_64-${pkgver}.run")
source_i686=("${_pkgname}-${pkgver}-i686.run::https://github.com/openmv/openmv-ide/releases/download/v${pkgver}/${_pkgname}-linux-x86-${pkgver}.run")
sha256sums=('46f06683b87cff5215e8dd427142983f84474b6a383c96d51e9d0592c5f1b0ed'
            'f88d7948cd07a7a7c8e9cc7030eff7eccd348880d68c6846454e7473d4bafd11'
            'c3b6bc073a98169ce988424663d14ca802d38726db7aea14b3c18e31216e23a5'
            '11b3fe3f7de494aa7e45050327c3a5300596e5f03717fd3f469f6b8b8e1e7f55')
sha256sums_x86_64=('dc5b7dbca536dc9d9965c9c1898a002d51a12cad129fa14909bd40f239416991')
sha256sums_i686=('be236f4f5deb36d3cc3b38fac133fe189bcc80735822bff6b16c3db413269024')

prepare() {
  sed -i "s|/tmp/QT|$srcdir/$_pkgname|g" ${_pkgname}.qs
  rm -rf ${srcdir}/${_pkgname}
  chmod u+x ${_pkgname}-${pkgver}-$CARCH.run
  ./${_pkgname}-${pkgver}-$CARCH.run -platform minimal --script ${_pkgname}.qs > /dev/null 2>&1
}

package() {
  #binary
  install -Dm755 ${srcdir}/${_pkgname}/bin/${_pkgname/-} ${pkgdir}/opt/${_pkgname}/bin/${_pkgname/-}
  install -Dm644 ${srcdir}/${_pkgname}/bin/qt.conf ${pkgdir}/opt/${_pkgname}/bin/qt.conf

  # lib
  install -dm755 ${pkgdir}/opt/${_pkgname}/lib
  mv ${srcdir}/${_pkgname}/lib/qtcreator ${pkgdir}/opt/${_pkgname}/lib
  mv ${srcdir}/${_pkgname}/lib/Qt ${pkgdir}/opt/${_pkgname}/lib/Qt

  # doc
  install -Dm644 -t ${pkgdir}/usr/share/doc/${_pkgname}/ ${srcdir}/${_pkgname}/README.txt

  # share
  install -dm755 ${pkgdir}/opt/${_pkgname}/share
  mv ${srcdir}/${_pkgname}/share/qtcreator ${pkgdir}/opt/${_pkgname}/share

  # desktop
  install -Dm644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # icon
  install -Dm644 ${srcdir}/${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

  # license
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # soft link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/bin/${_pkgname/-} ${pkgdir}/usr/bin/${_pkgname/-}

  # udev
  install -Dm644 ${pkgdir}/opt/${_pkgname}/share/qtcreator/pydfu/50-openmv.rules ${pkgdir}/usr/lib/udev/rules.d/50-openmv.rules
}

# vim: set sw=2 ts=2 et:
