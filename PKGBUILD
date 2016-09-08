# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgbase="percolator-git"
pkgname=('percolator-git' 'percolator-converters-git' 'elude-git')
pkgver=3.00.r3.g5fda027
pkgrel=1
pkgdesc="Software for postprocessing of shotgun proteomics data + format converters + Elude tool"
url="http://per-colator.com/"
license=('Apache')
depends=('xerces-c' 'sqlite')
arch=('x86_64')
makedepends=('git' 'xsd' 'cmake' 'boost' 'zlib')
source=('source::git+https://github.com/percolator/percolator'
        'percolator.patch')
md5sums=('SKIP'
         '4e1432640f09fa3dc2f3d9894ec380f4')

pkgver() {
    cd "${srcdir}/source"
    git describe --match='rel*' --tags | sed 's/\([^-]*-g\)/r\1/;s/rel-//;s/-/./g'
}

prepare() {
    cd "${srcdir}/source"
    patch -p1 -i "$srcdir/${pkgname%-git}.patch"
    cd "$BUILDDIR"
    for d in "${pkgname[@]}"; do
        mkdir "${d%-git}"
    done
}

build() {
    export HARDENING_PIE=0
    cd "$BUILDDIR/${pkgname[0]%-git}"
    echo "------------------------"
    echo "Building percolator ..."
    echo "------------------------"
    cmake -DTARGET_ARCH=amd64 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DXML_SUPPORT=ON "${srcdir}/source"
    make
    echo "------------------------"
    echo "Building converters ..."
    echo "------------------------"
    cd "../${pkgname[1]%-git}"
    cmake -DTARGET_ARCH=amd64 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release "${srcdir}/source/src/converters"
    make
    echo "------------------------"
    echo "Building Elude ..."
    echo "------------------------"
    cd "../${pkgname[2]%-git}"
    cmake -DTARGET_ARCH=amd64 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release "${srcdir}/source/src/elude_tool"
    make
}

package_percolator-git() {
    pkgdesc="Percolator and qvality, two post processors for shotgun proteomics data."
    name="${pkgname[0]%-git}"
    provides=("$name")
    conflicts=("$name")

    cd "$BUILDDIR/$name"
    make DESTDIR="$pkgdir/" install
}

package_percolator-converters-git() {
    pkgdesc="Parsers of different database search engines to percolator input format."
    name="${pkgname[1]%-git}"
    provides=("$name")
    conflicts=("$name")

    cd "$BUILDDIR/$name"
    make DESTDIR="$pkgdir/" install
}

package_elude-git() {
    pkgdesc="Software package for prediction of retention times in mass spectorometry experiments."
    name="${pkgname[2]%-git}"
    provides=("$name")
    conflicts=("$name")

    cd "$BUILDDIR/$name"
    make DESTDIR="$pkgdir/" install
}
