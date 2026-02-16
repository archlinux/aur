# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jameson Pugh <imntreal@gmail.com>
pkgname=jaxb-api
pkgver=4.0.5
pkgrel=1
pkgdesc="Java Architecture for XML Binding (JAXB) API"
arch=(any)
url="https://github.com/eclipse-ee4j/${pkgname}"
license=(BSD-3-Clause)
depends=(java-runtime)
makedepends=(java-environment maven)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b3fe128ed240c61034035b977225639788b495a107929e59ee500dee319321875b573afd6efbcd1ecd1bcb08270429956292eb2daca6bd73474ca9f25ed13540')
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
