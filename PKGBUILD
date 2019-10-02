# Maintainer: Maël Kerbiriou <m431.kerbiriou@MountainView>

pkgname=qtcreator-meson-plugin-git
_pkgname=qtcreator-meson-plugin
pkgver=r114.7fd2aa8
pkgrel=1
pkgdesc="Meson build system integration for Qt Creator"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="https://github.com/qtcreator-meson-plugin/qtcreator-meson-plugin"
license=('MIT')
depends=('qtcreator')
optdepends=('meson')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'qtcreator-src')
source=("$_pkgname"::git+https://github.com/qtcreator-meson-plugin/qtcreator-meson-plugin.git)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    # use the revision count.hash
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    qmake IDE_SOURCE_TREE=/usr/src/qtcreator IDE_BUILD_TREE=/usr \
        LLVM_INSTALL_DIR=/usr QBS_INSTALL_DIR=/usr \
        KSYNTAXHIGHLIGHTING_LIB_DIR=/usr/lib KSYNTAXHIGHLIGHTING_INCLUDE_DIR=/usr/include/KF5/KSyntaxHighlighting \
        CONFIG+=journald QMAKE_CFLAGS_ISYSTEM=-I \
        DEFINES+=QBS_ENABLE_PROJECT_FILE_UPDATES \
        mesonprojectmanager.pro

    make
}

package() {
    cd "${srcdir}/${_pkgname}"

    make INSTALL_ROOT="${pkgdir}/usr" install

    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
