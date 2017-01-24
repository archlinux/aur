# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

# NOTE about libgl dependency 
# if you have and use 'mesa',     install 'mesa-libgl'
# if you have and use 'nvidia',   install 'nvidia-libgl'
# if you have and use 'catalyst', install 'catalyst-libgl' (or catalyst-total)
# p.s.: there is no 'libgl' pkg, instead it is provided by the above pkgs

pkgname=teighaviewer-qt5
_altname=teighaviewer
pkgver=4.2.2
_version=4.02.2.0
pkgrel=1
pkgdesc="Application for the visualization of CAD drawing files, QT5 version"
arch=('i686' 'x86_64')
url="https://www.opendesign.com/guestfiles/teigha_viewer"
license=('custom')
conflicts=('teighaviewer-qt4')
depends=('qt5-base' 'libxfixes' 'libgl' 'libxkbcommon-x11' 'bash' 'hicolor-icon-theme')
source=('license')
source_i686=(${pkgname}-i686-${_version}.deb::https://download.opendesign.com/guestfiles/TeighaViewer/TeighaViewer_QT5_lnxX86_4.7dll.deb)
source_x86_64=(${pkgname}-x86_64-${_version}.deb::https://download.opendesign.com/guestfiles/TeighaViewer/TeighaViewer_QT5_lnxX64_4.7dll.deb)
md5sums=('62b5539acd57c50855e29d1157c10697')
md5sums_i686=('c185ae7f42357f178ef6f754c4e0109c')
md5sums_x86_64=('81eb629507ba4e0ac64f2106d2111418')

prepare() {
  rm -rf ${_altname}-${_version}
  mkdir ${_altname}-${_version}
  tar xf data.tar.gz -C ${_altname}-${_version}
}

package() {
  cd ${_altname}-${_version}

  for file in $(ls usr/bin/TeighaViewer_${_version}/); do
    install -Dm755 usr/bin/TeighaViewer_${_version}/${file} \
        "${pkgdir}/usr/lib/teighaviewer/${file}"
  done
  
    # binary
  install -Dm755 usr/bin/TeighaViewer \
    "${pkgdir}/usr/bin/teighaviewer"
  sed -e "s#usr/bin/TeighaViewer_${_version}#usr/lib/teighaviewer#" \
    -i "${pkgdir}/usr/bin/${_altname}"
  
    # desktop item
  install -Dm644 usr/share/applications/TeighaViewer_${_version}.desktop \
    "${pkgdir}/usr/share/applications/teighaviewer.desktop"
  sed -e "s#/TeighaViewer#/teighaviewer#" \
    -i "${pkgdir}/usr/share/applications/teighaviewer.desktop"
  
    # hicolor icons
  for icon in $(find usr/share/icons -type f); do
    install -Dm644 ${icon} \
        "${pkgdir}/${icon}"
  done
  
    # copyright
  install -Dm644 usr/share/doc/TeighaViewer/copyright \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  install -Dm644 "$srcdir"/license \
    "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
