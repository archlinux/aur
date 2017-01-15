# Maintainer : Matt Parnell/ilikenwf <parwok@gmail.com>
# Contributor : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Paul N. Maxwell <msg.maxwel@gmail.com>

pkgname=transgui-gtk2-git
_pkgname=transgui
pkgver=35069a6
pkgrel=1
pkgdesc='Cross platform remote GUI for the Transmission daemon'
arch=(i686 x86_64)
url='https://github.com/leonsoft-kras/transmisson-remote-gui'
license=(GPL2)
depends=(gtk2 desktop-file-utils)
makedepends=(lazarus unzip)
provides=(transmission-remote-gui transmission-remote-gui-gtk2)
conflicts=(transmission-remote-gui-qt4 transmission-remote-gui-svn transmission-remote-gui transmission-remote-gui-gtk2)
install=transgui-gtk2-git.install
source=('git://github.com/leonsoft-kras/transmisson-remote-gui.git'
        ${_pkgname}.desktop)
md5sums=('SKIP'
         'c0504cb6d4e970892ac7be9206c787b5')
_ws=gtk2

pkgver() {
	cd "${srcdir}/transmisson-remote-gui"
	git describe --always | sed 's|-|.|g'
}

build() {
  mkdir "${srcdir}/config"
  cd "${srcdir}/transmisson-remote-gui"

  lazbuild "${_pkgname}.lpi" --lazarusdir=/usr/lib/lazarus --widgetset=${_ws} \
    --primary-config-path="${srcdir}/config"
}

package() {
  cd "${srcdir}/transmisson-remote-gui"

  install -D -m 755 "units/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -d -m 755 "${pkgdir}/usr/share/${_pkgname}/lang"
  install -D -m 644 lang/transgui.* "${pkgdir}/usr/share/${_pkgname}/lang"
  rm "${pkgdir}/usr/share/${_pkgname}/lang/transgui.template"

  install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -D -m 644 readme.txt history.txt LICENSE.txt "${pkgdir}/usr/share/doc/${pkgname}"

  install -D -m 644 "${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -D -m 644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
