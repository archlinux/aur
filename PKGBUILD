# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jameson Pugh <imntreal@gmail.com>
pkgname=jaxb-api
pkgver=4.0.1
pkgrel=1
pkgdesc="Java Architecture for XML Binding (JAXB) API"
arch=(any)
url="https://github.com/eclipse-ee4j/${pkgname}"
license=('custom:BSD-3-clause')
depends=(java-runtime)
makedepends=(java-environment maven)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('ee4e3851f9f619339b883cc95ef41d2e8c7b31440384c9ae6f2ff4dc248ae8104aa05a204e89803d49863503c2fde134b9a21599d14b35f4fadc3a96200ed5f8')
_M2_REPO=$(mktemp -d)

build() {
  cd ${pkgname}-${pkgver}

  if [[ -z "${JAVA_HOME}" ]]; then
    export JAVA_HOME=/usr/lib/jvm/default
  fi
  mvn -Dmaven.test.skip=true \
    -Dmaven.repo.local=${_M2_REPO} \
    clean install
}

check() {
  cd ${pkgname}-${pkgver}
  mvn test -Dmaven.repo.local=${_M2_REPO}
}

package() {
  cd ${pkgname}-${pkgver}

  install -dm755 "${pkgdir}/usr/share/java/"
  install -m544 "api/target/jakarta.xml.bind-api-${pkgver}.jar" "${pkgdir}/usr/share/java/"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/java"
  ln -s "./jakarta.xml.bind-api-${pkgver}.jar" "${pkgname}-${pkgver}.jar"
  ln -s "./${pkgname}-${pkgver}.jar" "${pkgname}.jar"
}
