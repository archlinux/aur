# Maintainer: Markus Hovorka <m.hovorka@live.de>
# Contributer: Christian Hesse <mail@eworm.de>

_appname=freecad-qt5
pkgname="${_appname}-git"
pkgver=0.17pre.r4610.gd28bae3f5
pkgrel=2
epoch=1
pkgdesc='A general purpose 3D CAD modeler - git checkout'
arch=('i686' 'x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
depends=('boost-libs' 'curl' 'hicolor-icon-theme' 'libspnav' 'opencascade7'
         'med' 'xerces-c' 'python2-pivy' 'python2-pyside2-git' 'qt5-webkit'
         'qt5-tools' 'libtheora' 'shared-mime-info' 'vtk' 'jsoncpp'
         'netgen-nogui-occ7')
makedepends=('git' 'boost' 'cmake' 'coin' 'python2-pyside2-tools-git'
             'desktop-file-utils' 'eigen' 'gcc-fortran' 'swig')
optdepends=('python2-matplotlib'
            'pycollada-git: Create, edit and load COLLADA documents.')
source=("${pkgname}::git+https://github.com/FreeCAD/FreeCAD.git"
        "FreeCAD-Qt5"
        "FreeCADCmd-Qt5"
        "freecad-qt5.desktop"
        "freecad-qt5.xml")
md5sums=('SKIP'
         '20043b18348679526cf17853cb08f42e'
         '5fe6884bb663b157c8c24f9b00da5337'
         '79457324c2c4602ce0f6d7f4e1188fef'
         'c2f4154c8e4678825411de8e7fa54c6b')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_//'
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX="/opt/${_appname}" \
          -DOCC_INCLUDE_DIR="/opt/opencascade7/include/opencascade" \
          -DOCC_LIBRARY_DIR="/opt/opencascade7/lib" \
          -DCMAKE_PREFIX_PATH="/opt/opencascade7" \
          -DCMAKE_INCLUDE_PATH="/opt/opencascade7/include/opencascade" \
          -DCMAKE_LIBRARY_PATH="/opt/opencascade7/lib" \
          -DCMAKE_INSTALL_RPATH="/opt/opencascade7/lib;/usr/lib" \
          -DPYTHON_EXECUTABLE="/usr/bin/python2" \
          -DPYTHON_EXTENSION_SUFFIX="-python2.7" \
          -DPYTHON_BASENAME="-python2.7" \
          -DPYSIDEUIC4BINARY="/usr/bin/python2-pyside2-uic" \
          -DBUILD_FEM_NETGEN=1 \
          -DBUILD_QT5=ON

    make
}

package() {
    cd "${srcdir}/${pkgname}"
    local bin="FreeCAD-Qt5"
    local bin_cmd="FreeCADCmd-Qt5"

    make DESTDIR="${pkgdir}" install
	
    # Scripts that execute /opt/freecad-qt5/bin/<name>
    install -D -m755 "${srcdir}/FreeCAD-Qt5" "${pkgdir}/usr/bin/${bin}"
    install -D -m755 "${srcdir}/FreeCADCmd-Qt5" "${pkgdir}/usr/bin/${bin_cmd}"

    # Lowercase aliases like the official arch package.
    ln -s "/usr/bin/${bin}" "${pkgdir}/usr/bin/${bin,,}"
    ln -s "/usr/bin/${bin_cmd}" "${pkgdir}/usr/bin/${bin_cmd,,}"

    # Install pixmaps and desktop shortcut.
    for i in 16 32 48 64; do
        install -Dm644 "src/Gui/Icons/freecad-icon-${i}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_appname}.png"
    done
    install -Dm644 "src/Gui/Icons/freecad.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"
    desktop-file-install \
        --dir="${pkgdir}/usr/share/applications" "${srcdir}/${_appname}.desktop"

    # Install mime info.
    install -D -m644 "${srcdir}/${_appname}.xml" \
        "${pkgdir}/usr/share/mime/packages/${_appname}.xml"
}
