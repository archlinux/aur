# Maintainer: Achmad Fathoni <fathoniDOTidATgmailDOTcom>
# Contributor: Yu-Hsuan Tu <dobe0331 at gmail dot com>
_pkgname=RTKLIB
pkgname=rtklib-qt-git
provides=("rtklib-qt")
pkgver=r203.1be8be2
pkgrel=1
pkgdesc="An Open Source Program Package for GNSS Positioning. QT port."
arch=('x86_64')
url="http://www.rtklib.com/"
license=('BSD')
groups=('GNSS')
depends=('glibc')
makedepends=('git' 'gcc-fortran' 'qt5-base' 'imagemagick')
source=("${_pkgname}::git+https://github.com/JensReimann/RTKLIB.git#branch=rtklib_2.4.3")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
    cd "${srcdir}/${_pkgname}"
    find . -name "*_qt.pro*" -exec sed -i '$ a target.path = /usr/bin\nINSTALLS += target' {} \;

    # Create pro file for qmake
    echo \
"TEMPLATE = subdirs

SUBDIRS= src \\
         app/qtapp \\
         lib

app.depends = src

" > "${srcdir}/${_pkgname}/RTKLib.pro"

}

build() {
    cd "${srcdir}/${_pkgname}"
    qmake -recursive
    make sub-src

    # Prepare icons
    convert "${srcdir}/${_pkgname}/app/qtapp/rtklaunch_qt/rtklaunch_Icon.ico" "${srcdir}/rtklaunch.png"

    # Create Desktop entry
    echo "[Desktop Entry]
Type=Application
Name=RTKLIB Launcher
Comment=RTKLIB Launcher
Exec=rtklaunch_qt
Icon=rtklaunch
Terminal=false
Categories=Science" > "${srcdir}/rtklaunch.desktop"

}

package() {
    make -C ${srcdir}/${_pkgname} sub-app-qtapp-install_subtargets INSTALL_ROOT="${pkgdir}"

    # Move desktop entries
    mkdir -p "${pkgdir}/usr/share/applications/"
    mv "${srcdir}/rtklaunch.desktop" "${pkgdir}/usr/share/applications/"

    # Move icon
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
    mv "${srcdir}/rtklaunch.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/rtklaunch.png"

    # Install licence
    install -Dm644 "${srcdir}"/"${_pkgname}"/LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
