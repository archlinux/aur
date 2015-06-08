# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Paul N. Maxwell <msg.maxwel@gmail.com>

pkgname=transmission-remote-gui-gtk2
_pkgname=transgui
pkgver=5.0.1
pkgrel=2
pkgdesc='Cross platform remote GUI for the Transmission daemon'
arch=(i686 x86_64)
url='http://code.google.com/p/transmisson-remote-gui/'
license=(GPL2)
depends=(gtk2 desktop-file-utils)
makedepends=(lazarus unzip)
provides=(transmission-remote-gui)
conflicts=(transmission-remote-gui-qt4 transmission-remote-gui-svn transmission-remote-gui)
install=transmission-remote-gui.install
source=(http://transmisson-remote-gui.googlecode.com/files/${_pkgname}-${pkgver}-src.zip
       ${_pkgname}.desktop
       fix_cannot_execte_on_open.patch)
md5sums=(471ed1f3f75a0ebcc9d3a0cb72f2a61c
         cf55fd5a681d9b34a1f9c7d91b74d121
         d2f40c9e7e7b86cdfa9c2e2135f18bd6)
_ws=gtk2

build() {
  mkdir ${srcdir}/config
  cd ${srcdir}/TransGUI
  # moonman's fix
  cp ${srcdir}/fix_cannot_execte_on_open.patch .
  patch -p1 < fix_cannot_execte_on_open.patch
  lazbuild ${_pkgname}.lpi --lazarusdir=/usr/lib/lazarus --widgetset=${_ws} \
    --primary-config-path=${srcdir}/config
}

package() {
  cd ${srcdir}/TransGUI

  install -D -m 755 units/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  install -d -m 755 ${pkgdir}/usr/share/${_pkgname}/lang
  install -D -m 644 lang/transgui.* ${pkgdir}/usr/share/${_pkgname}/lang
  rm ${pkgdir}/usr/share/${_pkgname}/lang/transgui.template

  install -d -m 755 ${pkgdir}/usr/share/doc/${pkgname}
  install -D -m 644 readme.txt history.txt LICENSE.txt ${pkgdir}/usr/share/doc/${pkgname}

  install -D -m 644 ${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  install -D -m 644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
