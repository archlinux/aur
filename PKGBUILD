# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>

pkgname=vtk-raytracing-git
pkgver=8.2.0.3790.g0c788fab33
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization'
arch=('x86_64')
url="http://vtk.org"
license=('BSD')
depends=('ospray' 'oidn' 'libxt' 'double-conversion' 'glew' 'hdf5' 'proj')
makedepends=('cmake' 'git')
provides=('vtk')
conflicts=('vtk')
source=("git+https://gitlab.kitware.com/vtk/vtk.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/vtk"
    git describe | sed 's:^v::;s:-:.:g'
}

build() {
    cd "$srcdir/vtk"
    mkdir -p build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DVTK_BUILD_TESTING=OFF \
          -DBUILD_SHARED_LIBS=ON \
          -DVTK_LEGACY_REMOVE=ON \
          -DVTK_MODULE_ENABLE_VTK_RenderingRayTracing=WANT \
          -DVTKOSPRAY_ENABLE_DENOISER=ON \
          ..
    make
}

package() {
    cd "$srcdir/vtk/build"
    make DESTDIR="$pkgdir" install
}

