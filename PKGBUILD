# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jameson Pugh <imntreal@gmail.com>
pkgname=jaxb-api
pkgver=4.0.2
pkgrel=1
pkgdesc="Java Architecture for XML Binding (JAXB) API"
arch=(any)
url="https://github.com/eclipse-ee4j/${pkgname}"
license=(BSD-3-Clause)
depends=(java-runtime)
makedepends=(java-environment maven)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('9fa4cb55a2771011d372fee670672062a12d9eb12aeb3a250ec86cc7814d9ea9fe80aca01039b37f96d5997b15938b2371d8fa323a132caf3be1093e76db1869')
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
