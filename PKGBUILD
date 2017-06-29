# Maintainer: Alexander Drozdov <adrozdoff@gmail.com>
pkgname=qtcreator-cmakeprojectmanager2-plugin-opt-git
pkgver=4.3.82.r706.1945b3a
_pkgcommit=1945b3a0e9dc95c387eed057f2228e25c56e9a58
_pkgbranch=master
pkgrel=1
pkgdesc="Enhanced CMake Project Manager plugin for Qt Creator."
arch=(i686 x86_64)
url="https://github.com/h4tr3d/cmakeprojectmanager2"
license=('GPL')
groups=('qtcreator-opt-git')
depends=('qtcreator-opt-git>=4.3.0.r592')
makedepends=('git')
# debug+strip to provide ${pkgname}-debug package
options=('docs' 'debug' 'strip')
source=("$pkgname::git+https://github.com/h4tr3d/cmakeprojectmanager2.git#commit=${_pkgcommit}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    local REV=$(git rev-parse --short HEAD)
    local CNT=$(git rev-list --count $_pkgbranch)
    local QTC_VER=$(cat /usr/src/qtcreator-opt-git/qtcreator.pri | grep '^QTCREATOR_VERSION' | awk '{print $3}')

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
        make INSTALL_ROOT="${pkgdir}/opt/qtcreator-git" install
    )

    cd "${pkgname}"

    # Install headers for development
    mkdir -p ${pkgdir}/usr/src/qtcreator-opt-git/src/plugins/cmakeprojectmanager2
    cp *.h *.pri ${pkgdir}/usr/src/qtcreator-opt-git/src/plugins/cmakeprojectmanager2/
}
