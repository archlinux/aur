# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=reitti
pkgver=2.3.1
pkgrel=1
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
        "reitti.service"
        "reitti.sysusers"
        "reitti.tmpfiles"
        "reitti.conf"
        "application-systemd.properties")
sha256sums=('7053d2de2c210b1d07f8973547353a3da05c42223d661da0e2a729c75eeedee4'
            'b2304c791f5d40c8427bdb329653edbbfedf871d1e2e1b7ef2bf96cf0367a3a0'
            '6d3fa7035e4f59b5b30a487d01358d8af24bc3d4d8f030e5d2d6512155ddb92e'
            'f7367d266964e57be18f0452c260a02811834989dce3a6696e0104b05d194465'
            '98cd68bb38d259ff43b72efb44a120fbb688c9c16a75369439e7e67d1e48a31c'
            '7b6bcbf6a833f3474d7685a05b67c62d06ad53063e600ce1c1eac92449557ea7')

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

  cd "${srcdir}/${pkgname}"

  install -m 644 -D "target/reitti-app.jar" "${pkgdir}/usr/share/java/reitti/reitti-app.jar"
  install -m 644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 644 -D "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
