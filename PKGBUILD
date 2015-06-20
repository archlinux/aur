# Maintainer: josephgbr <rafael.f.f1@gmail.com>

# NOTE about libgl dependency (same note applies to its 'lib32-' version)
# if you have and use 'mesa',     install 'mesa-libgl'
# if you have and use 'nvidia',   install 'nvidia-libgl'
# if you have and use 'catalyst', install 'catalyst-libgl' (or catalyst-total)
# p.s.: there is no 'libgl' pkg, instead it is provided by the above pkgs

pkgname=teighafileconverter-qt5
_altname=teighafileconverter
pkgver=4.00.1.0
pkgrel=2
pkgdesc="Converts files between the .dwg and .dxf file formats, QT5 version"
arch=('i686' 'x86_64')
url="http://www.opendesign.com/guestfiles"
license=('custom')
conflicts=('teighafileconverter-qt4')
depends=('qt5-base' 'libxfixes' 'libgl' 'bash' 'hicolor-icon-theme')
install=${pkgname}.install
source=('license')
source_i686=(http://www.opendesign.com/files/guestdownloads/TeighaFileConverter/TeighaFileConverter_QT5_lnxX86_4.7dll.deb)
source_x86_64=(http://www.opendesign.com/files/guestdownloads/TeighaFileConverter/TeighaFileConverter_QT5_lnxX64_4.7dll.deb)
md5sums=('62b5539acd57c50855e29d1157c10697')
md5sums_i686=('84b46aa845781da1f8a398578a64590e')
md5sums_x86_64=('f28adffae333c414ab3bcfeaa70c5600')

build() {
  [ ! -d ${_altname}-${pkgver} ] && mkdir ${_altname}-${pkgver}
  tar xf data.tar.gz -C ${_altname}-${pkgver}
}

package() {
  cd ${_altname}-${pkgver}

  for file in $(ls usr/bin/TeighaFileConverter_${pkgver}/); do
    install -Dm755 usr/bin/TeighaFileConverter_${pkgver}/${file} \
        "${pkgdir}/usr/lib/teighafileconverter/${file}"
  done
  
  # binary
  install -Dm755 usr/bin/TeighaFileConverter \
    "${pkgdir}/usr/bin/teighafileconverter"
  sed -e "s#usr/bin/TeighaFileConverter_${pkgver}#usr/lib/teighafileconverter#" \
    -i "${pkgdir}/usr/bin/${_altname}"
  
  # desktop item
  install -Dm644 usr/share/applications/TeighaFileConverter_${pkgver}.desktop \
    "${pkgdir}/usr/share/applications/teighafileconverter.desktop"
  sed -e "s#/TeighaFileConverter#/teighafileconverter#" \
    -i "${pkgdir}/usr/share/applications/teighafileconverter.desktop"
  
  # hicolor icons
  for icon in $(find usr/share/icons -type f); do
    install -Dm644 ${icon} \
        "${pkgdir}/${icon}"
  done
  
  # copyright
  install -Dm644 usr/share/doc/TeighaFileConverter/copyright \
    "${pkgdir}/usr/share/licenses/${_altname}/COPYRIGHT"
  install -Dm644 "$srcdir"/license \
    "${pkgdir}/usr/share/licenses/${_altname}/license"
  
}
