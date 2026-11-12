# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=parsec
pkgname=parsec-cuda
pkgver=4.0.2411
pkgrel=1
pkgdesc="Generic framework for architecture aware scheduling and management of micro-tasks on distributed many-core heterogeneous architectures (with CUDA)"
arch=('x86_64')
url="https://github.com/ICLDisco/$_name"
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
         'python'
         'cuda')
makedepends=('cmake'
             'gcc-fortran'
             'bison'
             'flex'
             'perl'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'cython'
             'python-pandas'
             'valgrind'
             'level-zero-headers')
checkdepends=('python-pytables'
              'python-networkx')
optdepends=('python-pandas: read PaRSEC traces as tables'
            'python-pytables: convert PaRSEC traces to HDF5')
provides=("parsec=$pkgver")
conflicts=('parsec')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$_name-$pkgver.tar.gz"
        'use-python-build-installer.patch'
        'cuda-13.patch')
sha256sums=('3f5750565b9f673626284dd0ba835dadea3633577fee50ac217baf43a335f2ef'
            '602834fbc4ca080af6e31ca942301b89ae0d33089421bc9f9ce70b81d004e170'
            '7d4cbc862015310a4a9831a9275889b13f02ebfd1e1ea008af1ceafd07186f1e')

prepare() {
  cd "$_name-$_name-$pkgver"
  # Build and install the pbt2ptt Python module with python-build and python-installer instead of pip
  patch -Np1 -i ../use-python-build-installer.patch
  # CUDA 13 removed clockRate, computeMode and memoryClockRate from cudaDeviceProp (upstream commit 658ff5ed)
  patch -Np1 -i ../cuda-13.patch
  # Graphviz >= 3 gvRenderData() takes a size_t length
  sed -i 's/gvRenderData(\(gvc, [A-Za-z]*, "png", result\), length);/{ size_t len; gvRenderData(\1, \&len); *length = len; }/' tools/profiling/graph.c
  # Point the Python tool symlinks in /usr/bin at /usr/libexec instead of the DESTDIR path
  sed -i 's|create_symlink \\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}|create_symlink ${CMAKE_INSTALL_PREFIX}|' tools/profiling/python/CMakeLists.txt
}

build() {
  cd "$_name-$_name-$pkgver"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DBUILD_SHARED_LIBS=ON -DPARSEC_DIST_WITH_MPI=ON -DPARSEC_GPU_WITH_LEVEL_ZERO=ON -DPARSEC_GPU_WITH_OPENCL=OFF -DPARSEC_PROF_TRACE=ON -DPARSEC_PROF_TRACE_SYSTEM="PaRSEC Binary Tracing Format" -DPARSEC_PROF_PINS=ON -DPARSEC_PROF_GRAPHER=ON -DPARSEC_PROF_TRACE_SCHEDULING_EVENTS=ON -DPARSEC_PROF_TRACE_ACTIVE_ARENA_SET=ON -DPARSEC_PROF_TRACE_PTG_INTERNAL_INIT=ON -DPARSEC_PROF_RUSAGE_EU=ON -DBUILD_TESTING=OFF -DPARSEC_GPU_WITH_CUDA=ON -DPARSEC_GPU_WITH_HIP=OFF -DCUDAToolkit_ROOT=/opt/cuda -Wno-dev
  cmake --build build
}

package() {
  cd "$_name-$_name-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
