# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=jaxb-ri
pkgver=2.3.2
pkgrel=1
pkgdesc=""
arch=('x86_64' 'i686')
url="https://javaee.github.io/jaxb-v2/"
license=(EDL)
depends=('java-runtime')
makedepends=('java-environment' 'maven')
source=("https://github.com/eclipse-ee4j/jaxb-ri/archive/${pkgver}-RI.tar.gz")
sha256sums=('b764a455e4e5d86f02cde16e4af77821a79ee9212a87334d22f4c651dff1c4b2')
_M2_REPO=$(mktemp -d)

check() {
  cd "${srcdir}/${pkgname}-${pkgver}-RI/jaxb-ri"
#  mvn test -Dmaven.repo.local=${_M2_REPO}
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-RI/jaxb-ri"

  if [[ -z "${JAVA_HOME}" ]]; then
    export JAVA_HOME=/usr/lib/jvm/default
  fi
  mvn -Dmaven.test.skip=true \
    -Dmaven.repo.local=${_M2_REPO} \
    clean install
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-RI/jaxb-ri"

  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/share/java/"
  install -dm755 "${pkgdir}/usr/share/doc/"

  cp -r docs/release-documentation/target/docbook "${pkgdir}/usr/share/doc/jaxb-ri"

  install -m755 bundles/ri/target/stage/jaxb-ri/bin/schemagen.sh "${pkgdir}/usr/bin/"
  install -m755 bundles/ri/target/stage/jaxb-ri/bin/xjc.sh "${pkgdir}/usr/bin/"

  install -m544 bundles/ri/target/stage/jaxb-ri/mod/{FastInfoset.jar,dtd-parser.jar,istack-commons-tools.jar,jakarta.xml.bind-api.jar,jaxb-runtime.jar,relaxng-datatype.jar,stax-ex.jar,xsom.jar,codemodel.jar,istack-commons-runtime.jar,jakarta.activation-api.jar,jaxb-jxc.jar,jaxb-xjc.jar,rngom.jar,txw2.jar} "${pkgdir}/usr/share/java/"
}
