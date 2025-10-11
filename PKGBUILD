# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=reitti
pkgver=1.9.3
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
        "reitti.conf"
        "application-systemd.properties")
sha256sums=('dd7ebfd13f02d5dcfbd4d402120b72fc8bd6eb6840b028b9c183ee652fe15011'
            '41dd37478087c0f7cb096d97a62335b0e83304a01a38541694799d9a8a824ccf'
            '51ac22baddb656ce68a407c0cbedda49042f2916b95fcecf9f57f65108a52e80'
            'ce70dda38e19646f91e19a302babe9e8e6760d8ab86865c23052077bdf13f60f'
            'de8195080a5ae5752e7667492221dbded41939da6e762a29ee5778659dd314b2')

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
  install -m 640 -D "reitti.conf" "${pkgdir}/etc/conf.d/reitti"
  install -m 644 -D "reitti.service" "${pkgdir}/usr/lib/systemd/system/reitti.service"

  cd "${srcdir}/${pkgname}"

  install -m 644 -D "target/reitti-app.jar" "${pkgdir}/usr/share/java/reitti/reitti-app.jar"
  install -m 644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 644 -D "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
