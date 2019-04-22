# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=qtcreator-cppcheck-plugin-git
pkgver=r154.dbd8725
pkgrel=1
pkgdesc="QtCreator plugin using cppcheck"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="https://github.com/OneMoreGres/qtc-cppcheck"
license=('MIT')
depends=('qtcreator' 'cppcheck')
provides=('qtcreator-cppcheck-plugin')
conflicts=('qtcreator-cppcheck-plugin')
makedepends=('git' 'qtcreator-src')
source=("$pkgname"::git+https://github.com/OneMoreGres/qtc-cppcheck.git)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    # use the revision count.hash
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build qmake \
        "LIBS+=-L/usr/lib/qtcreator/ -L/usr/lib/qtcreator/plugins" \
        "QMAKE_EXTRA_COMPILERS+=lrelease" \
        "lrelease.input=TRANSLATIONS" \
        "lrelease.output=\${QMAKE_FILE_PATH}/\${QMAKE_FILE_BASE}.qm" \
        "lrelease.commands=\$\$[QT_INSTALL_BINS]/lrelease \${QMAKE_FILE_IN} -qm \${QMAKE_FILE_PATH}/\${QMAKE_FILE_BASE}.qm" \
        "lrelease.CONFIG+=no_link" \
        "PRE_TARGETDEPS+=compiler_lrelease_make_all" \
        "KSYNTAXHIGHLIGHTING_LIB_DIR=/usr/lib" "KSYNTAXHIGHLIGHTING_INCLUDE_DIR=/usr/include/KF5/KSyntaxHighlighting"

    make
}

package() {
    cd "${srcdir}/${pkgname}"

    make INSTALL_ROOT="${pkgdir}/usr" install

    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -m755 -d "${pkgdir}/usr/share/qtcreator/translations"
    install -m644 ./translation/*.qm "${pkgdir}/usr/share/qtcreator/translations/"
}
