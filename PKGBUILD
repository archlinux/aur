# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: willemw
# Contributor: Avi H.D. <strykar@hotmail.com>

pkgname=routeconverter
pkgver=3.1
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

sha256sums=('0a4dca96f3f02c274714192765eaacfb1ceb53f628150fd0c73e00bf2ce7f6d5'
            '30ed02e7180c85c0448a257a4b7d40de554b084faadeb899dead72e4e2cdc741'
            '0237729d3fb3fdb7462fb1f9064175135f7406a9fb0ec2206986ab9f668b4078'
            '10c9d279e9254324245812456661e6e7c45b3c94eb850c76aad3b4ad74dae070'
            '9e818cdd5c2ff0eec458c9ea86472d03b83207e4a8e69672cdf6ad8edd0a379e')

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

