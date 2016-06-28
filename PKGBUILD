# Maintainer: Tinxy <arch æŧ tinx ðøŧ eu>

_basename='scenebuilder'
_appname="gluon-${_basename}"
pkgname="javafx-${_appname}"
pkgver='8.2.0'
pkgrel=1
arch=('any')
pkgdesc='An open source tool that allows for drag and drop design of JavaFX user interfaces.'
url='http://gluonhq.com/labs/scene-builder/'
license=('BSD')
depends=('java-environment>=8' 'java-openjfx')
makedepends=('mercurial' 'gradle')
source=("${_basename}::hg+https://bitbucket.org/gluon-oss/scenebuilder#tag=${pkgver}"
        "${_appname}_base.desktop"
        "${_appname}.png")
sha256sums=('SKIP'
            '8bd4f4a9ae2f687a25cd00b8319f582ca37bad96054761bcfa970d2cfae210af'
            'b77517f70237350a26fca72b19222fc1d669704ed8aa9125d85b73f10afa1907')

prepare() {
  # Prepare start script
  echo "#!/bin/bash" > "${srcdir}/${_appname}"
  echo "exec java -jar /opt/${_appname}/${_appname}.jar $@" >> "${srcdir}/${_appname}"
  # Prepare Desktop file
  cat "${srcdir}/${_appname}_base.desktop" > "${srcdir}/${_appname}.desktop"
  echo "Exec=/usr/bin/${_appname}" >> "${srcdir}/${_appname}.desktop"
  echo "Icon=/usr/share/pixmaps/${_appname}.png" >> "${srcdir}/${_appname}.desktop"
}

build() {
  cd "${srcdir}/${_basename}"
  gradle jar
}

package() {
  mkdir -p "${pkgdir}/opt/${_appname}"
  install -m755 "${srcdir}/${_basename}/build/libs/${_basename}-${pkgver}-SNAPSHOT.jar" "${pkgdir}/opt/${_appname}/${_appname}.jar"
  
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${_appname}" "${pkgdir}/usr/bin/"
  
  mkdir -p "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/"
  
  mkdir -p "${pkgdir}/usr/share/licenses/${_appname}"
  install -m644 "${srcdir}/${_basename}/build/resources/main/LICENSE" "${pkgdir}/usr/share/licenses/${_appname}/"
  
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  install -m644 "${srcdir}/${_appname}.png" "${pkgdir}/usr/share/pixmaps/"
}
