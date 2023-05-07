# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildbox-common
pkgver=0.0.66
pkgrel=0
pkgdesc="Shared protocol-buffer definitions and various helper functions"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('gflags' 'google-glog' 'grpc' 'gtest')
makedepends=('benchmark' 'c-ares' 'cmake' 'git' 'gmock'  ninja)
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-common#tag=0.0.66&commit=d0c03981c0e857455b6d41f9824b9c17a7bb64c0")
sha256sums=('SKIP')

build() {
  sed -i 's/CMAKE_CXX_STANDARD 14/CMAKE_CXX_STANDARD 20/' buildbox-common/CMakeLists.txt
  (echo '#include <cstdint>'; cat buildbox-common/buildbox-common/buildboxcommonmetrics/buildboxcommonmetrics_metricsconfigutil.h) > buildbox-common/buildbox-common/buildboxcommonmetrics/buildboxcommonmetrics_metricsconfigutil.h_
  mv -fv buildbox-common/buildbox-common/buildboxcommonmetrics/buildboxcommonmetrics_metricsconfigutil.h_ buildbox-common/buildbox-common/buildboxcommonmetrics/buildboxcommonmetrics_metricsconfigutil.h
  sed -i 's@~ScopedMetric<MetricType>()@~ScopedMetric()@' buildbox-common/buildbox-common/buildboxcommonmetrics/buildboxcommonmetrics_scopedmetric.h
  sed -i 's@~MetricTeeGuard<MetricType>()@~MetricTeeGuard()@' buildbox-common/buildbox-common/buildboxcommonmetrics/buildboxcommonmetrics_metricteeguard.h
  mkdir -p build
  cd build
  cmake ../buildbox-common \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

check() {
  cd build
  echo "Sometimes 'streamingstandardoutputinotifyfilemonitor' fails, just rerun it."
  ninja test
}

package() {
  cd build
  DESTDIR="$pkgdir/" ninja install
}
