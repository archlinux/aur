# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=seiscomp-git
pkgver=5.0.1.r0.g9235548
pkgrel=1
pkgdesc="A seismological software for data acquisition, processing, distribution and interactive analysis (GitHub version)."
arch=('x86_64')
url="https://github.com/SeisComP"
license=('AGPL3')
depends=('boost-libs' 'inetutils' 'libxml2' 'mariadb' 'ncurses' 'openssl' 'python' 'python-dateutil' 'python-numpy' 'python-twisted' 'qt5-base' 'qt5-svg' 'sqlite')
makedepends=('boost' 'cmake' 'gcc-fortran' 'git' 'libmariadbclient' 'python-myst-parser' 'python-sphinx' 'python-sphinxcontrib-bibtex' 'postgresql-libs')
optdepends=("${pkgname%-git}-maps: for SeisComp default map files"
            "nmxptool: for seedlink nmxp plugin"
            "postgresql: for using PostgreSQL database")
provides=("${pkgname%-git}" "${pkgname%-git}-docs")
conflicts=("${pkgname%-git}" "${pkgname%-git}-docs")
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${url}/seiscomp.git"
		"${pkgname%-git}/src/base/seedlink::git+${url}/seedlink.git"
		"${pkgname%-git}/src/base/common::git+${url}/common.git"
		"${pkgname%-git}/src/base/main::git+${url}/main.git"
		"${pkgname%-git}/src/base/extras::git+${url}/extras.git"
		"${pkgname%-git}/src/base/contrib-gns::git+${url}/contrib-gns.git"
		"${pkgname%-git}/src/base/contrib-ipgp::git+${url}/contrib-ipgp.git"
		"${pkgname%-git}/src/base/contrib-sed::git+https://github.com/swiss-seismological-service/sed-SeisComP-contributions.git"
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
            'be8a26d9ac60c17b1ee56207f82e7e3ca5c5c2249ab24ce75c4ac25f952a0ee1'
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
        mv "${scmod}" "${pkgname%-git}/src/base/${scmod}"
    done
    sed -i 's/m2r2/myst_parser/g' "${pkgname%-git}/doc/templates/conf.py"
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
    cd "${srcdir}/${pkgname%-git}/src/system/apps/${pkgname%-git}/share/shell-completion"
    install -D -m 644 "${pkgname%-git}.bash" \
        "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}"
    install -D -m 644 "${pkgname%-git}.fish" \
        "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname%-git}.fish"
    cd ${srcdir}
    install -D -t "${pkgdir}/etc/profile.d/" -m 755 "${pkgname%-git}.sh"
    install -D -m 644 "${pkgname%-git}-sysusers.conf" \
        "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
    install -D -m 644 "${pkgname%-git}-tmpfiles.conf" \
        "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-git}.conf"
    chmod -R u=rwX,g=rwX,o=rX "${pkgdir}/opt/${pkgname%-git}"
    find "${pkgdir}/opt/${pkgname%-git}" -type d -exec chmod g+s '{}' \;
}
# vim:set ts=4 sw=4 et:
