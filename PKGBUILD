# Maintainer: Salamandar <felix@piedallu.me>

pkgname=freecad-linkstage3-git
pkgver=asm3.0.11.r3383.geb10f4011b
pkgrel=1
pkgdesc='A general purpose 3D CAD modeler - LinkStage3 dev branch, git checkout'
arch=('x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
conflicts=('freecad')
depends=(
    # Copied from Freecad package
    'boost-libs' 'curl' 'opencascade>=7.2' 'xerces-c' 'libspnav' 'glew' 'netcdf'
    'shared-mime-info' 'hicolor-icon-theme' 'jsoncpp' 'qt5-base' 'qt5-declarative'
    'qt5-svg' 'qt5-tools' 'qt5-x11extras' 'qt5-xmlpatterns' 'qt5-webkit' 'med' 'python-pivy'
    'python-pyside2' 'python-matplotlib' 'pyside2-tools'


    # 'calculix'
    # 'coin'
    # 'gmsh'
    # 'netgen-git'
    # 'vtk'
    # 'shiboken2'
    #
    # # libxmu-dev
    # # libxmu-headers
    # # libxmu6
    # # libxmuu-dev
    # # libxmuu1
    #
    # 'python-shiboken2'

)
makedepends=(
    'cmake' 'ninja'
    'boost'
    'desktop-file-utils'
    'eigen'
    'gcc-fortran'
    'swig'
    'xerces-c'
    'coin'
)
optdepends=(
    'python-matplotlib' 'graphviz' 'openscad'
)
_gitname='FreeCAD'
source=(
    "git+https://github.com/realthunder/FreeCAD.git#branch=LinkStage3"
)
sha256sums=(
    'SKIP'
)


pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_//'
}

prepare() {
    cd "${srcdir}/${_gitname}"

}

build() {
    cd "${srcdir}/${_gitname}"

    rm build -rf
    mkdir build -p
    pushd build >/dev/null

    cmake -GNinja -Wno-dev .. \
        -DBUILD_QT5=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_DATADIR='/usr/share/freecad' \
        -DCMAKE_INSTALL_DOCDIR='/usr/share/freecad/doc' \
        -DCMAKE_INSTALL_PREFIX='/usr/lib/freecad' \
        -DFREECAD_USE_OCC_VARIANT="Official Version" \
        -DFREECAD_USE_EXTERNAL_PIVY=ON \
        -DFREECAD_USE_QT_FILEDIALOG=ON \
        -DPYTHON_EXECUTABLE=/usr/bin/python

        # -DCMAKE_PREFIX_PATH='/usr' \
        # -DCMAKE_INSTALL_PREFIX='/usr' \
    ninja -j$(($(nproc)-1))

}

package() {
    cd "${srcdir}/${_gitname}/build"

    DESTDIR="${pkgdir}" ninja install

    # Symlink to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/freecad/bin/FreeCAD" "${pkgdir}/usr/bin/freecad"
    ln -sf "/usr/lib/freecad/bin/FreeCAD" "${pkgdir}/usr/bin/FreeCAD"
    ln -sf "/usr/lib/freecad/bin/FreeCADCmd" "${pkgdir}/usr/bin/freecadcmd"
    ln -sf "/usr/lib/freecad/bin/FreeCADCmd" "${pkgdir}/usr/bin/FreeCADCmd"

    # Install pixmaps and desktop shortcut
    # desktop-file-install \
    #     --dir="${pkgdir}/usr/share/applications" \
    #     "${srcdir}/${pkgname}.desktop"

    # for i in 16 32 48 64; do
    #     install -Dm644 "src/Gui/Icons/freecad-icon-${i}.png" \
    #         "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/freecad.png"
    # done
    # install -Dm644 "src/Gui/Icons/freecad.svg" \
    #     "${pkgdir}/usr/share/icons/hicolor/scalable/apps/freecad.svg"

    # # Mime info
    # install -D -m644 "${srcdir}/freecad.xml" "${pkgdir}/usr/share/mime/packages/freecad.xml"
}
