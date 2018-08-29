# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

# NOTE about libgl dependency 
# if you have and use 'mesa',     install 'mesa-libgl'
# if you have and use 'nvidia',   install 'nvidia-libgl'
# if you have and use 'catalyst', install 'catalyst-libgl' (or catalyst-total)
# p.s.: there is no 'libgl' pkg, instead it is provided by the above pkgs

pkgname=teighaviewer-qt5
_altname=teighaviewer
pkgver=19.5.0
_version=19.5.0.0
pkgrel=1
pkgdesc="Application for the visualization of CAD drawing files, QT5 version"
arch=('x86_64')
url="https://www.opendesign.com/guestfiles/teigha_viewer"
license=('custom')
conflicts=('teighaviewer-qt4')
depends=('qt5-base' 'libxfixes' 'libgl' 'libxkbcommon-x11' 'bash' 'hicolor-icon-theme')
source=("${pkgname}-x86_64-${_version}.deb::https://download.opendesign.com/guestfiles/TeighaViewer/TeighaViewer_QT5_lnxX64_4.7dll.deb"
        'license')
sha256sums=('b891749c7dd711e9113e8193e699453bfe284dfe4c3c3f87d9660031472d5159'
            '770baed2dda51def38a40583d559b1e731a22b94a1e30b8d59f41aea153b25a7')

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
