# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jordi De Groof <jordi (dot) degroof (at) gmail (dot) com>
# Contributor: mickele
# Contributor: manwithgrenade
# Contributor: bricem13
# Contributor: gborzi

pkgname=freecad
pkgver=0.17
_rollup=84d6128
pkgrel=5
pkgdesc='A general purpose 3D CAD modeler'
arch=('x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
depends=('boost-libs' 'curl' 'opencascade>=7.2' 'xerces-c' 'libspnav' 'glu'
         'shared-mime-info' 'hicolor-icon-theme' 'jsoncpp' 'med' 'qt4' 'netcdf'
         'python2-pivy' 'python2-pyside' 'python2-matplotlib' 'python2-shiboken'
         'python2-pyside-tools' 'pyside-tools-common')
makedepends=('boost' 'eigen' 'gcc-fortran' 'swig' 'xerces-c'
             'desktop-file-utils' 'cmake' 'coin>=3.1.3-9' 'python2-pyside')
optdepends=('python2-matplotlib' 'python2-pyqt4' 'graphviz' 'openscad')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreeCAD/FreeCAD/archive/$pkgver.tar.gz"
        "$pkgname-$_rollup-rollup.patch::https://github.com/FreeCAD/FreeCAD/compare/$pkgver...$_rollup.patch"
        "${pkgname}.desktop" "${pkgname}.xml"
        'remove-qtwebkit.patch' 'gcc8.patch' 'smesh-pthread.patch')
sha256sums=('ae017393476b6dc7f1192bcaf91ceedc2f9b791f2495307ce7c45efadb5266fb'
            'c4a4e084da448c78644e8acc1f3158cf2cb82ee4936b5b79e282497fd62d566e'
            '617968d7bbd1da71bdedaed1b66c5d6eaf24e0fb34678b93f5d925d370c66296'
            '248918de7d3c2145b5cc4fbbc9e224d22f4a6ca7ead2680e8c3a32e91772482a'
            'de214a281d421d44b02b469ecf72e36c4d61f10c40431e511e09734aca316baf'
            '618bb85c4f3a4eb0e329d1fc30391b777c9b0cffe97aa1e96d45f58b18424311'
            '170c90ee6ef64cf3c8e6a35ca94bb1187d346707f7e0779022e614563c6b74f6')

prepare() {
    cd "${srcdir}/FreeCAD-${pkgver}"

    patch -Np1 -i ../$pkgname-$_rollup-rollup.patch
    patch -Np1 -i ../remove-qtwebkit.patch
    patch -Np1 -i ../gcc8.patch
    patch -Np1 -i ../smesh-pthread.patch
}

build() {
    cd "${srcdir}/FreeCAD-${pkgver}"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr/lib/freecad" \
        -DCMAKE_INSTALL_DOCDIR="/usr/share/freecad/doc" \
        -DCMAKE_INSTALL_DATADIR="/usr/share/freecad" \
        -DFREECAD_USE_OCC_VARIANT="Official Version" \
        -DFREECAD_USE_EXTERNAL_PIVY=ON \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DBUILD_START=OFF \
        -DBUILD_WEB=OFF
    make
}

package() {
    cd "${srcdir}/FreeCAD-${pkgver}"

    make DESTDIR="${pkgdir}" install

    # Symlink to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -srf "${pkgdir}/usr/lib/freecad/bin/FreeCAD" "${pkgdir}/usr/bin/freecad"
    ln -srf "${pkgdir}/usr/lib/freecad/bin/FreeCAD" "${pkgdir}/usr/bin/FreeCAD"
    ln -srf "${pkgdir}/usr/lib/freecad/bin/FreeCADCmd" "${pkgdir}/usr/bin/freecadcmd"
    ln -srf "${pkgdir}/usr/lib/freecad/bin/FreeCADCmd" "${pkgdir}/usr/bin/FreeCADCmd"

    # Install pixmaps and desktop shortcut
    desktop-file-install \
        --dir="${pkgdir}/usr/share/applications" \
        "${srcdir}/${pkgname}.desktop"
    for i in 16 32 48 64; do
        install -Dm644 "src/Gui/Icons/freecad-icon-${i}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/freecad.png"
    done
    install -Dm644 "src/Gui/Icons/freecad.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/freecad.svg"

    # Mime info
    install -D -m644 "${srcdir}/freecad.xml" "${pkgdir}/usr/share/mime/packages/freecad.xml"
}
