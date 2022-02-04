# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=jaxb-api
pkgver=3.0.0
pkgrel=1
pkgdesc="Java Architecture for XML Binding (JAXB) API"
arch=('x86_64')
url="https://github.com/eclipse-ee4j/jaxb-api"
license=(EDL)
depends=('java-runtime' 'sed')
makedepends=('java-environment>=11' 'maven')
source=("https://github.com/eclipse-ee4j/jaxb-api/archive/${pkgver}.tar.gz")
sha256sums=('a0da996efbc6628a2d17aa81b4457c7c858c913d2749fa43cfe162d6ed570cae')
_M2_REPO=$(mktemp -d)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's|<activation.version>1.2.2</activation.version>|<activation.version>1.2.1</activation.version>|g' pom.xml
}

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
