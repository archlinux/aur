# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=seiscomp
pkgver=5.0.1
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
sha256sums=('124caee6be123c4c982a4bb7c832d95a4d87300b5641a4b6c71f01cf152e1743'
            '9d9a4a3fa29788df5387a3612202ec50de383f62130c5fbf544141faeb2be421'
            '2fcf05f7f9676bf8072aa32f04b62448d23bbfd8fd5acd113454546d3bb5a5a1'
            '610cd456f5073d527666a1e42ac43c9563ad38247cef8af3b655acd1e16db71a'
            '84cf741d2d97f9f140cd3c07e38303d1de4a056a0f882ef4136709d65bc29cb3'
            'c23d0ad5b1e31923dc002b359a03a8153edb58425eb42fc175e52dbd6a91714e'
            '71fdd8a12c21432fc7b2b3715eea1e14d6c3f4acd43c386d38592286b8c0da92'
            '90f3fe8dcf08366859c23151102dcc2702f29a365d9a5922880e06b307ab07d9'
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
    chmod -R u=rwX,g=rwX,o=rX "${pkgdir}/opt/${pkgname}"
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod g+s '{}' \;
}
# vim:set ts=4 sw=4 et:
