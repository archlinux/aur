# Maintainer: Smoolak <smoolak@gmail.com>

pkgbase=nixl
pkgname=('nixl' 'python-nixl')
pkgver=0.10.1
pkgrel=1
pkgdesc='NVIDIA Inference Xfer Library: high-throughput, low-latency point-to-point data transfer for distributed inference'
arch=('x86_64')
url='https://github.com/ai-dynamo/nixl'
license=('Apache-2.0')
depends=(
  'openucx'
  'abseil-cpp'
  'libfabric'
  'liburing'
  'cuda'
  'gflags'
)
makedepends=(
  'meson'
  'ninja'
  'cmake'
  'git'
  'pkgconf'
  'asio'
  'tomlplusplus'
  'pybind11'
  'python'
  'gcc15'
)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ai-dynamo/nixl/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/nixl-$pkgver"
  # asio >= 1.31 removed io_context::post(); Arch ships asio 1.38. Switch the one
  # call site to the modern free-function form asio::post(ctx, handler), which is
  # available via the already-included <asio.hpp>.
  sed -i 's/io_->post(/asio::post(*io_, /' src/plugins/ucx/ucx_backend.cpp
}

build() {
  cd "$srcdir/nixl-$pkgver"

  # nvcc 13.x cannot use gcc>=16 as host compiler; pin g++-15 (cuda_gds/GPU bits).
  export CUDA_HOME=/opt/cuda
  export PATH="/opt/cuda/bin:${PATH}"
  export CUDAHOSTCXX=/usr/bin/g++-15 NVCC_CCBIN=/usr/bin/g++-15
  export CC=gcc-15 CXX=g++-15

  # NIXL's meson default prefix is /opt/nvidia/nvda_nixl; force /usr (Arch policy).
  # Disable backends whose SDKs aren't packaged on Arch (DOCA/GPUNETIO, Mooncake,
  # Azure Blob, HF3FS, UCCL, GUSLI, S3/OBJ); keep UCX (the transport dynamo uses),
  # POSIX, LIBFABRIC and the CUDA GPUDirect-Storage backends. etcd + doca deps are
  # optional (required:false) and resolve to "not found" cleanly. The pybind11
  # python bindings (nixl_cu13) are built unconditionally and split into python-nixl.
  meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dbuild_tests=false \
    -Dbuild_examples=false \
    -Dbuild_docs=false \
    -Drust=false \
    -Ddisable_plugins=GPUNETIO,MOONCAKE,AZURE_BLOB,HF3FS,UCCL,GUSLI,OBJ \
    -Dgds_path=/opt/cuda \
    -Dcudapath_inc=/opt/cuda/include \
    -Dcudapath_lib=/opt/cuda/lib64 \
    -Dinstall_headers=true
  meson compile -C build
}

package_nixl() {
  cd "$srcdir/nixl-$pkgver"
  meson install -C build --destdir "$pkgdir"
  # The python bindings (nixl_cu13) belong to python-nixl.
  rm -rf "$pkgdir"/usr/lib/python*
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-nixl() {
  pkgdesc='Python bindings for NIXL (NVIDIA Inference Xfer Library)'
  depends=('nixl' 'python' 'openucx' 'python-numpy')

  cd "$srcdir/nixl-$pkgver"
  meson install -C build --destdir "$pkgdir"

  # Keep only the python site-packages (the cuda-specific nixl_cuXX bindings);
  # the C++ libraries/headers/pkgconfig are shipped by the nixl package.
  find "$pkgdir/usr" -mindepth 1 -maxdepth 1 ! -name lib -exec rm -rf {} +
  find "$pkgdir/usr/lib" -mindepth 1 -maxdepth 1 ! -name 'python*' -exec rm -rf {} +

  # NIXL ships the bindings as nixl_cuNN; dynamo (and users) `import nixl`. Install
  # upstream's meta wrapper (nixl-meta) that redirects `nixl` -> the installed
  # nixl_cuNN, so `import nixl` works.
  local sitedir
  sitedir="$(python -c 'import site; print(site.getsitepackages()[0])')"
  cp -r src/bindings/python/nixl-meta/nixl "$pkgdir$sitedir/nixl"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
