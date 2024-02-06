# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=seiscomp
pkgver=6.2.0
pkgrel=1
pkgdesc='A seismological software for data acquisition, processing, distribution and analysis.'
arch=('x86_64')
url="https://github.com/SeisComP"
_sssurl="https://github.com/swiss-seismological-service"
license=('AGPL3')
depends=('boost-libs' 'inetutils' 'libxml2' 'mariadb' 'ncurses' 'openssl' 'python' 'python-dateutil' 'python-numpy' 'python-twisted' 'qt5-base' 'qt5-svg' 'sqlite')
makedepends=('boost' 'cmake' 'gcc-fortran' 'libmariadbclient' 'postgresql-libs')
optdepends=("${pkgname}-maps: for SeisComp default map files"
            "${pkgname}-docs: for SeisComp documentations files"
            "postgresql: for using PostgreSQL database")
install="${pkgname}.install"
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
sha256sums=('6fe8e82a179cc246e3c323bbc6926371917900e90ef7e82c5dbaca905db2e11f'
            'c892290b9783e75756a93723ca9f3604cfa42d3569dc74f140d6ca30da12db79'
            '600b4c050c9da877b1be17576c8e287860d847fa93668173383f84e742b3af89'
            'df752fd68d54ab6cd3243e38b6e80bf29bcbc1594e32ce7d3c17c049f398524f'
            '0c90943bc8edf512d35bc246d6e41407b53080dea72be28ba7313b5eea609480'
            '605e37d4c5cc5586ad77d10c7a400f6df3d494aa320661694b291bed6ff5988d'
            'd0258b08a7c32f879c6fcc1653bb3f8ddc141724193470e79bb8ace44b8f4b23'
            '599ba385c14e081b35e240f5bd9f8e0fcad5de1a6a8dc39f03d86b1f5a63c756'
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

    [[ -d build ]] && rm -rf build
    mkdir build && cd build

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
