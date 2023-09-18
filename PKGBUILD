# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=seiscomp
pkgver=5.5.5
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
sha256sums=('f57d73cee3a148a9a56c9887bba405a5fee5709e49338e56d7f70fe13d3f2b88'
            '3347229401e2a0637be5db21e34f0430c0e70bd8252de5ec40d0cac39590b2c0'
            'b1d2f3dd597a8f9a85ab0089a7482ae7bc881a0a38ee419afd3030879ba34ba2'
            '3a5ad86c2fc33aa3a7a041ca7869742be125258e573878caf68f62a97d473b75'
            'a3d8506480f1cc3bba5263f1721e1b2cfa0415d33e64d52e5d619e01ada09426'
            '63751c8bd978b20232316ac6b3083b2df2bc9c416b6e2a1de821e491c118d354'
            'da929ed5f86e17f497cbb767ffce4d0a9d14dab30a8ca41b078d444b06cb9daf'
            '914d56d112e093df9d8d8f21e55db18970290789700141bcec163b0bca82852f'
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
