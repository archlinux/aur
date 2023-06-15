# Contributor: Christian Heusel <gromit@archlinux.org>

pkgname=keycloak-hcaptcha
pkgver=1.0.0.r8.g4ce3f58
pkgrel=1
pkgdesc='Keycloak deployment that provides similar functionality to Google reCaptcha, but with a more privacy friendly provider named hCaptcha.'
url="https://github.com/p08dev/keycloak-hcaptcha"
arch=('any')
license=('MIT')
_jrever=11
_jdkver=11
depends=("java-runtime>=${_jrever}")
makedepends=("jdk${_jdkver}-openjdk" 'maven' 'keycloak' 'git')
source=(git+https://github.com/p08dev/keycloak-hcaptcha.git#branch=master)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  export JAVA_HOME="/usr/lib/jvm/java-${_jdkver}-openjdk"
  export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
  mvn install
}

check() {
  cd ${pkgname}
  export JAVA_HOME="/usr/lib/jvm/java-${_jdkver}-openjdk"
  export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
  mvn test
}

package() {
  cd ${pkgname}

  install -d "${pkgdir}/usr/share/java/keycloak/providers/"
  install -Dm644 "target/$pkgname.jar" "${pkgdir}/usr/share/java/${pkgname}/$pkgname-${pkgver}.jar"
  ln -s "/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/keycloak/providers/${pkgname}-${pkgver}.jar"
}

