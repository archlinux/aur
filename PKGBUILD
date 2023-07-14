# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=openmv-ide-bin
_pkgname=${pkgname%-bin}
pkgver=4.0.0
pkgrel=1
pkgdesc="QtCreator based OpenMV IDE."
arch=('x86_64')
url="https://github.com/openmv/openmv-ide"
license=('MIT')
depends=('libpng' 'libusb')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
# install='openmv-ide-bin.install'
source=("${_pkgname}.desktop"
        "${_pkgname}.png")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.run::https://github.com/openmv/openmv-ide/releases/download/development/${_pkgname}-linux-x86_64-${pkgver}.run")
sha256sums=('7de4addf4e0144495fdad9d515ad8a19fc3e077a08cff57ef1a961f15bea3e81'
            '11b3fe3f7de494aa7e45050327c3a5300596e5f03717fd3f469f6b8b8e1e7f55')
sha256sums_x86_64=('828aad7fc7f6e22c73afd385f3be7c53124a28b8897244993137c3dbcc4acb32')

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/opt/${_pkgname}/{} \;
}

prepare() {
  chmod u+x ${_pkgname}-${pkgver}-$CARCH.run

  ./${_pkgname}-${pkgver}-$CARCH.run --al -c --am in --root=$srcdir/$_pkgname
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
  #install -Dm644 README.txt -t ${pkgdir}/usr/share/doc/${_pkgname}/

  # share
  _install 644 share/qtcreator
  
  # metainfo
  _install 644 share/metainfo/

  # desktop
  install -Dm644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # icon
  install -Dm644 ${srcdir}/${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

  # license
  install -Dm644 Licenses/LICENSE.GPL3-EXCEPT -t ${pkgdir}/usr/share/licenses/${pkgname}/

  # soft link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/bin/${_pkgname/-} ${pkgdir}/usr/bin/${_pkgname/-}

  # udev rule
  install -Dm644 ${pkgdir}/opt/${_pkgname}/share/qtcreator/pydfu/{99-openmv,99-openmv-arduino,99-openmv-nxp}.rules -t ${pkgdir}/usr/lib/udev/rules.d/
}

# vim: set sw=2 ts=2 et:
