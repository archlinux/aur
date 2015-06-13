pkgname=brlcad
pkgver=7.24.2
pkgrel=1
pkgdesc='An extensive 3D solid modeling system.'
url='http://brlcad.org'
license=('LGPL' 'BSD' 'custom:BDL')
arch=('i686' 'x86_64')
depends=('qt5-base')
makedepends=('cmake')
install="${pkgname}.install"
source=('build.patch' "http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('SKIP' 'f2169af59d402de7b51f64e66604fc396aaaa60b28c262545501ea3eb5175487')


_pkgprefix='/opt/brlcad'


prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch --strip=0 "--input=${srcdir}/build.patch"
}


build() {
    mkdir "${srcdir}/${pkgname}-build"
    cd "${srcdir}/${pkgname}-build"
    cmake -Wno-dev "${srcdir}/${pkgname}-${pkgver}" "-DCMAKE_INSTALL_PREFIX=${_pkgprefix}" \
        -DBRLCAD_ENABLE_COMPILER_WARNINGS=OFF -DBRLCAD_ENABLE_STRICT=OFF -DCMAKE_BUILD_TYPE=Release \
        -DBRLCAD_BUNDLED_LIBS=ON -DBRLCAD_PNG=SYSTEM -DBRLCAD_ZLIB=SYSTEM
    make
}


package() {
    cd "${srcdir}/${pkgname}-build"
    make "DESTDIR=${pkgdir}" install
    install -D --mode=u=rw,go=r share/doc/legal/bsd.txt "${pkgdir}/usr/share/licenses/${pkgname}/bsd.txt"
    install -D --mode=u=rw,go=r share/doc/legal/bdl.txt "${pkgdir}/usr/share/licenses/${pkgname}/bdl.txt"

    mkdir --parents "${pkgdir}/etc/profile.d"
    echo "export PATH=\"\$PATH:${_pkgprefix}/bin\"" >"${pkgdir}/etc/profile.d/${pkgname}.sh"
    chmod u=rwx,go=rx "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
