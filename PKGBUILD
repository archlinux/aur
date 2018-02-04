# Maintainer: Alexander Drozdov <adrozdoff@gmail.com>
pkgname=qtcreator-cmakeprojectmanager2-plugin-opt-git
pkgver=4.5.0.r828.4ab745b
_pkgcommit=4ab745b68f151cb3e851d7e90a78983ad6baa771
_pkgbranch=master
_qtc_version=4.5.0.r967
pkgrel=1
pkgdesc="Enhanced CMake Project Manager plugin for Qt Creator."
arch=(i686 x86_64)
url="https://github.com/h4tr3d/cmakeprojectmanager2"
license=('GPL')
groups=('qtcreator-opt-git')
depends=("qtcreator-opt-git>=${_qtc_version}")
makedepends=('git')
# debug+strip to provide ${pkgname}-debug package
options=('docs' 'debug' 'strip')
source=("$pkgname::git+https://github.com/h4tr3d/cmakeprojectmanager2.git#commit=${_pkgcommit}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    local REV=$(git rev-parse --short HEAD)
    local CNT=$(git rev-list --count $_pkgbranch)
    #local QTC_VER=$(cat /usr/src/qtcreator-opt-git/qtcreator.pri | grep '^QTCREATOR_VERSION' | awk '{print $3}')
    local QTC_VER=$(echo ${_qtc_version} | sed 's|\.r[0-9]\+$||')

    printf "%s" ${QTC_VER}.r${CNT}.${REV}
}

prepare() {
    # TODO: to complete build directory clean up user must run 'makepkg -C'
    #[[ -d builddir ]] && rm -r builddir
    mkdir builddir || true
}

build() {
    cd builddir

    export QTC_SOURCE=/usr/src/qtcreator-opt-git
    export QTC_BUILD=/opt/qtcreator-git
    qmake IDE_PACKAGE_MODE=1 \
        PREFIX=/opt/qtcreator-git \
        LIBS+=-L${QTC_BUILD}/lib/qtcreator \
        LIBS+=-L${QTC_BUILD}/lib/qtcreator/plugins \
        "${srcdir}/${pkgname}/cmakeprojectmanager.pro"

    make
}

package() {
    (
        cd builddir
        export QTC_SOURCE=/usr/src/qtcreator-opt-git
        export QTC_BUILD=/opt/qtcreator-git
        make INSTALL_ROOT="${pkgdir}/opt/qtcreator-git" install
    )

    cd "${pkgname}"

    # Install headers for development
    mkdir -p ${pkgdir}/usr/src/qtcreator-opt-git/src/plugins/cmakeprojectmanager2
    cp *.h *.pri ${pkgdir}/usr/src/qtcreator-opt-git/src/plugins/cmakeprojectmanager2/
}
