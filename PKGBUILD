# Maintainer: Alexander Drozdov <adrozdoff@gmail.com>
pkgname=qtcreator-cmakeprojectmanager2-plugin-opt-git
pkgver=20170629.r706.1945b3a
_pkgcommit=1945b3a0e9dc95c387eed057f2228e25c56e9a58
_pkgbranch=master
pkgrel=2
pkgdesc="Enhanced CMake Project Manager plugin for Qt Creator."
arch=(i686 x86_64)
url="https://github.com/h4tr3d/cmakeprojectmanager2"
license=('GPL')
groups=('qtcreator-opt-git')
depends=('qtcreator-opt-git>=4.3.0.r592')
makedepends=('git')
#provides=("${pkgname%-VCS}")
#conflicts=("${pkgname%-VCS}")
#replaces=()
#backup=()
# debug+strip to provide ${pkgname}-debug package
options=('docs' 'debug' 'strip')
#install=
source=("$pkgname::git+https://github.com/h4tr3d/cmakeprojectmanager2.git#commit=${_pkgcommit}")
#noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    local REV=$(git rev-parse --short HEAD)
    local CNT=$(git rev-list --count $_pkgbranch)
    local DAT=$(date +%Y%m%d)

    printf "%s" $DAT.r$CNT.$REV
}

prepare() {
    #[[ -d builddir ]] && rm -r builddir
    #mkdir builddir
    true
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
