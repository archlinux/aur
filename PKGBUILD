# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildbox-common
pkgver=1.2.11
pkgrel=1
pkgdesc="Shared protocol-buffer definitions and various helper functions"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('gflags' 'google-glog' 'grpc' 'gtest' util-linux-libs fuse3 bubblewrap)
makedepends=('benchmark' 'c-ares' 'cmake' 'git' 'gmock'  ninja)
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-common#tag=${pkgver}&commit=40eaacd9863aefde23955e23adc3b61aa01fe2d7")
sha256sums=('SKIP')
replaces=(buildbox-casd buildbox-fuse buildbox-run-bubblewrap)
conflicts=(buildbox-casd buildbox-fuse buildbox-run-bubblewrap)

build() {
  mkdir -p build
  cd build

  # Remove precompiled headers
  for i in $(find ../buildbox-common -name CMakeLists.txt -print)
  do
    sed -i 's/target_precompile_headers.*//' $i
  done

  # Code fixes
  (echo '#include <unistd.h>'; cat ../buildbox-common/common/buildboxcommon_logging.cpp) > ../buildbox-common/common/buildboxcommon_logging.cpp_
  mv ../buildbox-common/common/buildboxcommon_logging.cpp_ ../buildbox-common/common/buildboxcommon_logging.cpp
  (echo '#include <google/protobuf/util/message_differencer.h>'; cat ../buildbox-common/common/buildboxcommon_merklize.h) > ../buildbox-common/common/buildboxcommon_merklize.h_
  mv ../buildbox-common/common/buildboxcommon_merklize.h_ ../buildbox-common/common/buildboxcommon_merklize.h

  # Skip unit-test with problems
  sed -i 's|.*local_service_tests.*||' ../buildbox-common/casd/test/CMakeLists.txt

  # Compile
  export CXXFLAGS="-flto=auto -flto-partition=one -fuse-linker-plugin -fno-fat-lto-objects -O2 -ffunction-sections -Wl,--gc-sections ${CXXFLAGS}"
  cmake ../buildbox-common \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

check() {
  cd build
  echo "Sometimes 'executionstatsutils_tests' and 'streamingstandardoutputinotifyfilemonitor' fails, just rerun it."
  CTEST_OUTPUT_ON_FAILURE=True ninja test
}

package() {
  cd build
  DESTDIR="$pkgdir/" ninja install

  # Default buildbox-run
  ln -s buildbox-run-bubblewrap "$pkgdir/usr/bin/buildbox-run"
}
