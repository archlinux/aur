# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgbase="percolator-git"
pkgname=('percolator-git' 'percolator-converters-git')
pkgver=3.05.r140.g74a8b157
pkgrel=1
pkgdesc="Software for postprocessing of shotgun proteomics data + format converters"
url="http://percolator.ms/"
license=('Apache')
depends=('xerces-c' 'sqlite' 'libtirpc-compat' 'boost')
arch=('x86_64')
makedepends=('git' 'xsd' 'cmake' 'zlib')
source=('source::git+https://github.com/percolator/percolator')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/source"
    git describe --match='rel*' --tags | sed 's/\([^-]*-g\)/r\1/;s/rel-//;s/-/./g'
}

prepare() {
    cd "${srcdir}/source"
    cd "$BUILDDIR"
    for d in "${pkgname[@]}"; do
        mkdir -p "${d%-git}"
        rm -rf "${d%-git}"/*
    done
}

build() {
    export HARDENING_PIE=0
    cd "$BUILDDIR/${pkgname[0]%-git}"
    echo "------------------------"
    echo "Building percolator ..."
    echo "------------------------"
    echo "Running cmake for percolator ..."
    echo "................................"
    cmake -DTARGET_ARCH=x86_64 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DXML_SUPPORT=ON -DCMAKE_PREFIX_PATH="/usr/include;/usr/lib" -DCMAKE_CXX_FLAGS="-l tirpc" "${srcdir}/source"
    echo "Running make for percolator ..."
    echo "..............................."
    make -j 4
    echo "------------------------"
    echo "Building converters ..."
    echo "------------------------"
    cd "../${pkgname[1]%-git}"
    echo "Running cmake for percolator-converters ..."
    echo "..........................................."
    cmake -DTARGET_ARCH=x86_64 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release "${srcdir}/source/src/converters"
    echo "Running make for percolator-converters ..."
    echo ".........................................."
    make -j 4
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


