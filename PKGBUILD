# Maintainer: taotieren <admin@taotieren.com>

pkgname=appimage-installer-git
pkgver=2.0beta2.r0.g259510f
pkgrel=1
pkgdesc="AppImage install tool."
arch=('x86_64')
url="https://gitee.com/deepin-opensource/appimage-installer"
license=('GPLv3')
_pkgname=${pkgname%-git}
provides=(${pkgname} ${_pkgname} appimage-installer-bin)
conflicts=(${pkgname} ${_pkgname} appimage-installer-bin)
#replaces=(${pkgname})
depends=('qt5-tools' 'qt5-webengine' 'dtkwidget' 'dtkgui')
makedepends=('qconf' 'git')
backup=()
options=('!strip')
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
