# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>

pkgname=soci-git
pkgname_=soci
pkgver=4.0.0.r0.g3742c894
pkgrel=1
pkgdesc="Database access library for C++"
arch=('x86_64')
url="http://soci.sf.net"
license=('custom:boost')
depends=('gcc-libs')
makedepends=('cmake' 'postgresql-libs' 'sqlite3' 'unixodbc')
optdepends=('instantclient-basic: support for oracle databases'
            'libmysqlclient: support for mysql databases'
            'postgresql-libs: support for postgresql databases'
            'sqlite3: support for sqlite databases'
            'unixodbc: support for ODBC databases'
            'boost')
provides=("soci=$pkgver")
conflicts=('soci')
source=("git+https://github.com/SOCI/soci.git#branch=release/4.0")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname_}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    mkdir -p "${srcdir}/${pkgname}-build"
    cd "${srcdir}/${pkgname}-build"
    cmake \
        -DSOCI_TESTS=OFF \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_CXX_FLAGS="-Wno-format-overflow" \
        "${srcdir}/${pkgname_}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-build"
    make DESTDIR="${pkgdir}" install

    # For some reason -DLIBDIR=lib causes libsoci_empty.so to disappear
    if [ -e "${pkgdir}/usr/lib64" ]; then
        mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
    fi
    install -Dm0644 "${srcdir}/${pkgname_}/LICENSE_1_0.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
