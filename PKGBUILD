# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=latexdraw-git
_pkgname=latexdraw
pkgver=1316.02b7e13
pkgrel=1
pkgdesc="Create svg graphics and/or pstricks code usable in latex documents. (GIT version)"
arch=('any')
url="http://latexdraw.sourceforge.net"
license=('GPL2')
depends=('java-environment-openjdk=8'
         'java-openjfx')
optdepends=('texlive-pstricks: use generated code in latex documents')
makedepends=('git'
             'java-environment-openjdk=8'
             'java-openjfx'
             'maven'
             'unzip'
             'desktop-file-utils')
provide=('latexdraw')
conflicts=('latexdraw')
source=("${_pkgname}::git+https://github.com/arnobl/latexdraw.git"
  'latexdraw.desktop'
  'latexdraw.sh'
  'assembly.patch'
  'assemblyBin.xml')
md5sums=('SKIP'
         '9674cf3a8d85b4d09bd27ebed416bb71'
         'af55038de87bf657cf05b7de10d66d7f'
         '3efdc0d53aff7e10cba624583d133d97'
         '715764362cac4539e2bad0e173d7a39a')
install=latexdraw.install


pkgver() {
  cd ${srcdir}/${_pkgname}
  revision="$(git rev-list --count HEAD)"
  changeset="$(git log -1 --pretty=format:%h)"
  echo "${revision}.${changeset}"
}

build() {
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

  cd ${srcdir}/${_pkgname}/latexdraw-core/net.sf.latexdraw.installer
  mvn clean package install

  # Fix: java.lang.NullPointerException: Location is required.
  # Place fxml in a corresponding resource directory.
  cd ${srcdir}/${_pkgname}/latexdraw-core/net.sf.latexdraw/src
  jfx_ui_dir=net/sf/latexdraw/glib/views/jfx/ui
  mkdir -p resources/main/$jfx_ui_dir
  mv main/$jfx_ui_dir/*.fxml resources/main/$jfx_ui_dir

  cd ${srcdir}/${_pkgname}
  patch -p1 < ${srcdir}/assembly.patch
  cd ${srcdir}/${_pkgname}/latexdraw-core/net.sf.latexdraw
  cp -f ${srcdir}/assemblyBin.xml src/assembly/assemblyBin.xml
  mvn clean package install

  # Get project version
  projver=$(mvn org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version | grep -Ev '(^\[|Download\w+:)')

  # Extract and simplify the path for package()
  cd target
  unzip LaTeXDraw-$projver-bin.zip
  mv LaTeXDraw-$projver LaTeXDraw
}

package() {
  # Install LaTeXDraw
  cd ${srcdir}/${_pkgname}/latexdraw-core/net.sf.latexdraw/target/LaTeXDraw
  cp -r usr ${pkgdir}/

  # Workaround for SNAPSHOT filename
  cd ${srcdir}/${_pkgname}/latexdraw-core/net.sf.latexdraw/target
  unzip latexdraw.core-4.0.0-SNAPSHOT.jar META-INF/MANIFEST.MF
  malai_core=$(cat META-INF/MANIFEST.MF | tr -d '\r\n ' | sed "s/lib\// /g; s/\.jar/ /g" | tr ' ' '\n' | grep malai.core)
  cd ${pkgdir}/usr/share/java/${_pkgname}/lib
  mv malai.core-2.0-SNAPSHOT.jar $malai_core.jar

  # TXT files
  cp ${srcdir}/${_pkgname}/latexdraw-core/net.sf.latexdraw/src/resources/main/res/license.txt \
     ${pkgdir}/usr/share/java/${_pkgname}/
  cp ${srcdir}/${_pkgname}/latexdraw-core/net.sf.latexdraw/src/resources/main/res/release_note.txt \
     ${pkgdir}/usr/share/java/${_pkgname}/

  # Install sh wrapper script
  install -Dm755 ${srcdir}/${_pkgname}.sh \
    ${pkgdir}/usr/bin/${_pkgname}

  # Install menu entry
  install -Dm644 ${srcdir}/${_pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
