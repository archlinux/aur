# Maintainer: Butui Hu <hot123tea123@gmail.com>
#
# Note: this pkg need java-environment=14 as makedepends
# You could use zulu-14-bin, but jdk14-openj9-bin will not work.
# I don't have jdk14-openjdk installed, and https://aur.archlinux.org/packages/jdk14-openjdk
# needs a working jdk14 to build it, so I could not test it, but it should work.

pkgname=latexdraw
pkgver=4.0.3
pkgrel=7
pkgdesc='A vector drawing editor for LaTeX (JavaFX)'
arch=('x86_64')
url='http://latexdraw.sourceforge.net'
license=('GPL3')
makedepends=(
  dpkg
  java-environment=14
  maven
)
optdepends=(
  'ttf-droid: font for CJK characters'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/latexdraw/latexdraw/archive/${pkgver}.tar.gz")
sha512sums=('a2b5a7438c43fab1cb840e4eb521dab78369fb5ee78ebb138d6b6e8f8bf07d51d62ca54d3689ee82dd57e1dfb34e2773cc439fdb1221aaf0614d2ba6d161566c')

prepare() {
  # maven >= 3.8.1 requies HTTPS, see also https://maven.apache.org/docs/3.8.1/release-notes.html
  sed -i 's,http://maven.inria.fr,https://maven.inria.fr,' "${pkgname}-${pkgver}/pom.xml"
  # dirty hack to specify jpackage --type arg
  sed -i 's,<commandlineArgs>--name LaTeXDraw,<commandlineArgs>--name LaTeXDraw --type deb,' "${pkgname}-${pkgver}/pom.xml"
}

build() {
  cd "${pkgname}-${pkgver}"
  mvn --batch-mode -DskipTests package
}


package() {
  dpkg -x "${pkgname}-${pkgver}/target/${pkgname}_${pkgver}-1_amd64.deb" "${pkgdir}"
  install -d ${pkgdir}/usr/bin
  ln -sf "/opt/latexdraw/bin/LaTeXDraw" "${pkgdir}/usr/bin/LaTeXDraw"
  install -Dm644 "${pkgdir}/opt/latexdraw/lib/latexdraw-LaTeXDraw.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
# vim:set ts=2 sw=2 et:
