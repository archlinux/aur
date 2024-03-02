# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=latexdraw
pkgver=4.0.3
pkgrel=7
pkgdesc='A vector drawing editor for LaTeX (JavaFX)'
arch=('x86_64')
url='http://latexdraw.sourceforge.net'
license=('GPL-3.0-or-later')
makedepends=(
  'dpkg'
  'java-environment=14'
  'maven'
)
optdepends=(
  'ttf-droid: font for CJK characters'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/latexdraw/latexdraw/archive/${pkgver}.tar.gz"
        "0001-use-rxjavafx-from-jitpack.io.patch"
)
sha512sums=('a2b5a7438c43fab1cb840e4eb521dab78369fb5ee78ebb138d6b6e8f8bf07d51d62ca54d3689ee82dd57e1dfb34e2773cc439fdb1221aaf0614d2ba6d161566c'
            '64f5bd990dc5c773048161a9a5ea4da5db4680024d054dbc50b6105fc4516ea779c726c649a73313db18b407f9efa3c27c0eb0b5c7711c15b0772cb4081a4f8f')

prepare() {
  # dirty hack to specify jpackage --type arg
  sed -i 's,<commandlineArgs>--name LaTeXDraw,<commandlineArgs>--name LaTeXDraw --type deb,' "${pkgname}-${pkgver}/pom.xml"
  cd "${pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/0001-use-rxjavafx-from-jitpack.io.patch
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

