# Contributor: Yuxin Wu <ppwwyyxxc@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: hauptmech
# Contributor: figo.zhang
# Contributor: lubosz

pkgname=pcl-qt5
pkgver=1.7.2
pkgrel=2
pkgdesc="A comprehensive open source library for n-D Point Clouds and 3D geometry processing (Qt5 version)"
arch=('x86_64' 'i686')
url='http://www.pointclouds.org'
license=('BSD')
depends=('boost' 'eigen' 'flann' 'vtk' 'qhull' 'qt5-base' 'glu' 'qt5-webkit')
makedepends=('cmake' 'gl2ps')
optdepends=('openmpi' 'cuda' 'openni2' 'python-sphinx')
source=("https://github.com/PointCloudLibrary/pcl/archive/pcl-${pkgver}.tar.gz"
        "qt5.patch")
sha256sums=('479f84f2c658a6319b78271111251b4c2d6cf07643421b66bbc351d9bed0ae93'
            '9e7303a9faa2fc5d0453841333a3e7c3801452b79efcef0d3c9d3f13285d5b91')
provides=('pcl')
conflicts=('pcl')

build() {
  cd $srcdir/pcl-pcl-$pkgver

  # Patch to support boost 1.5.6:
  # 1. Api change. See http://www.pcl-users.org/PCL-compilation-errors-Please-help-me-td4035209.html
  # This patch is not necessary for now.
  # sed -i "s/boost::property_tree::xml_writer_settings.*/boost::property_tree::xml_writer_settings<std::string> settings = boost::property_tree::xml_writer_make_settings<std::string>('\\\t', 1);/g" io/src/lzf_image_io.cpp
  # 2. Qt moc parser fails on some boost headers files. Try to get around.
  grep -rl '#include <boost/date_time/posix_time/posix_time.hpp>' . \
    | xargs sed -i "s/#include <boost.*posix_time.hpp>/#ifndef Q_MOC_RUN\n\r#include <boost\\/date_time\\/posix_time\\/posix_time.hpp>\n\r#endif/g"

  patch -p1 < ../qt5.patch

  # [[ -d build ]] && rm -r build
  mkdir -p build && cd build

  # -DBUILD_gpu_people=OFF \ Disable until CUDA npp detection is fixed in cmake
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_apps=ON \
    -DBUILD_apps_cloud_composer=OFF \
    -DBUILD_apps_in_hand_scanner=ON \
    -DBUILD_apps_modeler=ON \
    -DBUILD_apps_point_cloud_editor=OFF \
    -DBUILD_examples=ON \
    -DBUILD_global_tests=OFF \
    -DBUILD_surface_on_nurbs=ON \
    -DBUILD_CUDA=ON \
    -DBUILD_cuda_io=ON \
    -DBUILD_cuda_apps=ON \
    -DBUILD_GPU=ON \
    -DBUILD_gpu_surface=ON \
    -DBUILD_gpu_tracking=ON \
    -DBUILD_app_3d_rec_framework=ON \
    -DBUILD_simulation=ON

  make
}

package() {
  cd $srcdir/pcl-pcl-$pkgver/build

  make DESTDIR=$pkgdir install

  install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
