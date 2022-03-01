# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=openmv-ide-bin
_pkgname=${pkgname%-bin}
pkgver=2.9.0
pkgrel=1
pkgdesc="QtCreator based OpenMV IDE."
arch=('x86_64' 'i686')
url="https://github.com/openmv/openmv-ide"
license=('MIT')
depends=('libpng' 'libusb')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
install='openmv-ide-bin.install'
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
sha256sums_x86_64=('9a1a285872afa5508721038043d36537b082d07faa828ef24101233ea7cc11e5')
sha256sums_i686=('3b1f909f7c8b66685216befb87f82fa99f64a01b102223cc991ec3b2830d5418')

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/opt/${_pkgname}/{} \;
}

prepare() {
  rm -rf ${srcdir}/${_pkgname}

  sed -i "s|/tmp/QT|$srcdir/$_pkgname|g" ${_pkgname}.qs
  chmod u+x ${_pkgname}-${pkgver}-$CARCH.run

  ./${_pkgname}-${pkgver}-$CARCH.run -platform minimal --script ${_pkgname}.qs > /dev/null 2>&1
}

package() {
  cd ${srcdir}/${_pkgname}

  # binary
  install -Dm755 bin/${_pkgname/-} ${pkgdir}/opt/${_pkgname}/bin/${_pkgname/-}

  # qt.conf
  install -Dm644 bin/qt.conf ${pkgdir}/opt/${_pkgname}/bin/qt.conf

  # lib
  _install 644 -L lib/qtcreator
  _install 644 -L lib/Qt

  # doc
  install -Dm644 README.txt -t ${pkgdir}/usr/share/doc/${_pkgname}/

  # share
  _install 644 share/qtcreator

  # desktop
  install -Dm644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # icon
  install -Dm644 ${srcdir}/${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

  # license
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # soft link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/bin/${_pkgname/-} ${pkgdir}/usr/bin/${_pkgname/-}

  # udev rule
  install -Dm644 ${pkgdir}/opt/${_pkgname}/share/qtcreator/pydfu/50-openmv.rules -t ${pkgdir}/usr/lib/udev/rules.d/
}

# vim: set sw=2 ts=2 et:
