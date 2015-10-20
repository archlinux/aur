# Maintainer: Salamandar <felix@piedallu.me>
pkgname=fof++-git
_gitname=FoF-
pkgver=0.1
pkgrel=1
pkgdesc="Frets On Fire++, a completely new FoF written in c++."
arch=('any')
url="https://github.com/Salamandar/$_gitname.git"
license=('GPL')
groups=('games')
depends=()
makedepends=('git')
depends=('boost-libs' 'gcc-libs')
install=

source=("fof++-git::git+https://github.com/Salamandar/$_gitname")
sha256sums=('SKIP')


pkgver() {
    cd "$srcdir/$_gitname"
    printf "%s.%s" "$( set -o pipefail
        git describe --long --tags 2>/dev/null \
            | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
            | sed -r 's/.([0-9,a-g,A-G]{7}.*)//' ||
        printf "r%s" "$(git rev-list --count HEAD)"
    )" "$(git rev-parse --short HEAD)"
}
package() {
    install -d $pkgdir/usr/
    install -d $pkgdir/usr/share/
    install -d $pkgdir/usr/share/applications/
    install -d $pkgdir/usr/share/pixmaps/
    install -d $pkgdir/usr/bin/
    install -d $pkgdir/opt/

    cp fofix.desktop        ${pkgdir}/usr/share/applications/
    cp fofix.png            ${pkgdir}/usr/share/pixmaps/
    mv ${srcdir}/$pkgname-$pkgver ${pkgdir}/opt/fofix

    cd ${pkgdir}/usr/bin/
    echo "#/bin/sh" > fofix
    echo "cd /opt/fofix/src/" >> fofix
    echo "python2 ./FoFiX.py" >> fofix
    chmod +x fofix
    chmod -R 777 $pkgdir/opt/fofix/
}

build() {
    cd "$srcdir/$pkgname"
    autoreconf -vi
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/$pkgname"
    make -k check
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
