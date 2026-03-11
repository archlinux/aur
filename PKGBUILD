# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=reitti
pkgver=3.4.1
pkgrel=2
_jdkver=24 # https://github.com/dedicatedcode/reitti/blob/main/pom.xml#L17
pkgdesc="Comprehensive personal location tracking and analysis"
arch=(any)
url="https://github.com/dedicatedcode/${pkgname}"
license=('MIT')
makedepends=("git" "java-environment>=${_jdkver}" "maven")
optdepends=(
  "postgis"
  "rabbitmq"
  "valkey"
  "photon-geocoder: reverse geocoding"
  "nominatim: reverse geocoding"
  "immich-server: photo integration"
)
install="${pkgname}.install"
backup=("etc/conf.d/reitti")
source=("git+${url}#tag=v${pkgver}"
        "reitti.install"
        "reitti.service"
        "reitti.sysusers"
        "reitti.tmpfiles"
        "reitti.conf"
        "reitti-nginx.conf"
        "application-systemd.properties")
sha256sums=('a380dfc9b048d7664cfc9209341ba7a6aa425a5a3a4922e7ba8a52a06604afd7'
            'ec5c1f3997c72ee68e675abd2693791b530f793fcc9ceb99d6f0cf10d5948a7a'
            'b2304c791f5d40c8427bdb329653edbbfedf871d1e2e1b7ef2bf96cf0367a3a0'
            '6d3fa7035e4f59b5b30a487d01358d8af24bc3d4d8f030e5d2d6512155ddb92e'
            'f7367d266964e57be18f0452c260a02811834989dce3a6696e0104b05d194465'
            '986f6cc144bdac4186b3fa7a7d3c702814b704227afd9e68b14101ff460052e0'
            '1272c89757eabb31e0d34e2bc14a2b6deda8c32e01165847ceefb608acbeed35'
            '9ddd967b4cb8618cf2c10cf2e1671084b66fc5ae19b621b217b788233373a7ad')

prepare() {
  cd "${srcdir}/${pkgname}"

  sed -i "s|<version>0.0.1-SNAPSHOT</version>|<version>${pkgver}</version>|" pom.xml
  cp ../application-systemd.properties src/main/resources/application-systemd.properties
}

build() {
  cd "${srcdir}/${pkgname}"

  # Tests are integration tests that will fail
  mvn clean package -DskipTests
}

package() {
  depends+=("java-runtime>=${_jdkver}")

  install -m 644 -D "reitti.sysusers" "${pkgdir}/usr/lib/sysusers.d/reitti.conf"
  install -m 644 -D "reitti.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/reitti.conf"
  install -m 640 -D "reitti.conf" "${pkgdir}/etc/conf.d/reitti"
  install -m 644 -D "reitti.service" "${pkgdir}/usr/lib/systemd/system/reitti.service"
  install -m 644 -D "reitti-nginx.conf" "$pkgdir/usr/share/doc/$pkgname/examples/nginx.conf"

  cd "${srcdir}/${pkgname}"

  install -m 644 -D "target/reitti-app.jar" "${pkgdir}/usr/share/java/reitti/reitti-app.jar"
  install -m 644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 644 -D "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

}
