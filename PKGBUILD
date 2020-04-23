# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

pkgname=freecad-git
pkgver=0.18.r4645.g0c96f77184
pkgrel=1
epoch=0
pkgdesc='A general purpose 3D CAD modeler - git checkout'
arch=('x86_64')
url='https://www.freecadweb.org/'
license=('LGPL')
depends=('boost-libs' 'curl' 'desktop-file-utils' 'glew' 'hicolor-icon-theme'
         'jsoncpp' 'libspnav' 'med' 'opencascade' 'openmpi' 'shiboken2' 'xerces-c'
         'pyside2' 'pyside2-tools' 'python-matplotlib' 'python-netcdf4' 'python-pivy'
         'qt5-svg' 'qt5-webkit' 'qt5-webengine' 'qt5-base')
makedepends=('boost' 'cmake' 'eigen' 'git' 'gcc-fortran'
             'pyside2-tools' 'swig' 'qt5-tools')
optdepends=('pycollada: Create, edit and load COLLADA documents.')
provides=('freecad')
conflicts=('freecad' 'freecad-appimage' 'freecad-appimage-git')
source=("git+https://github.com/FreeCAD/FreeCAD.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/FreeCAD"
    # upstream recyles the "pre" and "staging" tags so they do not produce stable commit counts
    git describe --long --tags --exclude '*pre*' --exclude '*staging*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_//'
}

prepare() {
  cd "${srcdir}/FreeCAD"
  # fix a build error
  #curl -L "https://github.com/FreeCAD/FreeCAD/pull/2842/commits/095984fce44931a4c8e2ace269d45a62640fbfb4.patch" | patch -p1
}

build() {
    cd "${srcdir}/FreeCAD"

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr/lib/freecad" \
        -DCMAKE_INSTALL_DATAROOTDIR="/usr/share" \
        -DCMAKE_INSTALL_DOCDIR="/usr/share/freecad/doc" \
        -DFREECAD_USE_OCC_VARIANT="Official Version" \
        -DBUILD_QT5=ON \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DOPENMPI_INCLUDE_DIRS=/usr/include \
        .
    make
}

package() {
    cd "${srcdir}/FreeCAD"

    make DESTDIR="${pkgdir}" install

    local bin="FreeCAD"
    local bin_cmd="FreeCADCmd"
    # Symlink binaries to /usr/bin.
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/usr/lib/freecad/bin/${bin}" "${pkgdir}/usr/bin/${bin}"
    ln -s "/usr/lib/freecad/bin/${bin_cmd}" "${pkgdir}/usr/bin/${bin_cmd}"
    # Lowercase aliases for convenience.
    ln -s "/usr/bin/${bin}" "${pkgdir}/usr/bin/${bin,,}"
    ln -s "/usr/bin/${bin_cmd}" "${pkgdir}/usr/bin/${bin_cmd,,}"

    # do we actually need this line?
    echo "Path=/usr/lib/freecad" >> "${pkgdir}/usr/share/applications/org.freecadweb.FreeCAD.desktop"
}
