# Maintainer: Tobias Zindl <zie dot develop at gmail dot com>

pkgname=qtcreator-minimap-plugin-git
pkgver=r18.57476c3
pkgrel=2
pkgdesc="Minimap for QtCreator"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="https://github.com/Longhanks/qtcreator-plugin-minimap"
license=('LGPL2')
depends=('qtcreator' )
provides=('qtcreator-minimap-plugin')
conflicts=('qtcreator-minimap-plugin')
makedepends=('git' 'qtcreator-src')
source=("$pkgname"::git+https://github.com/Longhanks/qtcreator-plugin-minimap.git)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    # use the revision count.hash
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {        
   mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "$srcdir/${pkgname%}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQTCREATOR_SRC="/usr/src/qtcreator" \
        -DQTCREATOR_BIN="/usr/bin/qtcreator"
        
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install

    install -D -m644 "${srcdir}/${pkgname%}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname-git}/LICENSE"
}
