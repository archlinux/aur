# Maintainer: Lone_Wolf lonewolf@xs4all.nl
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Nelson Menon <nelsonmenon@gmail.com insanatorium.wordpress.com>

pkgname=freecol-git
pkgver=0.15813.1ce7690fa
pkgrel=1
pkgdesc="A turn-based strategy game based on Colonization, git version build against java11 "
arch=('any')
url="http://www.freecol.org/"
license=('GPL')
makedepends=('git' 'ant' 'junit' 'texlive-core' 'java-environment-openjdk=11')
source=("$pkgname::git+https://git.code.sf.net/p/freecol/git"
        'freecol-git.sh')
sha512sums=('SKIP'
            '1534ddff8427045577aaf14277142e4fbf6857a4ecf6221fcf4e42b747ac2cbd307a9a54a75b110bd0577e7b033ef2a66574d6e7f648c2966d9a5d3cfb0e2027')

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
    cd "${srcdir}/${pkgname}"
    ant -Djava.target.version=11 package print-manual desktop-entry
}

package() {
depends=('java-runtime-openjdk=11' 'bash')
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

