# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=itk-snap
pkgver=3.8.2
pkgrel=1
pkgdesc='Software to segment structures in 3D medical images'
arch=('x86_64')
url='http://www.itksnap.org'
license=('GPL3')
depends=(
    'ffmpeg'
    'fltk'
    'gdal'
    'glew'
    'insight-toolkit4'
    'jsoncpp'
    'libogg'
    'libtheora'
    'netcdf'
    'openmpi'
    'pdal'
    'proj'
    'pugixml'
    'python'
    'qt5-declarative'
    'qt5-x11extras'
    'unixodbc'
    'vtk'
)
optdepends=()
makedepends=('cmake' 'git')
source=("$pkgname::git+git://git.code.sf.net/p/itk-snap/src#commit=2da5b3560f9"
        "patch.diff"
        "itkKernelFunction.h"
        "itksnap.png"
        "itksnap.desktop")
sha256sums=('SKIP'
            'a2d3c1613c4c873640b1de99cfd3c60ec44140a62715698cd0b9ca4e124d649c'
            'f88fce76c3a0a3bf72deba15e901945f89df422db27e09b75fdd1a169a856e3d'
            'ee2f8698bf751cb3e1e6520e99c0c761f996fd3707f4155d126e7ecc0a6d6884'
            '324b7fc9ea389c52f7dc615a30f392e8445884098242f738c72e533b260845c0')

prepare() {
    cd "$srcdir/$pkgname"

    # Patch to fix the following build issues:
    #  - Fix broken include directive for `vnl_symmetric_eigensystem.h`.
    #  - Remove usage of non-portable symbol `sys_siglist`.
    #  - Remove implementation of jsoncpp to prevent errors due to multiple and
    #    potentially incompatible symbol definitions when jsoncpp is installed
    #    at system level.
    git apply "${srcdir}/patch.diff"

    # Replace relative with absolute location of the repo
    sed -i 's,../../c3d/git,git://git.code.sf.net/p/c3d/git,' .gitmodules

    git submodule update --init --recursive

    rm -rf build
    mkdir build
    cd build

    # Ship a deprecated ITKv3 compatibility header still used by ITK-SNAP
    rm -rf itkv3
    mkdir itkv3
    cp "$srcdir/itkKernelFunction.h" itkv3/.

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_CXX_FLAGS="-fPIC -I'$srcdir/$pkgname/build/itkv3' -DITKV3_COMPATIBILITY=1" \
        -DBUILD_OUTSIDE_INSIGHT_APPLICATIONS=ON \
        -DBUILD_TESTING=OFF \
        -DITK_DIR="/opt/insight-toolkit4/lib/cmake/ITK-4.13"
}

build() {
    cd "$srcdir/$pkgname/build"
    make
}

package() {
    cd "$srcdir/$pkgname/build"
    LD_PRELOAD='' make install DESTDIR="$pkgdir"

    install -D -m644 "$srcdir/itksnap.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/itksnap.png"
    install -D -m644 "$srcdir/itksnap.desktop" "${pkgdir}/usr/share/applications/itksnap.desktop"
}

