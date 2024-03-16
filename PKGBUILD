# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jameson Pugh <imntreal@gmail.com>
pkgname=jaxb-api
pkgver=4.0.1
pkgrel=2
pkgdesc="Java Architecture for XML Binding (JAXB) API"
arch=(any)
url="https://github.com/eclipse-ee4j/${pkgname}"
license=(BSD-3-Clause)
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
  cd ${pkgname}-${pkgver}/api
  install -Dm 644 target/jakarta.xml.bind-api-${pkgver}.jar -t "${pkgdir}"/usr/share/java
  ln -s jakarta.xml.bind-api-${pkgver}.jar "${pkgdir}"/usr/share/java/jakarta.xml.bind-api.jar
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
