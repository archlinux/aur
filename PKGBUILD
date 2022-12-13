# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=seiscomp
pkgver=5.2.2
pkgrel=1
pkgdesc="A seismological software for data acquisition, processing, distribution and interactive analysis."
arch=('x86_64')
url="https://github.com/SeisComP"
_sssurl="https://github.com/swiss-seismological-service"
license=('AGPL3')
depends=('boost-libs' 'inetutils' 'libxml2' 'mariadb' 'ncurses' 'openssl' 'python' 'python-dateutil' 'python-numpy' 'python-twisted' 'qt5-base' 'qt5-svg' 'sqlite')
makedepends=('boost' 'cmake' 'gcc-fortran' 'libmariadbclient' 'postgresql-libs')
optdepends=("${pkgname}-maps: for SeisComp default map files"
            "${pkgname}-docs: for SeisComp documentations files"
            "postgresql: for using PostgreSQL database")
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/seiscomp/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}-seedlink-${pkgver}.tar.gz::${url}/seedlink/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}-common-${pkgver}.tar.gz::${url}/common/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}-main-${pkgver}.tar.gz::${url}/main/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}-extras-${pkgver}.tar.gz::${url}/extras/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}-contrib-gns-${pkgver}.tar.gz::${url}/contrib-gns/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}-contrib-ipgp-${pkgver}.tar.gz::${url}/contrib-ipgp/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}-contrib-sed-${pkgver}.tar.gz::${_sssurl}/sed-SeisComP-contributions/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}-sysusers.conf"
        "${pkgname}-tmpfiles.conf")
sha256sums=('5f8b2728b6daf18eaec5eb5cc8f1a17e9d85f85ba609ef4ae3fad703d8ea1794'
            'f7586b26860eee527891d94a1f2ba6236043b0fb22c1052927d09b2f7a444a58'
            'f78479f97c0d9d4e05f4d7d924f8972e4b96e48ef12663dc60c999b83a47d249'
            '40152e0ad3480cc121961b9e038e18f3549191d425737e914bad871cca792cdb'
            'a8928f610d16082859087c488a13aba0ce6033b4030914947e0e4b07e9eac32b'
            'a38d763edb29dafc55dd7bf98f23560284866666717a886c323500be83a4a633'
            'c52965f90477ea1525ec821e411e8b6946a741ff91997eccdb7d8bdea6256770'
            'c5d69734b219e8aae77d63d0ec2a6341b06b3846a3991b8f4c2dcb9cb7576a76'
            'e8195d8cebe4a134d6054fb3cbf6fea9e5284d96192c957c9079059e4b463016'
            'be8a26d9ac60c17b1ee56207f82e7e3ca5c5c2249ab24ce75c4ac25f952a0ee1'
            '312911098291e60a40d4f3fd455b9a40b2d9b3489a589fb927fb6fc0b9ac2dd2')

scmodules=('seedlink' 'common' 'main' 'extras' 'contrib-gns' 'contrib-ipgp')
prepare() {
    for scmod in "${scmodules[@]}"
    do
        cp -r "${scmod}-${pkgver}" "${pkgname}-${pkgver}/src/base/${scmod}"
    done
    cp -r "sed-SeisComP-contributions-${pkgver}" "${pkgname}-${pkgver}/src/base/contrib-sed"

}

build() {
    cd "${pkgname}-${pkgver}"
    mkdir build
    cd build
    cmake .. \
    -DCMAKE_INSTALL_PREFIX='/opt/seiscomp' \
    -DCMAKE_CXX_FLAGS='-fPIC' \
    -DCMAKE_SHARED_LINKER_FLAGS='-fPIC' \
    -DCMAKE_EXE_LINKER_FLAGS='-fPIC -lpthread' \
    -DPYTHON_EXECUTABLE='/usr/bin/python3' \
    -DSC_GLOBAL_PYTHON_WRAPPER_PYTHON3='ON' \
    -DSC_ENABLE_CONTRIB='ON' \
    -DSC_GLOBAL_GUI='ON' \
    -DSC_GLOBAL_GUI_QT5='ON' \
    -DSC_DOC_GENERATE='OFF'
    make
}

package() {
    cd "${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}/" install
    cd "${srcdir}/${pkgname}-${pkgver}/src/system/apps/${pkgname}/share/shell-completion"
    install -D -m 644 "${pkgname}.bash" \
        "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -D -m 644 "${pkgname}.fish" \
        "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    cd ${srcdir}
    install -D -t "${pkgdir}/etc/profile.d/" -m 755 "${pkgname}.sh"
    install -D -m 644 "${pkgname}-sysusers.conf" \
        "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -D -m 644 "${pkgname}-tmpfiles.conf" \
        "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    #chmod -R u=rwX,g=rwX,o=rX "${pkgdir}/opt/${pkgname}"
    #find "${pkgdir}/opt/${pkgname}" -type d -exec chmod g+s '{}' \;
}
# vim:set ts=4 sw=4 et:
