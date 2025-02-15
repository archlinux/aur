# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=openmv-ide-bin
_pkgname=${pkgname%-bin}
pkgver=4.5.0
pkgrel=1
pkgdesc="QtCreator based OpenMV IDE."
arch=('x86_64')
url="https://github.com/openmv/openmv-ide"
license=('MIT')
# dependencies based on the contents of the setup.sh script.
depends=('fontconfig'
         'freetype2'
         'libxcb'
         'libpng'
         'libusb'
         'python-pyusb')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source_x86_64=("https://github.com/openmv/openmv-ide/releases/download/v${pkgver}/${_pkgname}-linux-x86_64-${pkgver}.tar.gz")
sha256sums_x86_64=('61885a79ace68c72779ca84f055eafe9c4d1859ab62372ced379a9b4d4c6a864')

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/opt/${_pkgname}/{} \;
}


package() {
  cd ${srcdir}/${_pkgname}

  # binary
  install -Dm755 bin/${_pkgname/-} -t ${pkgdir}/opt/${_pkgname}/bin/

  # wrapper
  install -Dm755 bin/${_pkgname/-}.sh -t ${pkgdir}/opt/${_pkgname}/bin/

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
  install -Dm644 share/applications/io.openmv.openmvide.desktop \
                 ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # icon
  cp -r share/icons ${pkgdir}/usr/share/icons

  # soft link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/bin/${_pkgname/-} ${pkgdir}/usr/bin/${_pkgname/-}

  # udev rule
  install -Dm644 share/qtcreator/pydfu/{99-openmv,99-openmv-arduino,99-openmv-nxp}.rules -t\
                  ${pkgdir}/usr/lib/udev/rules.d/
}

# vim: set sw=2 ts=2 et:
