# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: willemw
# Contributor: Avi H.D. <strykar@hotmail.com>

pkgname=routeconverter
pkgver=3.0
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

sha256sums=('d35cd45946a2728a8e2d6b0fb7d53d1803df1016380eb052dad0f3f1b00a25a9'
         '30ed02e7180c85c0448a257a4b7d40de554b084faadeb899dead72e4e2cdc741'
         '0237729d3fb3fdb7462fb1f9064175135f7406a9fb0ec2206986ab9f668b4078'
         '0dc7a28b9230169c08bb0a13038557a202cb113903832cabb4eedb3396318950'
         '8fc9b319ae2cfe80aeae7c24787ddafc788eb08687ec7e5f58a730b9c271501f')

noextract=(RouteConverterCmdLine-${pkgver}.jar
           RouteConverterLinux-${pkgver}.jar)

build() {
  cd "${srcdir}"
  gendesk -f -n --pkgname "${pkgname}" --exec "routeconverter" --pkgdesc "${pkgdesc}" --categories 'Utility;Maps'
  gendesk -f -n --pkgname "${pkgname}_offline" --exec "routeconverter-offline" --pkgdesc "${pkgdesc} (offline)" --categories 'Utility;Maps'
}

package()
{
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 "${srcdir}/routeconverter" \
		"${srcdir}/routeconverter-cli" \
		"${pkgdir}/usr/bin/"
  for _ in RouteConverterCmdLine RouteConverterLinux
  do
  	install -m 644 "${srcdir}/${_}-${pkgver}.jar" "${pkgdir}/usr/lib/${pkgname}/${_}.jar"
  done
  install -Dm 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  unzip -p "${srcdir}/RouteConverterLinux-${pkgver}.jar" slash/navigation/converter/gui/RouteConverter.png >"${pkgdir}/usr/share/pixmaps/routeconverter.png"
}

