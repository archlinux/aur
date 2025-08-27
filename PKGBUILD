# Maintainer: Kino <cybao292261 at 163 dot com>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
# Contributor: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Yuxin Wu <ppwwyyxxc@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: hauptmech
# Contributor: figo.zhang
# Contributor: lubosz
# Contributor: ZiXiS

pkgname=pcl
pkgver=1.15.1
pkgrel=1
pkgdesc="A standalone, large scale, open project for 2D/3D image and point cloud processing"
arch=('x86_64')
url='https://www.pointclouds.org'
license=("BSD-3-Clause")
depends=('boost' 'cjson' 'eigen' 'flann' 'freeglut' 'glew' 'vtk' 'libpcap' 'libpng' 'libusb' 'suitesparse' 'zlib')
optdepends=('cuda' 'openmp' 'openni2' 'qhull')
makedepends=('adios2' 'anari-sdk' 'cgns' 'cli11' 'cmake' 'fast_float' 'fmt' 'gl2ps' 'libharu' 'liblas' 'libxcursor'
             'netcdf' 'nlohmann-json' 'openvr' 'ospray' 'pdal' 'python-mpi4py' 'qt6-base' 'utf8cpp' 'verdict')
checkdepends=('gtest-src')
source=("https://github.com/PointCloudLibrary/pcl/archive/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ca9e742bc24b38f31c42c9ea08e19054e18d045f487269b64a7b831dada89936445d90a5b46870d8c24c2d25b33a59df2d904fe7e51bc0b231317cdb319951e9')
b2sums=('39dcb01d4409e3d4bc4241c5f48f0c450fea285cf3eaef5da6808aa4983ae56338a27e38bc4c77fe47354818564b495c63a6541a4ca9418a2336d0e8b92f4a0b')

build() {
  cmake -B build -S "${srcdir}/pcl-pcl-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_STANDARD=17 \
        -DCMAKE_CUDA_STANDARD=17 \
        -DBUILD_apps=ON \
        -DBUILD_apps_3d_rec_framework=ON \
        -DBUILD_apps_cloud_composer=ON \
        -DBUILD_apps_in_hand_scanner=ON \
        -DBUILD_apps_modeler=ON \
        -DBUILD_apps_point_cloud_editor=ON \
        -DBUILD_global_tests=ON \
        -DBUILD_outofcore=OFF \
        -DBUILD_simulation=ON \
        -DBUILD_surface_on_nurbs=ON -DUSE_UMFPACK=ON \
        -DBoost_USE_DEBUG_RUNTIME=OFF \
        -DWITH_QT='QT6' \
        -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build/test --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 ${srcdir}/pcl-pcl-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
