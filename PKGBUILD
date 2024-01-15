# Maintainer: Lone_Wolf lonewolf@xs4all.nl
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Nelson Menon <nelsonmenon@gmail.com insanatorium.wordpress.com>

# java 11 is current minimum & recommended version for building/playing freecol, but at runtime newer versions should work also.

pkgname=freecol-git
pkgver=0.16652.031fa8159
pkgrel=2
pkgdesc="A turn-based strategy game based on Colonization, git version"
arch=('any')
url="http://www.freecol.org/"
license=('GPL-2.0-or-later')
makedepends=('git' 'ant' 'junit' 'texlive-core' 'java-environment-openjdk=11')
source=("$pkgname::git+https://git.code.sf.net/p/freecol/git"
        'freecol-git.sh'
)
sha512sums=('SKIP'
            'ddaf6ee6841fc99143b5cb53e88f3d377143c84c7785d2564d864040da47f086d16c443188377139d164aac49ea57a78fd355676949cb93e5e3c9678b59128fd')

pkgver() {
    cd $pkgname
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
    cd $pkgname
    ant -Djava.target.version=11 package print-manual desktop-entry
}

package() {
depends=('java-runtime-openjdk>=11' 'bash')
    cd $pkgname
    install -Dm644 FreeCol.jar "${pkgdir}/usr/share/java/${pkgname}/FreeCol.jar"
    # install manual
    install -Dm644 www.freecol.org/docs/FreeCol.pdf "${pkgdir}/usr/share/doc/${pkgname}/FreeCol.pdf"
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

