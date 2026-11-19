# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=parsec
pkgver=4.0.2411
pkgrel=3
pkgdesc="Generic framework for architecture aware scheduling and management of micro-tasks on distributed many-core heterogeneous architectures"
arch=('x86_64')
url="https://github.com/ICLDisco/$pkgname"
license=('BSD-3-Clause-Open-MPI')
depends=('glibc'
         'libgcc'
         'libgfortran'
         'libstdc++'
         'hwloc'
         'openmpi'
         'papi'
         'graphviz'
         'gd'
         'libxml2'
         'level-zero-loader'
         'python')
makedepends=('cmake'
             'gcc-fortran'
             'bison'
             'flex'
             'perl'
             'python-build'
             'python-installer'
             'python-setuptools'
             'cython'
             'python-pandas'
             'valgrind'
             'level-zero-headers')
checkdepends=('python-pytables'
              'python-networkx'
              'inetutils')
optdepends=('python-pandas: read PaRSEC traces as tables'
            'python-pytables: convert PaRSEC traces to HDF5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgname-$pkgver.tar.gz"
        'use-python-build-installer.patch'
        'sde-cmake-config.patch')
sha256sums=('3f5750565b9f673626284dd0ba835dadea3633577fee50ac217baf43a335f2ef'
            '602834fbc4ca080af6e31ca942301b89ae0d33089421bc9f9ce70b81d004e170'
            '40f836f4246c04a043cee49f371e8f5eb06a55f6ec8c7d9360c7a97a46eff7ca')

prepare() {
  cd "$pkgname-$pkgname-$pkgver"
  # Build and install the pbt2ptt Python module with python-build and python-installer instead of pip
  patch -Np1 -i ../use-python-build-installer.patch
  # Install FindSDE.cmake and look for PAPI::SDE in PaRSECConfig.cmake, which libparsec links publicly
  patch -Np1 -i ../sde-cmake-config.patch
  # Graphviz >= 3 gvRenderData() takes a size_t length
  sed -i 's/gvRenderData(\(gvc, [A-Za-z]*, "png", result\), length);/{ size_t len; gvRenderData(\1, \&len); *length = len; }/' tools/profiling/graph.c
  # Point the Python tool symlinks in /usr/bin at /usr/libexec instead of the DESTDIR path
  sed -i 's|create_symlink \\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}|create_symlink ${CMAKE_INSTALL_PREFIX}|' tools/profiling/python/CMakeLists.txt
}

build() {
  cd "$pkgname-$pkgname-$pkgver"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DBUILD_SHARED_LIBS=ON -DPARSEC_DIST_WITH_MPI=ON -DPARSEC_GPU_WITH_LEVEL_ZERO=ON -DPARSEC_GPU_WITH_OPENCL=OFF -DPARSEC_PROF_TRACE=ON -DPARSEC_PROF_TRACE_SYSTEM="PaRSEC Binary Tracing Format" -DPARSEC_PROF_PINS=ON -DPARSEC_PROF_GRAPHER=ON -DPARSEC_PROF_TRACE_SCHEDULING_EVENTS=ON -DPARSEC_PROF_TRACE_ACTIVE_ARENA_SET=ON -DPARSEC_PROF_TRACE_PTG_INTERNAL_INIT=ON -DPARSEC_PROF_RUSAGE_EU=ON -DBUILD_TESTING=ON -DPARSEC_GPU_WITH_CUDA=OFF -DPARSEC_GPU_WITH_HIP=OFF -Wno-dev
  cmake --build build
}

check() {
  cd "$pkgname-$pkgname-$pkgver"
  PRTE_MCA_rmaps_default_mapping_policy=:oversubscribe ctest --test-dir build --output-on-failure
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
