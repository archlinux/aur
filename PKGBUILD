# Maintainer: Lone_Wolf lonewolf@xs4all.nl
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Nelson Menon <nelsonmenon@gmail.com insanatorium.wordpress.com>

pkgname=freecol-git
pkgver=0.15794.fcb19e04f
pkgrel=1
pkgdesc="A turn-based strategy game based on Colonization, git version build against java11 "
arch=('any')
url="http://www.freecol.org/"
license=('GPL')
depends=('java-environment=11' 'bash')
makedepends=('git' 'ant' 'junit' 'texlive-core')
source=("$pkgname::git+https://git.code.sf.net/p/freecol/git"
        'freecol-git.sh')
sha512sums=('SKIP'
            'bb7a55738b5d15dfdb49cbe6355241fedcbe73ad24ec4c0773fcd08f2d82b14b1390e134b0ab0fbe98e1f832410bb5ffba1d88fbd64b3917b9abc5fe24596c57')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "${srcdir}/${pkgname}"
  ant -Djava.target.version=11 package print-manual desktop-entry
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 FreeCol.jar "${pkgdir}/usr/share/java/${pkgname}/FreeCol.jar"
  # install manual
  install -Dm644 doc/FreeCol.pdf "${pkgdir}/usr/share/doc/${pkgname}/FreeCol.pdf"
  # install icon and .desktopfile
  install -Dm644 packaging/common/freecol.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  sed -e 's:Name=FreeCol:Name=Freecol-git:' \
      -e 's:Exec=freecol:Exec=/usr/bin/freecol-git:' \
      -e 's:Icon=data/freecol.png:Icon=/usr/share/pixmaps/freecol-git.xpm:' \
      <dist/base/freecol/freecol.desktop >"${pkgname}.desktop"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # copy necessary files and correct some permissions
  cp -r data jars "${pkgdir}/usr/share/java/${pkgname}/"
  find "${pkgdir}/usr/share/java/${pkgname}" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/java/${pkgname}" -type f -exec chmod 644 '{}' \;
  # install shell script to start application
  install -Dm755 "${srcdir}/freecol-git.sh" "${pkgdir}/usr/bin/${pkgname}"
  # clean up git leftovers
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}

