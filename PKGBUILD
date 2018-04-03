# Maintainer: Michal Ulianko <michal (dot) ulianko (at) gmail (dot) com>

_appname=freecad-python3
pkgname=freecad-python3-git
pkgver=0.17_pre.r6798.g85b42a16d
pkgrel=1
pkgdesc='A general purpose 3D CAD modeler'
arch=('x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
depends=('netcdf' 'boost-libs' 'coin-hg' 'med' 'opencascade7' 'python-numpy'
         'xerces-c' 'qt5-svg' 'qt5-webkit' 'jsoncpp' 'hicolor-icon-theme'
         'python-pyside2-git' 'python-pivy-git')
makedepends=('git' 'cmake' 'boost' 'eigen' 'desktop-file-utils' 'qt5-tools'
             'python-pyside2-tools-git')
source=("${_appname}::git+https://github.com/FreeCAD/FreeCAD.git"
        "python_version.patch"
        "FreeCAD-Python3"
        "FreeCADCmd-Python3"
        "freecad-python3.desktop"
        "freecad-python3.xml")
md5sums=('SKIP'
         'c6fcaa9963687bcadf4df8afb44effc5'
         '11de902a9afd6b1e4a6cde867e167bb0'
         '6ef4c2f2e40d5185401819c8e76453e5'
         'bc7b8caca5f8e6b7812f47af2dfa79c6'
         'c2f4154c8e4678825411de8e7fa54c6b')

pkgver() {
    cd "$srcdir/${_appname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${_appname}"
    patch -p1 -i "$srcdir/python_version.patch"
}

build() {
    cd "$srcdir/${_appname}"
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX="/opt/${_appname}" \
          -DBUILD_QT5=ON \
          -DOCC_INCLUDE_DIR="/opt/opencascade7/include/opencascade" \
          -DOCC_LIBRARY_DIR="/opt/opencascade7/lib" \
          -DCMAKE_PREFIX_PATH="/opt/opencascade7" \
          -DCMAKE_INCLUDE_PATH="/opt/opencascade7/include/opencascade" \
          -DCMAKE_LIBRARY_PATH="/opt/opencascade7/lib" \
          -DCMAKE_INSTALL_RPATH="/opt/opencascade7/lib;/usr/lib" \
          -DPYSIDE2RCCBINARY="/usr/bin/pyside2-rcc" \
          -DPYSIDE2UICBINARY="/usr/bin/pyside2-uic"

    make
}

package() {
    cd "${srcdir}/${_appname}"
    local bin="FreeCAD-Python3"
    local bin_cmd="FreeCADCmd-Python3"

    make DESTDIR="${pkgdir}" install

    # Scripts that execute /opt/freecad-qt5/bin/<name>
    install -D -m755 "${srcdir}/${bin}" "${pkgdir}/usr/bin/${bin}"
    install -D -m755 "${srcdir}/${bin_cmd}" "${pkgdir}/usr/bin/${bin_cmd}"

    # Lowercase aliases like the official arch package.
    ln -s "/usr/bin/${bin}" "${pkgdir}/usr/bin/${bin,,}"
    ln -s "/usr/bin/${bin_cmd}" "${pkgdir}/usr/bin/${bin_cmd,,}"

    # Install pixmaps and desktop shortcut.
    install -Dm644 "src/Gui/Icons/freecad-doc.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/application-x-extension-fcstd.svg"
    for i in 16 32 48 64; do
        install -Dm644 "src/Gui/Icons/freecad-icon-${i}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_appname}.png"
    done
    desktop-file-install \
        --dir="${pkgdir}/usr/share/applications" "${srcdir}/${_appname}.desktop"

    # Install mime info.
    install -D -m644 "${srcdir}/${_appname}.xml" \
        "${pkgdir}/usr/share/mime/packages/${_appname}.xml"
}
