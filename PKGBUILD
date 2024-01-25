# Maintainer: taotieren <admin@taotieren.com>

pkgname=appimage-installer-git
pkgver=2.0beta2.r0.g259510f
pkgrel=1
pkgdesc="AppImage install tool."
arch=('x86_64')
url="https://gitee.com/deepin-opensource/appimage-installer"
license=('GPL-3.0-only')
_pkgname=${pkgname%-git}
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=(
    dtkcore
    dtkwidget
    dtkgui
    gcc-libs
    glibc
    hicolor-icon-theme
    qt5-base
    qt5-svg
    python)
makedepends=(
    git
    qconf
    qt5-tools)
backup=()
options=()
# install=${pkgname}.install
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    qmake ./${_pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -dm0755 "${pkgdir}/usr/bin" \
                    "${pkgdir}/usr/share/applications" \
                    "${pkgdir}/usr/share/icons/hicolor/scalable/apps" \
                    "${pkgdir}/opt/apps/com.appimage-installer/entries/icons/hicolor/scalable/apps/" \
                    "${pkgdir}/opt/apps/com.appimage-installer/files" \
                    "${pkgdir}/opt/apps/com.appimage-installer/files/translations"

    cp -rv "image/logo/appimage-installer.svg" "${pkgdir}/opt/apps/com.appimage-installer/entries/icons/hicolor/scalable/apps/"
    cp -rv appimage-installer runapp.py "${pkgdir}/opt/apps/com.appimage-installer/files"
    cp -rv "debian/opt/apps/com.appimage-installer/entries"  "${pkgdir}/opt/apps/com.appimage-installer"
    cd translations
    cp -rv `ls *.qm` "${pkgdir}/opt/apps/com.appimage-installer/files/translations"

    ln -sf "/opt/apps/com.appimage-installer/files/appimage-installer" "${pkgdir}/usr/bin/appimage-installer"
    ln -sf "/opt/apps/com.appimage-installer/entries/applications/com.appimage-installer.desktop" "${pkgdir}/usr/share/applications/com.appimage-installer.desktop"
    ln -sf "/opt/apps/com.appimage-installer/entries/icons/hicolor/scalable/apps/appimage-installer.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/appimage-installer.svg"
}
