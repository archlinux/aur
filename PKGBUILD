# Contributor: Christian Heusel <gromit@archlinux.org>

pkgname=keycloak-hcaptcha
pkgver=1.0.1
pkgrel=1
pkgdesc='Keycloak deployment that provides similar functionality to Google reCaptcha, but with a more privacy friendly provider named hCaptcha.'
url="https://github.com/p08dev/keycloak-hcaptcha"
arch=('any')
license=('MIT')
# _jrever=11
# _jdkver=11
depends=("java-runtime>=${_jrever}")
makedepends=("jdk${_jdkver}-openjdk" 'maven' 'keycloak' 'git')
_commit=7be998a4bf7333ab2af8e99d41ee208e9c0f8d2a
source=("git+https://github.com/p08dev/keycloak-hcaptcha.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  # export JAVA_HOME="/usr/lib/jvm/java-${_jdkver}-openjdk"
  # export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
  mvn install
}

check() {
  cd ${pkgname}
  # export JAVA_HOME="/usr/lib/jvm/java-${_jdkver}-openjdk"
  # export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
  mvn test
}

package() {
  cd ${pkgname}

  install -d "${pkgdir}/usr/share/java/keycloak/providers/"
  install -Dm644 "target/$pkgname.jar" "${pkgdir}/usr/share/java/${pkgname}/$pkgname-${pkgver}.jar"
  ln -s "/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/keycloak/providers/${pkgname}-${pkgver}.jar"
}

