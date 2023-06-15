# Contributor: Christian Heusel <gromit@archlinux.org>

pkgname=keycloak-hcaptcha
pkgver=1.0.0
pkgrel=1
pkgdesc='Keycloak deployment that provides similar functionality to Google reCaptcha, but with a more privacy friendly provider named hCaptcha.'
url="https://github.com/p08dev/keycloak-hcaptcha"
arch=('any')
license=('MIT')
_jrever=11
_jdkver=11
depends=("java-runtime>=${_jrever}")
makedepends=("jdk${_jdkver}-openjdk" 'maven' 'keycloak')
source=($pkgname-$pkgver.tar.gz::https://github.com/p08dev/keycloak-hcaptcha/archive/v${pkgver}.tar.gz)
sha512sums=('96c34c326610f1ad4c3ccf9ad424365ce8561ae0c4408496849cc1e7c55b627ed928fe72e32fd522db3c10bae6209ba1c5167c6036b41993e1fe2e66395fbb97')

build() {
  cd ${pkgname}-${pkgver}
  export JAVA_HOME="/usr/lib/jvm/java-${_jdkver}-openjdk"
  export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
  mvn install
}

check() {
  cd ${pkgname}-${pkgver}
  export JAVA_HOME="/usr/lib/jvm/java-${_jdkver}-openjdk"
  export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
  mvn test
}

package() {
  cd ${pkgname}-${pkgver}

  install -d "${pkgdir}/usr/share/java/keycloak/providers/"
  install -Dm644 "target/$pkgname.jar" "${pkgdir}/usr/share/java/${pkgname}/$pkgname-${pkgver}.jar"
  ln -s "/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/keycloak/providers/${pkgname}-${pkgver}.jar"
}

