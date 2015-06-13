# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Giuliano Schneider <gs93@gmx.net>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

_eclipse_name=luna
_eclipse_release=SR2
pkgname=eclipse-jee
pkgver=4.4.2
pkgrel=1
pkgdesc="Eclipse IDE for Java EE Developers"
arch=('i686' 'x86_64')
url="http://www.eclipse.org"
license=('EPL')
depends=('java-environment>=6' 'gtk2' 'webkitgtk2')
provides=("eclipse=${pkgver}")
conflicts=('eclipse')
install="${pkgname}.install"
sha256sums=('3c6af9a3586ea7b8ca5e3b2c5c1842bfa4dcc6e68ebb2052edad0a07902e2d29'
            '9fdf02d827e5f3b44146a0532c463ef44d0bf3aa57d0be4f2acccc38a170915b'
            '4eb2189c96fcfa340886b049b34dc3636d7b2bfa865140dc72edb61455d900c3'
            '4a86578ebbe8adddf731b6bef31c05277ea792cb22d733b6a5c0a25f65546caf'
            'da103fe3b9d8c6cc1316b2b45347697bf6561230e81286b78cf142b64b1d89a5')
if [ "$CARCH" = 'x86_64' ]; then
  sha256sums[0]='d66cc43c6f064a277f7c61d58fa982e4f95c2addba3d2b4c14c829d2291cb78e'
  _arch="-${CARCH}"
fi
source=("${pkgname}-${_eclipse_name}-${_eclipse_release}-linux-gtk${_arch}.tar.gz"::"http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/${_eclipse_name}/${_eclipse_release}/${pkgname}-${_eclipse_name}-${_eclipse_release}-linux-gtk${_arch}.tar.gz&r=1"
        "eclipse.sh"
        "eclipse.desktop"
        "eclipse.ini.patch"
        "eclipse.svg")
# prevent package compression
PKGEXT=".pkg.tar"

build() {
  patch -p1 -i "eclipse.ini.patch"
}

package() {
  # Copy application files
  install -m 755 -d "${pkgdir}/usr/share"
  cp -a "eclipse" "${pkgdir}/usr/share"

  # Copy executable file
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 eclipse.sh "${pkgdir}/usr/bin/eclipse"

  # Copy icons
  install -m 755 -d "${pkgdir}/usr/share/icons"
  for _size in 16 32 48 256
  do
    install -m 755 -d "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps"
    install -m 644 eclipse/plugins/org.eclipse.platform_4.*.v*/eclipse${_size}.png \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/eclipse.png"
  done
  install -m 755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -m 644 "eclipse.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/eclipse.svg"

  # Copy desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 "eclipse.desktop" "${pkgdir}/usr/share/applications/eclipse.desktop"
}
