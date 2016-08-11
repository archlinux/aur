pkgname=brlcad
pkgver=7.26.0
pkgrel=0
pkgdesc='An extensive 3D solid modeling system.'
url='http://brlcad.org'
license=('LGPL' 'BSD' 'custom:BDL')
arch=('i686' 'x86_64')
depends=('libgl' 'libxft' 'libxi')
makedepends=('cmake')
install="${pkgname}.install"
source=('build.patch' "http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('SKIP' 'e02621f15743a3e41d4264d05204f8d776e611aaca58204489f0b3484e635577')


_pkgprefix="/opt/${pkgname}"


prepare() {
    patch --strip=0 "--directory=${srcdir}/${pkgname}-${pkgver}" "--input=${srcdir}/build.patch"
}


build() {
    mkdir "${srcdir}/build"
    cd "${srcdir}/build"
    cmake -Wno-dev "${srcdir}/${pkgname}-${pkgver}" "-DCMAKE_INSTALL_PREFIX=${_pkgprefix}" \
        -DBRLCAD_ENABLE_COMPILER_WARNINGS=OFF -DBRLCAD_ENABLE_STRICT=OFF \
        -DCMAKE_BUILD_TYPE=Release -DBRLCAD_FLAGS_DEBUG=OFF -DBRLCAD_BUILD_STATIC_LIBS=OFF \
        -DBRLCAD_ENABLE_OPENGL=ON -DBRLCAD_BUNDLED_LIBS=BUNDLED -DBRLCAD_FREETYPE=OFF \
        -DBRLCAD_PNG=OFF -DBRLCAD_REGEX=OFF -DBRLCAD_ZLIB=OFF -DBRLCAD_ENABLE_QT=OFF
    make
}


package() {
    cd "${srcdir}/build"
    make "DESTDIR=${pkgdir}" install
    install -D --mode=u=rw,go=r share/doc/legal/bsd.txt "${pkgdir}/usr/share/licenses/${pkgname}/bsd.txt"
    install -D --mode=u=rw,go=r share/doc/legal/bdl.txt "${pkgdir}/usr/share/licenses/${pkgname}/bdl.txt"

    mkdir --parents "${pkgdir}/etc/profile.d"
    echo "export PATH=\"\$PATH:${_pkgprefix}/bin\"" >"${pkgdir}/etc/profile.d/${pkgname}.sh"
    chmod u=rwx,go=rx "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
