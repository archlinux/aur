# Maintainer: josephgbr

# NOTE about libgl dependency 
# if you have and use 'mesa',     install 'mesa-libgl'
# if you have and use 'nvidia',   install 'nvidia-libgl'
# if you have and use 'catalyst', install 'catalyst-libgl' (or catalyst-total)
# p.s.: there is no 'libgl' pkg, instead it is provided by the above pkgs

pkgname=teighaviewer-qt5
_altname=teighaviewer
pkgver=4.01.1.0
pkgrel=1
pkgdesc="Application for the visualization of CAD drawing files, QT5 version"
arch=('i686' 'x86_64')
url="http://www.opendesign.com/guestfiles"
license=('custom')
conflicts=('teighaviewer-qt4')
depends=('qt5-base' 'libxfixes' 'libgl' 'libxkbcommon-x11' 'bash' 'hicolor-icon-theme')
source=('license')
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
source_i686=(https://www.opendesign.com/files/guestdownloads/TeighaViewer/TeighaViewer_QT5_lnxX86_4.7dll.deb)
source_x86_64=(https://download.opendesign.com/guestfiles/TeighaViewer/TeighaViewer_QT5_lnxX64_4.7dll.deb)
md5sums=('62b5539acd57c50855e29d1157c10697')
md5sums_i686=('dc13e90b7e43c0fa09b2a4bda70d29a2')
md5sums_x86_64=('e1b862235b97be48e2b93763ae700855')

build() {
  rm -rf ${_altname}-${pkgver}
  mkdir ${_altname}-${pkgver}
  tar xf data.tar.gz -C ${_altname}-${pkgver}
}

package() {
  cd ${_altname}-${pkgver}

  for file in $(ls usr/bin/TeighaViewer_${pkgver}/); do
    install -Dm755 usr/bin/TeighaViewer_${pkgver}/${file} \
        "${pkgdir}/usr/lib/teighaviewer/${file}"
  done
  
  # binary
  install -Dm755 usr/bin/TeighaViewer \
    "${pkgdir}/usr/bin/teighaviewer"
  sed -e "s#usr/bin/TeighaViewer_${pkgver}#usr/lib/teighaviewer#" \
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
