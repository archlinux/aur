# Maintainer: rafaelff <rafaelff@gnome.org>

# NOTE about libgl dependency (same note applies to its 'lib32-' version)
# if you have and use 'mesa',     install 'mesa-libgl'
# if you have and use 'nvidia',   install 'nvidia-libgl'
# if you have and use 'catalyst', install 'catalyst-libgl' (or catalyst-total)
# p.s.: there is no 'libgl' pkg, instead it is provided by the above pkgs

pkgname=teighafileconverter-qt5
_altname=teighafileconverter
pkgver=4.3.1
_version=4.3.1.0
pkgrel=1
pkgdesc="Converts files between the .dwg and .dxf file formats, QT5 version"
arch=('i686' 'x86_64')
url="https://www.opendesign.com/guestfiles/teigha_file_converter"
license=('custom')
conflicts=('teighafileconverter-qt4')
depends=('qt5-base' 'libxfixes' 'libgl' 'bash' 'gtk-update-icon-cache' 'desktop-file-utils')
source=('license')
source_i686=(${pkgname}-i686-${_version}.deb::https://download.opendesign.com/guestfiles/TeighaFileConverter/TeighaFileConverter_QT5_lnxX86_4.7dll.deb)
source_x86_64=(${pkgname}-x86_64-${_version}.deb::https://download.opendesign.com/guestfiles/TeighaFileConverter/TeighaFileConverter_QT5_lnxX64_4.7dll.deb)
md5sums=('62b5539acd57c50855e29d1157c10697')
md5sums_i686=('c8641cc0f2d314f9012a96f1d457c91b')
md5sums_x86_64=('1e13abbc1c25337a0e0d68b529c05e09')

prepare() {
  rm -rf ${_altname}-${pkgver}
  mkdir ${_altname}-${pkgver}
  tar xf data.tar.gz -C ${_altname}-${pkgver}
}

package() {
  cd ${_altname}-${pkgver}

  for file in $(ls usr/bin/TeighaFileConverter_${_version}/); do
    install -Dm755 usr/bin/TeighaFileConverter_${_version}/${file} \
        "${pkgdir}/usr/lib/${pkgname}/${file}"
  done
  
    # binary
  install -Dm755 usr/bin/TeighaFileConverter \
    "${pkgdir}/usr/bin/${_altname}"
  sed -e "s#usr/bin/TeighaFileConverter_${_version}#usr/lib/${pkgname}#" \
    -i "${pkgdir}/usr/bin/${_altname}"
  
    # desktop item
  install -Dm644 usr/share/applications/TeighaFileConverter_${_version}.desktop \
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
