# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=jaxb-api
pkgver=2.3.2
pkgrel=1
pkgdesc="Java Architecture for XML Binding (JAXB) API"
arch=('x86_64' 'i686')
url="https://javaee.github.io/jaxb-v2/"
license=(EDL)
depends=('java-runtime')
makedepends=('java-environment' 'maven')
source=("https://github.com/eclipse-ee4j/jaxb-api/archive/${pkgver}.tar.gz")
sha256sums=('67e4434633106920b5898eff4e577fcbfb185c7726ef8c8ee18f9f7ed9023c8f')
_M2_REPO=$(mktemp -d)

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  mvn test -Dmaven.repo.local=${_M2_REPO}
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"

  if [[ -z "${JAVA_HOME}" ]]; then
    export JAVA_HOME=/usr/lib/jvm/default
  fi
  mvn -Dmaven.test.skip=true \
    -Dmaven.repo.local=${_M2_REPO} \
    clean install
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/java/"
  install -m544 "target/jakarta.xml.bind-api-${pkgver}.jar" "${pkgdir}/usr/share/java/"
  cd "${pkgdir}/usr/share/java"
  ln -s "./jakarta.xml.bind-api-${pkgver}.jar" "${pkgname}-${pkgver}.jar"
  ln -s "./${pkgname}-${pkgver}.jar" "${pkgname}.jar"
}
