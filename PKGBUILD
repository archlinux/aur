# Maintainer: Markus Hovorka <m.hovorka@live.de>
# Contributer: Christian Hesse <mail@eworm.de>

_appname=freecad
pkgname="${_appname}-git"
pkgver=0.17pre.r3961.g3b6020cda
pkgrel=1
epoch=1
pkgdesc='A general purpose 3D CAD modeler - git checkout'
arch=('i686' 'x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
depends=('boost-libs' 'curl' 'hicolor-icon-theme' 'libspnav' 'opencascade7'
         'med' 'xerces-c' 'python2-pivy' 'python2-pyside' 'qtwebkit'
         'libtheora' 'shared-mime-info' 'vtk-qt4' 'jsoncpp' 'netgen-nogui-occ7')
makedepends=('git' 'boost' 'cmake' 'coin' 'python2-pyside-tools'
             'desktop-file-utils' 'eigen' 'gcc-fortran' 'swig')
optdepends=('python2-matplotlib'
            'pycollada-git: Create, edit and load COLLADA documents.')
provides=('freecad')
conflicts=('freecad')
source=("${pkgname}::git+https://github.com/FreeCAD/FreeCAD.git"
        "freecad.desktop"
        "freecad.xml"
        "rpath.patch"
        "fix-occ-search.patch")
md5sums=('SKIP'
         '7e781d41e90a1c137930e47672996a52'
         'c2f4154c8e4678825411de8e7fa54c6b'
         'b313a990287bce43dc698affae35d58d'
         '5a7beefb78ef73241b0e421fec67f4db')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_//'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -Np1 -i "${srcdir}/rpath.patch"
    patch -Np1 -i "${srcdir}/fix-occ-search.patch"
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX="/opt/${_appname}" \
          -DOCC_INCLUDE_DIR="/opt/opencascade7/include/opencascade" \
          -DOCC_LIBRARY_DIR="/opt/opencascade7/lib" \
          -DVTK_DIR="/opt/vtk-qt4/lib/cmake/vtk-7.0" \
          -DCMAKE_PREFIX_PATH="/opt/opencascade7" \
          -DCMAKE_INCLUDE_PATH="/opt/opencascade7/include/opencascade" \
          -DCMAKE_LIBRARY_PATH="/opt/opencascade7/lib" \
          -DCMAKE_INSTALL_RPATH="/opt/opencascade7/lib;/opt/vtk-qt4/lib" \
          -DPYTHON_EXECUTABLE="/usr/bin/python2" \
          -DPYTHON_SUFFIX="-python2.7" \
          -DPYTHON_BASENAME="-python2.7" \
          -DPYSIDEUIC4BINARY="/usr/bin/python2-pyside-uic" \
          -DBUILD_FEM_NETGEN=1

    make
}

package() {
    cd "${srcdir}/${pkgname}"
    local bin="FreeCAD"
    local bin_cmd="FreeCADCmd"

    make DESTDIR="${pkgdir}" install
	
    # Symlink binaries to /usr/bin.
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${_appname}/bin/${bin}" "${pkgdir}/usr/bin/${bin}"
    ln -s "/opt/${_appname}/bin/${bin_cmd}" "${pkgdir}/usr/bin/${bin_cmd}"

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
