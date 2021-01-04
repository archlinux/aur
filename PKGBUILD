# Maintainer: Salamandar <felix@piedallu.me>

pkgname=freecad-linkstage3-git
pkgver=asm3.0.11.r3435.gb7d3346e00
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
    'patch_std_gnupp14.patch'
    'patch_boost_placeholders.patch'
)
sha256sums=(
    'SKIP'
    'd2a3a4c157741089c5ffbdd7c502be04414b8256081cd01208c94f2b0ed06ce3'
    '84b9f47fd643a5b01a9b5af8bd1e75c94842d8b564613286e2f145a85793a91e'
)


pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_//'
}

prepare() {
    cd "${srcdir}/${_gitname}"
    git apply < "$srcdir/patch_std_gnupp14.patch"
    git apply < "$srcdir/patch_boost_placeholders.patch"
}

build() {
    cd "${srcdir}/${_gitname}"

    rm build -rf
    mkdir build -p
    pushd build >/dev/null

    # Those deprecation warnings make debugging a nightmare
    export CFLAGS="$CFLAGS -Wno-deprecated-declarations"
    export CXXFLAGS="$CXXFLAGS -Wno-deprecated-declarations"

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

    ninja -j$(($(nproc)-1))
}

package() {
    pushd "${srcdir}/${_gitname}/build"
        DESTDIR="${pkgdir}" ninja install
    popd

    pushd "${pkgdir}"
        # Symlink to /usr/bin
        install -dm755 "usr/bin"
        ln -sf "/usr/lib/freecad/bin/FreeCAD"       "usr/bin/freecad"
        ln -sf "/usr/lib/freecad/bin/FreeCAD"       "usr/bin/FreeCAD"
        ln -sf "/usr/lib/freecad/bin/FreeCADCmd"    "usr/bin/freecadcmd"
        ln -sf "/usr/lib/freecad/bin/FreeCADCmd"    "usr/bin/FreeCADCmd"

        # Move data from /usr/lib/freecad/share to /usr/share
        mv "usr/lib/freecad/share/"{icons,pixmaps,mime,metainfo,applications} \
            "usr/share"

        rmdir "usr/lib/freecad/share"
    popd
}
