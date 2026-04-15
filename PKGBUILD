# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=jaf-api
pkgver=2.1.4
pkgrel=2
pkgdesc="Jakarta Activation Specification project"
arch=(any)
url="https://github.com/jakartaee/${pkgname}"
license=(BSD-3-Clause)
depends=(java-runtime)
makedepends=(java-environment maven)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('76dcfb22a96aa8099dae4d7a6b96230ee79a3a7b4a7874867e3f4f22ddef4d55b74e6f1edfa8cecc844eb6545ddbd45222e2cc7f3cf23c27cc1c97cfc40cf3db')
_M2_REPO=$(mktemp -d)

build() {
  cd ${pkgname}-${pkgver}/api

  if [[ -z "${JAVA_HOME}" ]]; then
    export JAVA_HOME=/usr/lib/jvm/default
  fi
  mvn -Dmaven.test.skip=true \
    -Dmaven.repo.local=${_M2_REPO} \
    clean install
}

check() {
  cd ${pkgname}-${pkgver}/api
  mvn test -Dmaven.repo.local=${_M2_REPO}
}

package() {
  cd ${pkgname}-${pkgver}/api
  install -Dm 644 target/jakarta.activation-api-${pkgver}.jar -t "${pkgdir}"/usr/share/java
  ln -s jakarta.activation-api-${pkgver}.jar "${pkgdir}"/usr/share/java/jakarta.activation-api.jar
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
