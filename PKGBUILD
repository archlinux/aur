# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

_appname=freecad
pkgname="${_appname}-git"
pkgver=0.19pre.r633.g063582241
pkgrel=1
epoch=1
pkgdesc='A general purpose 3D CAD modeler - git checkout'
arch=('x86_64')
url='https://www.freecadweb.org/'
license=('LGPL')
depends=('boost-libs' 'curl' 'desktop-file-utils' 'glew' 'hicolor-icon-theme'
         'jsoncpp' 'libspnav' 'med' 'opencascade' 'shiboken2' 'xerces-c'
         'pyside2' 'python-matplotlib' 'python-netcdf4' 'python-pivy'
         'qt5-svg' 'qt5-webkit' 'qt5-webengine')
makedepends=('boost' 'cmake' 'eigen' 'git' 'gcc-fortran'
             'pyside2-tools' 'swig' 'qt5-tools')
optdepends=('pycollada: Create, edit and load COLLADA documents.')
provides=('freecad')
conflicts=('freecad')
source=("${pkgname}::git+https://github.com/FreeCAD/FreeCAD.git"
        "freecad.desktop"
        "freecad.xml")
md5sums=('SKIP'
         '9e958fe0b5267a8eae2433731b949a24'
         'c2f4154c8e4678825411de8e7fa54c6b')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_//'
}

build() {
    cd "${srcdir}/${pkgname}"

    PYVER="$(/usr/bin/python3 -c 'import sys; print("{}.{}".format(sys.version_info.major,sys.version_info.minor))')"

    cmake . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr/lib/freecad" \
        -DCMAKE_INSTALL_DOCDIR="/usr/share/freecad/doc" \
        -DCMAKE_INSTALL_DATADIR="/usr/share/freecad" \
        -DFREECAD_USE_OCC_VARIANT="Official Version" \
        -DBUILD_QT5=ON \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DOPENMPI_INCLUDE_DIRS=/usr/include \
        -DSHIBOKEN_INCLUDE_DIR=/usr/include/shiboken2 \
        -DSHIBOKEN_BINARY=/usr/bin/shiboken2 \
        -DSHIBOKEN_LIBRARY="/usr/lib/libshiboken2.cpython-${PYVER//.}m-x86_64-linux-gnu.so" \
        -DPYSIDE_INCLUDE_DIR=/usr/include/PySide2 \
        -DPYSIDE_LIBRARY="/usr/lib/libpyside2.cpython-${PYVER//.}m-x86_64-linux-gnu.so" \
        -DPYSIDE_PYTHONPATH="/usr/lib/python${PYVER}/site-packages/PySide2" \
        -DPYSIDE_TYPESYSTEMS=/usr/share/PySide2/typesystems

    make
}

package() {
    cd "${srcdir}/${pkgname}"
    local bin="FreeCAD"
    local bin_cmd="FreeCADCmd"

    make DESTDIR="${pkgdir}" install

    # Symlink binaries to /usr/bin.
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/usr/lib/freecad/bin/${bin}" "${pkgdir}/usr/bin/${bin}"
    ln -s "/usr/lib/freecad/bin/${bin_cmd}" "${pkgdir}/usr/bin/${bin_cmd}"
    # Lowercase aliases for convenience.
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
