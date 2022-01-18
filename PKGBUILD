# Maintainer: Matteo Bonroa <bonora.matteo@gmail.com>

pkgname=freecad-linkdaily-git
pkgver=asm3.0.11.r8066.gc87611ac4f
pkgrel=1
pkgdesc='A general purpose 3D CAD modeler - LinkDaily dev branch, git checkout'
arch=('x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
conflicts=('freecad')
depends=(
    'boost-libs' 'curl' 'shared-mime-info' 'hicolor-icon-theme' 'utf8cpp' 'jsoncpp'
    'opencascade>=7.2' 'xerces-c' 'libspnav' 'glew' 'netcdf' 'med' 'openmpi'
    'qt5-base' 'qt5-declarative' 'qt5-svg' 'qt5-tools' 'qt5-x11extras' 'qt5-xmlpatterns' 'qt5-webkit' 
    'python-pivy' 'python-pyside2' 'python-matplotlib' 'pyside2-tools' 'shiboken2'     
)
makedepends=(
    'cmake' 'ninja' 'gcc-fortran'
    'boost'
    'desktop-file-utils'
    'eigen'
    'swig'
    'xerces-c'
    'coin'
)
optdepends=(
    'python-matplotlib' 'graphviz' 'openscad'
)
_gitname='FreeCAD'
source=(
    "git+https://github.com/realthunder/FreeCAD.git#branch=LinkDaily"
    'patch_std_gnupp14.patch'
)
sha256sums=(
    'SKIP'
    'd2a3a4c157741089c5ffbdd7c502be04414b8256081cd01208c94f2b0ed06ce3'
)


pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_//'
}

prepare() {
    cd "${srcdir}/${_gitname}"
    # git apply < "$srcdir/patch_std_gnupp14.patch"
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
        mv "usr/lib/freecad/share/"{icons,pixmaps,mime,metainfo,applications,thumbnailers} \
            "usr/share"

        rmdir "usr/lib/freecad/share"
    popd
}
