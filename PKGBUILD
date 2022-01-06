# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=seiscomp
pkgver=4.8.2
pkgrel=3
pkgdesc="A seismological software for data acquisition, processing, distribution and interactive analysis."
arch=('x86_64')
url="https://github.com/SeisComP"
license=('AGPL3')
depends=('boost-libs' 'inetutils' 'libxml2' 'mariadb' 'ncurses' 'openssl' 'python' 'python-dateutil' 'python-numpy' 'python-twisted' 'qt5-base' 'qt5-svg' 'sqlite')
makedepends=('boost' 'cmake' 'gcc-fortran' 'git' 'libmariadbclient' 'postgresql-libs')
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
        "${pkgname}-contrib-sed-${pkgver}.tar.gz::${url}/contrib-sed/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}-sysusers.conf"
        "${pkgname}-tmpfiles.conf")
sha256sums=('8b09d09a07505869e6e90a0d58650ab899fa61225cf4e848c4c7d2701ef7a0f3'
            'e37817760802224a965ec40fa023ea8998e5c340b783eb7bd45bbb1b4c71cde8'
            '7609dddd24da735c8bd29bf9001cc60aede154a160e07419a1c3878f2119dc9c'
            'e4c270884169a4adce6d8002451443b12534653205825c6e27d7f41350d96a26'
            'a3ebd77d29494eee74328f4d7166721441eb78746fa961c2976a8fc2868531d1'
            'fd7bb441b0ebfdd0d09245c7c51b637cf9df8575242ac10cb03383090a94ce5e'
            'cc18310617b436ee636a8cf476ef364c09dee9ac640ce8428737fd8dfa952703'
            '0d2351adb565ccd4ca356214cef2f985d3bdeed0a4b07537b21af66495b7c61f'
            'e8195d8cebe4a134d6054fb3cbf6fea9e5284d96192c957c9079059e4b463016'
            '4cdce628264921efa947ddccba19cf5fd2d6af21a9b23e6fbe8972558a27f182'
            '312911098291e60a40d4f3fd455b9a40b2d9b3489a589fb927fb6fc0b9ac2dd2')

scmodules=('seedlink' 'common' 'main' 'extras' 'contrib-gns' 'contrib-ipgp' 'contrib-sed')
prepare() {
    for scmod in "${scmodules[@]}"
    do
        cp -r "${scmod}-${pkgver}" "${pkgname}-${pkgver}/src/base/${scmod}"
    done
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
    -DSC_DOC_GENERATE='OFF'
    make
}

package() {
    cd "${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}/" install
    install -D -m 644 "../src/system/apps/${pkgname}/share/shell-completion/${pkgname}.bash" \
        "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -D -m 644 "../src/system/apps/${pkgname}/share/shell-completion/${pkgname}.fish" \
        "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    cd ${srcdir}
    install -D -t "${pkgdir}/etc/profile.d/" -m 755 "${pkgname}.sh"
    install -D -m 644 "${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -D -m 644 "${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    chmod -R g+w "${pkgdir}/opt/${pkgname}"
}
# vim:set ts=4 sw=4 et:
