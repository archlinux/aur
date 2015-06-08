# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=latexdraw-git
_pkgname=latexdraw
pkgver=1308.d4bcf14
pkgrel=1
pkgdesc="Create svg graphics and/or pstricks code usable in latex documents. (GIT version)"
arch=('any')
url="http://latexdraw.sourceforge.net"
license=('GPL')
depends=('jdk7-openjdk')
optdepends=('texlive-pstricks: use generated code in latex documents')
makedepends=('git' 'jdk7-openjdk' 'maven' 'unzip')
conflicts=('latexdraw')
source=("${_pkgname}::git+https://github.com/arnobl/latexdraw.git"
  'latexdraw.desktop'
  'latexdraw.sh')
md5sums=('SKIP'
         '9674cf3a8d85b4d09bd27ebed416bb71'
         'a306ee12d3f992c66493359ebc1159e4')


pkgver() {
  cd ${srcdir}/${_pkgname}
  revision="$(git rev-list --count HEAD)"
  changeset="$(git log -1 --pretty=format:%h)"
  echo "${revision}.${changeset}"
}

build() {
  cd ${srcdir}/${_pkgname}/latexdraw-core/net.sf.latexdraw.installer
  mvn clean package install

  cd ${srcdir}/${_pkgname}/latexdraw-core/net.sf.latexdraw
  mvn clean package install

  # Get project version
  projver=$(mvn org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version | grep -Ev '(^\[|Download\w+:)')

  # Extract and simplify the path for package()
  cd target
  unzip LaTeXDraw-$projver-bin.zip
  mv LaTeXDraw-$projver LaTeXDraw
}

package() {
  cd ${srcdir}/${_pkgname}/latexdraw-core/net.sf.latexdraw/target/LaTeXDraw

  # Create directory
  install -d ${pkgdir}/usr/share/java/${_pkgname}

  # Install LaTeXDraw
  cp -r data/* ${pkgdir}/usr/share/java/${_pkgname}/
  cp license.txt release_note.txt ${pkgdir}/usr/share/java/${_pkgname}/

  # Install sh wrapper script
  install -Dm755 ${srcdir}/${_pkgname}.sh \
    ${pkgdir}/usr/bin/${_pkgname}

  # Install menu entry
  install -Dm644 ${srcdir}/${_pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # Install menu entry
  install -Dm644 ${srcdir}/${_pkgname}/latexdraw-core/net.sf.latexdraw/src/resources/main/res/LaTeXDrawIcon.png \
    ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
}
