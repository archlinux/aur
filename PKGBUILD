# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Tinxy <arch æŧ tinx ðøŧ eu>

_basename=scenebuilder
_appname="gluon-${_basename}"
pkgname="javafx-${_appname}"
pkgver=8.3.0
pkgrel=1
pkgdesc="Open-source drag & drop UI design tool for JavaFX by Gluon"
arch=('any')
url="https://gluonhq.com/products/scene-builder/"
license=('BSD')
depends=('java-environment>=8' 'java-openjfx')
makedepends=('mercurial' 'gradle')
conflicts=('gluon-scenebuilder')
source=("${_basename}::hg+https://bitbucket.org/gluon-oss/scenebuilder#tag=${pkgver}"
        "${_appname}.sh"
        "${_appname}.desktop")
sha256sums=('SKIP'
            'be575929e72b20f8cbeef6118d13b02783f72206053339a9fcbae21bd7f4b933'
            '85012a1c560592cc0e76d762f1351758d75f6d1ac61eadb3b3b12e21319207fa')

prepare() {
  # Correct build version
  msg2 "Correcting build version..."
  sed -e "s|^\(version = tryGetProperty('VERSION',\).*|\1'${pkgver}')|g" -i "${srcdir}/${_basename}/build.gradle"
}

build() {
  cd "${srcdir}/${_basename}"
  ./gradlew shadowJar
}

package() {
  cd "${srcdir}"
  install -Dm 0755 "${_basename}/build/libs/${_basename}-all-${pkgver}-all.jar" "${pkgdir}/opt/${_appname}/${_appname}.jar"
  install -Dm 0755 "${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"
  install -Dm 0644 "${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  install -Dm 0644 "${_basename}/src/main/resources/com/oracle/javafx/${_basename}/app/about/${_basename}-logo.png" "${pkgdir}/usr/share/pixmaps/${_appname}.png"
  install -Dm 0644 "${_basename}/build/resources/main/LICENSE" "${pkgdir}/usr/share/licenses/${_appname}/LICENSE"
}
