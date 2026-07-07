# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=reitti
pkgver=5.0.1
pkgrel=1
_jdkver=25 # https://github.com/dedicatedcode/reitti/blob/main/pom.xml#L17
pkgdesc="Comprehensive personal location tracking and analysis"
arch=(any)
url="https://github.com/dedicatedcode/${pkgname}"
license=('MIT')
makedepends=("git" "java-environment>=${_jdkver}" "maven")
optdepends=(
  "postgis"
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
sha256sums=('2a4c9d5daf309e4295ce83b48cf50aab726eb49714c5b788b385904672e4cbc9'
            '3a36daca90c91af2a38c82aeed1d5309984c9eccc07e325f2c477843d1e83f69'
            'b2304c791f5d40c8427bdb329653edbbfedf871d1e2e1b7ef2bf96cf0367a3a0'
            '6d3fa7035e4f59b5b30a487d01358d8af24bc3d4d8f030e5d2d6512155ddb92e'
            'f7367d266964e57be18f0452c260a02811834989dce3a6696e0104b05d194465'
            '111aa410f60e33551c3729368536e53a690792aa1bedf99c5e833d5c51ef4fa7'
            '86a51b3eea54a9e9d4a08584f3f0d632bee75761523db97002d7a1f27fcfc6f3'
            '6f05dc261ccccf6bdc5ddde476e3fa04f99a44aa1a5d2fd7979499a554224d3f')

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
