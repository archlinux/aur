# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=jaf-api
pkgver=2.1.3
pkgrel=2
pkgdesc="Jakarta Activation Specification project"
arch=(any)
url="https://github.com/jakartaee/${pkgname}"
license=(BSD-3-Clause)
depends=(java-runtime)
makedepends=(java-environment maven)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('0ee7a1b44b789360fdfc3b1cd474f5b201ef31c34850cd8ccf68afc38679ab4740066e7a68bbef1c91ca56cde8b8bbb6b74d1f799494e134bf0519f50c31165e')
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
