# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin-git
pkgver=r194.0b30298
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('GPL3')
depends=('qtcreator' 'hunspell')
makedepends=('git' 'qtcreator-src')
source=("$pkgname"::git+https://github.com/CJCombrink/SpellChecker-Plugin.git
        qregularexpression-fix.patch)
sha256sums=('SKIP'
            'b8c4a6412ae10a38bf43836cbe3c1a2d9c7b66ad3c5f5fcacb4ed29836d4eed9')

pkgver() {
    cd "${srcdir}/${pkgname}"

    # use the revision count.hash
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"

    patch -Np1 -i "${srcdir}/qregularexpression-fix.patch"
}

build() {
    cd "${srcdir}/${pkgname}"

    QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build qmake \
        "LIBS+=-L/usr/lib/qtcreator/ -L/usr/lib/qtcreator/plugins"
    make
}

package() {
    cd "${srcdir}/${pkgname}"

    make INSTALL_ROOT="${pkgdir}/usr" install
}
