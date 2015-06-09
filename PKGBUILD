# Maintainer: Lone_Wolf lonewolf@xs4all.nl
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Nelson Menon <nelsonmenon@gmail.com insanatorium.wordpress.com>

pkgbase=freecol-git
pkgname=freecol-git
pkgver=0.11840.2430d51
pkgrel=1
pkgdesc="A turn-based strategy game based on Colonization, git version build against java8 "
arch=('any')
url="http://www.freecol.org/"
license=('GPL')
depends=('java-environment=8' 'bash')
makedepends=('git' 'apache-ant' 'junit' 'texlive-core')
source=("$pkgname::git://git.code.sf.net/p/freecol/git#branch=master"
        'freecol-git.sh')
sha512sums=('SKIP'
            '7edefad3c1f4ccc3f0cebe6b52f8a6c981f4910b937d5dfe731e0a7348982e26a65d38b0257996131120953f860a9f679cafb9bce5a2fbfe3c57d93ae5bba4e5')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "${srcdir}/${pkgname}"
  ant -Djava.target.version=1.8 package print-manual desktop-entry
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

