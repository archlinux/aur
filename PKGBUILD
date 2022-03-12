# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: willemw

pkgname=routeconverter
pkgver=2.31
pkgrel=1
pkgdesc="A free tool to edit and convert routes, tracks and waypoints"
arch=('i686' 'x86_64')
url="http://www.routeconverter.de/en"
license=('GPL')
depends=('java-environment>=6' 'java-openjfx' 'archlinux-java-run')
makedepends=('gendesk' 'unzip')
optdepends=('gpsbabel: for some additional format support')
changelog=ChangeLog
source=(routeconverter
        routeconverter-offline
        routeconverter-cli
        RouteConverterCmdLine-${pkgver}.jar::http://static.routeconverter.com/download/previous-releases/${pkgver}/RouteConverterCmdLine.jar
        RouteConverterLinux-${pkgver}.jar::http://static.routeconverter.com/download/RouteConverterLinux.jar)

noextract=(RouteConverterCmdLine-${pkgver}.jar
           RouteConverterLinux-${pkgver}.jar)

build() {
  cd "${srcdir}"
  gendesk -f -n --pkgname "${pkgname}" --exec "routeconverter" --pkgdesc "$pkgdesc" --categories 'Utility;Maps'
  gendesk -f -n --pkgname "${pkgname}_offline" --exec "routeconverter-offline" --pkgdesc "$pkgdesc (offline)" --categories 'Utility;Maps'
}

package()
{
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -d "${pkgdir}/usr/share/pixmaps"
  install -m755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m755 "${srcdir}/routeconverter" \
		"${srcdir}/routeconverter-cli" \
		"${pkgdir}/usr/bin/"
  for _ in RouteConverterCmdLine RouteConverterLinux
  do
  	install -m644 "${srcdir}/${_}-${pkgver}.jar" "${pkgdir}/usr/lib/${pkgname}/${_}.jar"
  done
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  unzip -p "${srcdir}/RouteConverterLinux-${pkgver}.jar" slash/navigation/converter/gui/RouteConverter.png >"${pkgdir}/usr/share/pixmaps/routeconverter.png"
}

md5sums=('44b20257184f3b23014ca12b975dc5b0'
         'a9e4b76c2aa26c6a0b7a9474964c9648'
         'fdf570309917df1c1536b7e3c7740b33'
         'b58735cb4f42923ca06cf99e9ae36aed'
         'f04c8cc060dd2bdb3c02c415658a2a72')
