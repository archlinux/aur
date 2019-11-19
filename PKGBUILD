# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=qtcreator-sourcetrail-plugin-git
pkgver=r80.746c203
pkgrel=2
pkgdesc="Qt Creator Plugin for communication with Sourcetrail"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="https://github.com/CoatiSoftware/qtc-sourcetrail"
license=('MIT')
depends=('qtcreator' 'sourcetrail')
provides=('qtcreator-sourcetrail-plugin')
conflicts=('qtcreator-sourcetrail-plugin')
makedepends=('git' 'qtcreator-src')
source=("$pkgname"::git+https://github.com/CoatiSoftware/qtc-sourcetrail.git)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    # use the revision count.hash
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

     qmake \
        "LIBS+=-L/usr/lib/qtcreator/ -L/usr/lib/qtcreator/plugins" \
        "QMAKE_EXTRA_COMPILERS+=lrelease" \
         qtc-sourcetrail.pro -r "QTC_SOURCE=/usr/src/qtcreator" "QTC_BUILD=build" \
        "KSYNTAXHIGHLIGHTING_LIB_DIR=/usr/lib" \
        "KSYNTAXHIGHLIGHTING_INCLUDE_DIR=/usr/include/KF5/KSyntaxHighlighting" 
        
    make
}

package() {
    cd "${srcdir}/${pkgname}"

    make INSTALL_ROOT="${pkgdir}/usr" install
}
