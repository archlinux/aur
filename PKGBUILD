# Maintainer: josephgbr <rafael.f.f1@gmail.com>

# NOTE about libgl dependency (same note applies to its 'lib32-' version)
# if you have and use 'mesa',     install 'mesa-libgl'
# if you have and use 'nvidia',   install 'nvidia-libgl'
# if you have and use 'catalyst', install 'catalyst-libgl' (or catalyst-total)
# p.s.: there is no 'libgl' pkg, instead it is provided by the above pkgs

pkgname=teighaviewer-qt4
_altname=teighaviewer
pkgver=4.00.1.0
pkgrel=1
pkgdesc="Application for the visualization of CAD drawing files, QT4 version"
arch=('i686' 'x86_64')
url="http://www.opendesign.com/guestfiles"
license=('custom')
conflicts=('teighaviewer' 'teighaviewer-qt5')
provides=('teighaviewer')
depends=('bash' 'hicolor-icon-theme')
depends_i686=('qt4' 'libgl')
depends_x86_64=('lib32-qt4' 'lib32-libgl')
install=${pkgname}.install
source=(http://www.opendesign.com/files/guestdownloads/TeighaViewer/TeighaViewer_QT4_lnxX86_4.4dll.deb
        'license')
md5sums=('f98e24dcea0ab88637c3d70132c61200'
         '62b5539acd57c50855e29d1157c10697')

build() {
  [ ! -d ${_altname}-${pkgver} ] && mkdir ${_altname}-${pkgver}
  tar xf data.tar.gz -C ${_altname}-${pkgver}
}

package() {
  cd ${_altname}-${pkgver}
  
  # persistent application storage (libs, executables, etc.)
  if [[ $CARCH == i686 ]]; then
    appstoragedir=usr/lib/teighaviewer
  elif [[ $CARCH == x86_64 ]]; then
    appstoragedir=usr/lib32/teighaviewer
  fi
  for file in $(ls usr/bin/TeighaViewer_${pkgver}/); do
    install -Dm755 usr/bin/TeighaViewer_${pkgver}/${file} \
        "${pkgdir}/${appstoragedir}/${file}"
  done
  
  # binary
  install -Dm755 usr/bin/TeighaViewer \
    "${pkgdir}/usr/bin/teighaviewer"
  sed -e "s#usr/bin/TeighaViewer_${pkgver}#${appstoragedir}#" \
    -i "${pkgdir}/usr/bin/${_altname}"
  
  # desktop item
  install -Dm644 usr/share/applications/TeighaViewer_${pkgver}.desktop \
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
    "${pkgdir}/usr/share/licenses/${_altname}/COPYRIGHT"
  install -Dm644 "$srcdir"/license \
    "${pkgdir}/usr/share/licenses/${_altname}/license"
  
}
