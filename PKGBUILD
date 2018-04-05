# Maintainer: john smith <hidden at mail dot com>
_pkgname="grive-tools"
pkgname="${_pkgname}-patched"
pkgver=1.15
pkgrel=1
pkgdesc="Grive Tools with Patch. It disables pinging to Google every 10sec, add Sync at startup if AutoSync is enabled and replace grive-setup with a simple script."
arch=('any')
url="http://www.thefanclub.co.za/how-to/ubuntu-google-drive-client-grive-and-grive-tools"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "grive-indicator-git")
depends=('grive' 'libappindicator-gtk3' 'python2-pyinotify' 'python2-gobject')
makedepends=('patch')
source=("https://launchpad.net/~thefanclub/+archive/${_pkgname}/+files/${_pkgname}_${pkgver}.tar.gz"
        "${_pkgname}.patch")
md5sums=('71d48848aa91aed5531b72e7db347901'
         'ebfa7e7e3ee7d4bdde001a294d46fbba')

prepare() {
 cd ${_pkgname}
 patch -Np1 -i "${srcdir}"/${_pkgname}.patch
}

package() {
 cd ${_pkgname}
 install -dm755 "${pkgdir}"/usr/share/${_pkgname}/icons
 cp -r usr/share/* "${pkgdir}"/usr/share; rm "${pkgdir}"/usr/share/applications/*
 install -m644 usr/share/applications/grive-indicator.desktop "${pkgdir}"/usr/share/applications
 cp -r opt/thefanclub/${_pkgname}/icons/dark/*.svg "${pkgdir}"/usr/share/${_pkgname}/icons
 cp -r opt/thefanclub/${_pkgname}/icons/*.png "${pkgdir}"/usr/share/${_pkgname}/icons
 cp -r opt/thefanclub/${_pkgname}/GoogleDrive.png "${pkgdir}"/usr/share/${_pkgname}
 cp -r opt/thefanclub/${_pkgname}/grive-setup "${pkgdir}"/usr/share/${_pkgname}
 cp -r opt/thefanclub/${_pkgname}/grive-indicator "${pkgdir}"/usr/share/${_pkgname}
 cp -r opt/thefanclub/${_pkgname}/grive-indicator-autostart.desktop "${pkgdir}"/usr/share/${_pkgname}
 sed -i 's|/opt/thefanclub/|/usr/share/|g' "${pkgdir}"/usr/share/${_pkgname}/grive-indicator-autostart.desktop
 sed -i 's|/opt/thefanclub/|/usr/share/|g' "${pkgdir}"/usr/share/applications/grive-indicator.desktop
 chmod 755 "${pkgdir}"/usr/share/${_pkgname}/{grive-indicator,grive-setup}
 rm "${pkgdir}"/usr/share/locale/*/LC_MESSAGES/grive-setup.mo
}
