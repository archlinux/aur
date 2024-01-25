# Maintainer: taotieren <admin@taotieren.com>

pkgname=appimage-installer
pkgver=2.0beta2
pkgrel=3
pkgdesc="AppImage install tool."
arch=('x86_64')
url="https://gitee.com/deepin-opensource/appimage-installer"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
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
source=("${pkgname}::git+${url}.git#commit=259510fdeee02e97f71b51c51e9cacb8f1750171")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    qmake ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler
    make
}

package() {
    cd "${srcdir}/${pkgname}"
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
