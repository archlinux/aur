# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: willemw

pkgname=routeconverter
pkgver=2.24
pkgrel=3
pkgdesc="A free tool to edit and convert routes, tracks and waypoints"
arch=('i686' 'x86_64')
url="http://www.routeconverter.de/en"
license=('GPL')
depends=('java-environment>=6' 'java-openjfx')
makedepends=('gendesk' 'unzip')
optdepends=('gpsbabel: for some additional format support')
changelog=ChangeLog
source=(routeconverter
        routeconverter-offline
        routeconverter-cli
        http://static.routeconverter.com/download/previous-releases/${pkgver}/RouteConverterCmdLine.jar
        http://static.routeconverter.com/download/RouteConverterLinux.jar
        http://static.routeconverter.com/download/RouteConverterLinuxOffline.jar)

noextract=(RouteConverterCmdLine.jar
           RouteConverterLinux.jar
           RouteConverterLinuxOffline.jar)

prepare() {
  cd "${srcdir}"
  gendesk -f -n --pkgname "${pkgname}" --exec "routeconverter" --pkgdesc "$pkgdesc" --categories 'Utility'
  gendesk -f -n --pkgname "${pkgname}_offline" --exec "routeconverter-offline" --pkgdesc "$pkgdesc (offline)" --categories 'Utility'
}

package()
{
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -d "${pkgdir}/usr/share/pixmaps"
  install -m755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m755 "${srcdir}/routeconverter" \
		"${srcdir}/routeconverter-offline" \
		"${srcdir}/routeconverter-cli" \
		"${pkgdir}/usr/bin/"
  for _ in RouteConverterCmdLine RouteConverterLinux RouteConverterLinuxOffline
  do
  	install -m644 "${srcdir}/${_}.jar" "${pkgdir}/usr/lib/${pkgname}/"
  done
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}_offline.desktop" "${pkgdir}/usr/share/applications/${pkgname}_offline.desktop"
  unzip -p "${srcdir}/RouteConverterLinux.jar" slash/navigation/converter/gui/RouteConverter.png >"${pkgdir}/usr/share/pixmaps/routeconverter_offline.png"
  unzip -p "${srcdir}/RouteConverterLinux.jar" slash/navigation/converter/gui/RouteConverter.png >"${pkgdir}/usr/share/pixmaps/routeconverter.png"
}

md5sums=('e4cdc9db82a9f8c550afb44f851d897f'
         'a9e4b76c2aa26c6a0b7a9474964c9648'
         'fdf570309917df1c1536b7e3c7740b33'
         '60cbeb53ebed1b867d6d0eec58de907f'
         '9103d26c1259529a07f00dd0c7734064'
         '57acd5a4df0bf156c26634a77c1c0db7')
