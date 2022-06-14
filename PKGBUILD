# Maintainer: Leonidas Spyropoulos (artafinde at archlinux dot org)
# Contributor: scrawler@gmail.com

pkgname=freeplane-git
_NEXT_VERSION=1.10.x
pkgver=1.10.x.d9305d4c4
pkgrel=1
pkgdesc="A Java mindmapping tool"
arch=('any')
url="https://github.com/freeplane/freeplane.git"
license=('GPL')
makedepends=('git' 'gradle' 'ttf-opensans' 'fontconfig' 'jdk17-openjdk')
conflicts=('freeplane')
provides=('freeplane')
depends=('java-environment' 'desktop-file-utils')
source=("git+https://github.com/freeplane/freeplane.git#branch=${_NEXT_VERSION}"
        "freeplane.desktop::https://raw.githubusercontent.com/freeplane/freeplane/${_NEXT_VERSION}/freeplane/src/editor/resources/linux/freeplane.desktop"
        "freeplane.run")
sha256sums=('SKIP'
            'SKIP'
            '56ac3b9c1711a05f2d04f5587a27a9e05c5c06885d14027363e6c00d2614bc78')

pkgver() {
  cd "${pkgname%-*}"
  # Use branch and last commit
  local commit="$(git rev-parse --short HEAD)"
  printf "%s" "${_NEXT_VERSION}.${commit}"
}

build() {
  cd "${pkgname%-*}"
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  export PATH="${JAVA_HOME}/bin:${PATH}"
  gradle -Dorg.gradle.daemon=false build
}

package() {
  cd ${srcdir}/${pkgname%-*}/BIN
  find plugins -type f | while read file; do
    install -Dm644 ${file} ${pkgdir}/usr/share/freeplane/${file}
  done
  
  install -Dm644 framework.jar ${pkgdir}/usr/share/freeplane/framework.jar
  install -Dm644 freeplane.l4j.ini ${pkgdir}/usr/share/freeplane/freeplane.l4j.ini
  install -Dm644 freeplane.png ${pkgdir}/usr/share/freeplane/freeplane.png
  install -Dm644 freeplane.policy ${pkgdir}/usr/share/freeplane/freeplane.policy
  install -Dm755 freeplane.sh ${pkgdir}/usr/share/freeplane/freeplane.sh
  install -Dm644 freeplane.svg ${pkgdir}/usr/share/freeplane/freeplane.svg
  install -Dm644 freeplaneConsole.l4j.ini ${pkgdir}/usr/share/freeplane/freeplaneConsole.l4j.ini
  install -Dm644 freeplaneIcons.dll ${pkgdir}/usr/share/freeplane/freeplaneIcons.dll
  install -Dm644 freeplanelauncher.jar ${pkgdir}/usr/share/freeplane/freeplanelauncher.jar
  install -Dm644 init.xargs ${pkgdir}/usr/share/freeplane/init.xargs
  install -Dm644 props.xargs ${pkgdir}/usr/share/freeplane/props.xargs

  # Where's the licence?
  #install -Dm644 license.txt ${pkgdir}/usr/share/freeplane/licence.txt

  install -dm755  ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/META-INF
  install -dm755  ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/lib
  install -dm755  ${pkgdir}/usr/share/freeplane/resources/ortho
  install -dm755  ${pkgdir}/usr/share/freeplane/resources/templates
  install -dm755  ${pkgdir}/usr/share/freeplane/resources/xslt
  install -dm755  ${pkgdir}/usr/share/freeplane/resources/xml
  install -dm755  ${pkgdir}/usr/share/freeplane/fwdir/perms
  install -dm755  ${pkgdir}/usr/share/freeplane/fwdir/condperm
  install -dm755  ${pkgdir}/usr/share/freeplane/scripts

  install -Dm644 core/org.freeplane.core/META-INF/* ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/META-INF/
  install -Dm644 core/org.freeplane.core/lib/* ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/lib
  install -Dm644 resources/ortho/* ${pkgdir}/usr/share/freeplane/resources/ortho/
  install -Dm644 resources/templates/* ${pkgdir}/usr/share/freeplane/resources/templates/
  install -Dm644 resources/xslt/* ${pkgdir}/usr/share/freeplane/resources/xslt/
  install -Dm644 resources/xml/* ${pkgdir}/usr/share/freeplane/resources/xml/
  install -Dm644 scripts/* ${pkgdir}/usr/share/freeplane/scripts/
  cp -r doc ${pkgdir}/usr/share/freeplane/
  
  install -Dm644 ${srcdir}/freeplane.desktop ${pkgdir}/usr/share/applications/freeplane.desktop
  install -Dm755 ${srcdir}/freeplane.run ${pkgdir}/usr/bin/freeplane
  install -Dm644 freeplane.svg ${pkgdir}/usr/share/pixmaps/freeplane.svg
}
