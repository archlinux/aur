# Maintainer: john smith <hidden at mail dot com>
_pkgname="grive-tools"
pkgname="${_pkgname}-patched"
pkgver=1.15
pkgrel=6
pkgdesc="Grive Tools with Patch. It disables pinging to Google every 10sec, add Sync at startup if AutoSync is enabled and replace grive-setup with a simple script."
arch=('any')
url="http://www.thefanclub.co.za/how-to/ubuntu-google-drive-client-grive-and-grive-tools"
license=('GPL3')
conflicts=("${_pkgname}" "grive-indicator-git")
depends=('grive' 'libappindicator-gtk3' 'python2-pyinotify' 'python2-gobject' 'dconf' 'procps-ng' 'xdg-utils' 'libnotify')
makedepends=('patch')
source=("https://launchpad.net/~thefanclub/+archive/${_pkgname}/+files/${_pkgname}_${pkgver}.tar.gz"
        "${_pkgname}.patch")
sha256sums=('617f87deb6d6f590bcd652e62e7ae2cde78e0485dbbdd05b46d3cf43b8c640bb'
            'cf78a23b59fe14224354dc43ffa1a04aeba49605b2bac964bae6081d2b0ae8ec')

prepare() {
 cd ${_pkgname}
 patch -Np1 -i "${srcdir}"/${_pkgname}.patch
}

package() {
 cd ${_pkgname}
 install -dm755 "${pkgdir}"/usr/share/${_pkgname}/icons
 cp -r usr/share/* "${pkgdir}"/usr/share; rm "${pkgdir}"/usr/share/applications/*
 install -m644 usr/share/applications/grive-indicator.desktop "${pkgdir}"/usr/share/applications
 install -m644 opt/thefanclub/${_pkgname}/icons/dark/*.svg "${pkgdir}"/usr/share/${_pkgname}/icons
 install -m644 opt/thefanclub/${_pkgname}/icons/*.png "${pkgdir}"/usr/share/${_pkgname}/icons
 install -m644 opt/thefanclub/${_pkgname}/GoogleDrive.png "${pkgdir}"/usr/share/${_pkgname}
 install -m755 opt/thefanclub/${_pkgname}/grive-setup "${pkgdir}"/usr/share/${_pkgname}
 install -m755 opt/thefanclub/${_pkgname}/grive-indicator "${pkgdir}"/usr/share/${_pkgname}
 install -m644 opt/thefanclub/${_pkgname}/grive-indicator-autostart.desktop "${pkgdir}"/usr/share/${_pkgname}
 sed -i 's|/opt/thefanclub/|/usr/share/|g' "${pkgdir}"/usr/share/${_pkgname}/grive-indicator-autostart.desktop
 sed -i 's|/opt/thefanclub/|/usr/share/|g' "${pkgdir}"/usr/share/applications/grive-indicator.desktop
 rm "${pkgdir}"/usr/share/locale/*/LC_MESSAGES/grive-setup.mo
}
