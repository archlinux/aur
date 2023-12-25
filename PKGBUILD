# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jameson Pugh <imntreal@gmail.com>
pkgname=jaxb-api
pkgver=4.0.0
pkgrel=1
pkgdesc="Java Architecture for XML Binding (JAXB) API"
arch=(any)
url="https://github.com/eclipse-ee4j/${pkgname}"
license=('custom:BSD-3-clause')
depends=(java-runtime)
makedepends=(java-environment maven)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('eb4eab396b894ab801433e0e31f93a4980f3913176a1960591a69e4fd55f10f316a7edb712df323c59f7dc9ca6cebacb7257be06aec72446059dd8b93c6de175')
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
