# Contributor: David Manouchehri <d@32t.ca>
# Maintainer: josephgbr <rafael.f.f1@gmail.com>

# NOTE about libgl dependency (same note applies to its 'lib32-' version)
# if you have and use 'mesa',     install 'mesa-libgl'
# if you have and use 'nvidia',   install 'nvidia-libgl'
# if you have and use 'catalyst', install 'catalyst-libgl' (or catalyst-total)
# p.s.: there is no 'libgl' pkg, instead it is provided by the above pkgs

pkgname=teighafileconverter-qt4
_altname=teighafileconverter
pkgver=4.00.1.0
pkgrel=1
pkgdesc="Converts files between the .dwg and .dxf file formats, QT4 version"
arch=('i686' 'x86_64')
url="http://www.opendesign.com/guestfiles"
license=('custom')
conflicts=('teighafileconverter' 'teighafileconverter-qt5')
provides=('teighafileconverter')
depends=('bash' 'hicolor-icon-theme')
depends_i686=('qt4' 'libgl')
depends_x86_64=('lib32-qt4' 'lib32-libgl')
install=${pkgname}.install
source=(http://www.opendesign.com/files/guestdownloads/TeighaFileConverter/TeighaFileConverter_QT4_lnxX86_4.4dll.deb
        license)
md5sums=('14334b959bf85de848605a7ebbdf6be1'
         '62b5539acd57c50855e29d1157c10697')

build() {
  [ ! -d ${_altname}-${pkgver} ] && mkdir ${_altname}-${pkgver}
  tar xf data.tar.gz -C ${_altname}-${pkgver}
}

package() {
  cd ${_altname}-${pkgver}
  
  # persistent application storage (libs, executables, etc.)
  if [[ $CARCH == i686 ]]; then
    appstoragedir=usr/lib/teighafileconverter
  elif [[ $CARCH == x86_64 ]]; then
    appstoragedir=usr/lib32/teighafileconverter
  fi
  for file in $(ls usr/bin/TeighaFileConverter_${pkgver}/); do
    install -Dm755 usr/bin/TeighaFileConverter_${pkgver}/${file} \
        "${pkgdir}/${appstoragedir}/${file}"
  done
  
  # binary
  install -Dm755 usr/bin/TeighaFileConverter \
    "${pkgdir}/usr/bin/teighafileconverter"
  sed -e "s#usr/bin/TeighaFileConverter_${pkgver}#${appstoragedir}#" \
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
  
  # copyright, license
  install -Dm644 usr/share/doc/TeighaFileConverter/copyright \
    "${pkgdir}/usr/share/licenses/${_altname}/COPYRIGHT"
  install -Dm644 "$srcdir"/license \
    "${pkgdir}/usr/share/licenses/${_altname}/license"
  
}
