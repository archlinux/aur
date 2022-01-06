# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=seiscomp-git
pkgver=4.8.2.r0.g36dc05e
pkgrel=1
pkgdesc="A seismological software for data acquisition, processing, distribution and interactive analysis (GitHub version)."
arch=('x86_64')
url="https://github.com/SeisComP"
license=('AGPL3')
depends=('boost-libs' 'inetutils' 'libxml2' 'mariadb' 'ncurses' 'openssl' 'python' 'python-dateutil' 'python-numpy' 'python-twisted' 'qt5-base' 'qt5-svg' 'sqlite')
makedepends=('boost' 'cmake' 'gcc-fortran' 'git' 'libmariadbclient' 'python-myst-parser' 'python-sphinx' 'postgresql-libs')
optdepends=("${pkgname%-git}-maps: for SeisComp default map files"
            "postgresql: for using PostgreSQL database")
provides=("${pkgname%-git}" "${pkgname%-git}-docs")
conflicts=("${pkgname%-git}" "${pkgname%-git}-docs")
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${url}/seiscomp.git"
		"${pkgname%-git}-seedlink::git+${url}/seedlink.git"
		"${pkgname%-git}-common::git+${url}/common.git"
		"${pkgname%-git}-main::git+${url}/main.git"
		"${pkgname%-git}-extras::git+${url}/extras.git"
		"${pkgname%-git}-contrib-gns::git+${url}/contrib-gns.git"
		"${pkgname%-git}-contrib-ipgp::git+${url}/contrib-ipgp.git"
		"${pkgname%-git}-contrib-sed::git+${url}/contrib-sed.git"
        "${pkgname%-git}.sh"
        "${pkgname%-git}-sysusers.conf"
        "${pkgname%-git}-tmpfiles.conf")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'e8195d8cebe4a134d6054fb3cbf6fea9e5284d96192c957c9079059e4b463016'
            '4cdce628264921efa947ddccba19cf5fd2d6af21a9b23e6fbe8972558a27f182'
            '312911098291e60a40d4f3fd455b9a40b2d9b3489a589fb927fb6fc0b9ac2dd2')
scmodules=('seedlink' 'common' 'main' 'extras' 'contrib-gns' 'contrib-ipgp' 'contrib-sed')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags $(git rev-list --tags --max-count=1) \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    for scmod in "${scmodules[@]}"
    do
        mv "${pkgname%-git}-${scmod}" "${pkgname%-git}/src/base/${scmod}"
    done
    sed -i 's/m2r/myst_parser/g' "${pkgname%-git}/doc/templates/conf.py"
    sed -i 's/\(source_suffix =\).*/\1 ['\''.rst'\'', '\''.md'\'' ]/g' "${pkgname%-git}/doc/templates/conf.py"
    sed -i 's|/base/changelog|changelog </base/CHANGELOG>|g' "${pkgname%-git}/doc/templates/index.rst"
    sed -i '1s/^/```{_sc-changelog:}\n```\n/' "${pkgname%-git}/CHANGELOG.md"
    sed -i 's|pdf/SeisComP.pdf|pdf/latex/SeisComP.pdf|g' "${pkgname%-git}/doc/CMakeLists.txt"
}

build() {
    cd "${pkgname%-git}"
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
    -DSC_DOC_GENERATE='ON' \
    -DSC_DOC_GENERATE_HTML='ON' \
    -DSC_DOC_GENERATE_MAN='ON'
    #-DSC_DOC_GENERATE_PDF='ON'
    make
}

package() {
    cd "${pkgname%-git}/build"
    make DESTDIR="${pkgdir}/" install
    install -D -m 644 "../src/system/apps/${pkgname%-git}/share/shell-completion/${pkgname%-git}.bash" \
        "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}"
    install -D -m 644 "../src/system/apps/${pkgname%-git}/share/shell-completion/${pkgname%-git}.fish" \
        "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname%-git}.fish"
    cd ${srcdir}
    install -D -t "${pkgdir}/etc/profile.d/" -m 755 "${pkgname%-git}.sh"
    install -D -m 644 "${pkgname%-git}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
    install -D -m 644 "${pkgname%-git}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-git}.conf"
    chmod -R g+w "${pkgdir}/opt/${pkgname%-git}"
}
# vim:set ts=4 sw=4 et:
