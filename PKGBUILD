# Maintainer: Smoolak <smoolak@gmail.com>

pkgbase=nixl
pkgname=('nixl' 'python-nixl')
pkgver=1.4.1
pkgrel=1
pkgdesc='NVIDIA Inference Xfer Library: high-throughput, low-latency point-to-point data transfer for distributed inference'
arch=('x86_64')
url='https://github.com/ai-dynamo/nixl'
license=('Apache-2.0')
depends=(
  'openucx'
  'rdma-core'
  'abseil-cpp'
  'libfabric'
  'libaio'
  'liburing'
  'cuda'
  'nvidia-utils'
  'hwloc'
  'numactl'
  'tomlplusplus'
  'prometheus-cpp'
)
makedepends=(
  'meson'
  'ninja'
  'cmake'
  'git'
  'pkgconf'
  'asio'
  'taskflow'
  'pybind11'
  'python'
  'python-numpy'
  'python-pytorch'
  'gtest'
  'gcc15'
)
checkdepends=(
  'python-pytest'
  'python-pytest-timeout'
)
source=(
  "$pkgbase-$pkgver.tar.gz::https://github.com/ai-dynamo/nixl/archive/refs/tags/v$pkgver.tar.gz"
  'asio-1.38-post.patch'
  'missing-fstream.patch'
  'gds-smoke-no-path.patch'
  'system-prometheus-cpp.patch'
  'test-harness-fixes.patch'
)
sha256sums=(
  '603661e435cb8da34bcf582f78dfbad158e57f47fe0552c446f26d21bd0be70d'
  '7c03c35227f2630bac8b6e2dbbb22160ec14b041c5d9a20877d8de3226110ac4'
  '158cf152d25c632bdd6317a4fff6bda13fcfe3fc4bd37955c7b34477df694384'
  '890220839cfb1032f49bb0333337855b2965239171f76157b95eefa2cc1e1d90'
  'bad9d6e32089cd06839be084cdd6135ffe0b7945d78ef53448c1f1e55a8f17af'
  '871daba857bfd92072d2d15fcdcf037ec6f85a569d59dce7b3f24d2d67f869c9'
)

prepare() {
  cd "$srcdir/nixl-$pkgver"

  # Standalone Asio 1.38 removed the deprecated io_context::post member.
  # The free function is API-equivalent and also works with older Asio.
  patch -Np1 -i "$srcdir/asio-1.38-post.patch"

  # configuration.cpp uses std::ofstream but relied on an indirect include that
  # is absent with the current Arch toolchain.
  patch -Np1 -i "$srcdir/missing-fstream.patch"

  # The two GDS path-mode smoke tests are registered by Meson without the
  # directory argument required by the benchmark portion of their executables.
  # Stop after the registered smoke test when no benchmark path was supplied.
  patch -Np1 -i "$srcdir/gds-smoke-no-path.patch"

  # Use Arch's prometheus-cpp libraries instead of downloading a Meson
  # subproject, retaining the Prometheus telemetry exporter in offline builds.
  patch -Np1 -i "$srcdir/system-prometheus-cpp.patch"

  # Give the full integration suite its required timeout and ignore the one
  # documented teardown diagnostic when the optional ETCD backend is absent.
  patch -Np1 -i "$srcdir/test-harness-fixes.patch"
}

build() {
  cd "$srcdir/nixl-$pkgver"

  # nvcc 13.x cannot use gcc>=16 as host compiler; pin g++-15 (cuda_gds/GPU bits).
  export CUDA_HOME=/opt/cuda
  export PATH="/opt/cuda/bin:${PATH}"
  export CUDAHOSTCXX=/usr/bin/g++-15 NVCC_CCBIN=/usr/bin/g++-15
  export CC=gcc-15 CXX=g++-15

  # NIXL's Meson default prefix is /opt/nvidia/nvda_nixl; force /usr (Arch policy).
  # Meson only enters test/ for non-release build types. "plain" preserves the
  # Arch optimization flags, while b_ndebug/log_level retain release semantics
  # and allow the complete upstream test targets to be built from this one tree.
  # Disable backends whose SDKs aren't packaged on Arch (DOCA/GPUNETIO, Mooncake,
  # Azure Blob, HF3FS, UCCL, GUSLI, S3/OBJ and Infinia); keep UCX, POSIX,
  # LIBFABRIC, CUDA GPUDirect Storage and the NVTX tracing backend. The pybind11
  # bindings (nixl_cu13) are built unconditionally and split into python-nixl.
  # --wrap-mode=nodownload: never download a meson subproject wrap; resolve all
  # deps from system packages. Every enabled dependency is packaged (abseil-cpp/
  # asio/liburing/tomlplusplus/taskflow/prometheus-cpp). The system
  # prometheus-cpp keeps the telemetry exporter enabled; only DOCA telemetry
  # no-ops because that SDK is unavailable. Keeps the build offline/reproducible.
  # -Dwerror=false: nixl's default_options sets werror=true, but current Arch
  # abseil marks absl::Mutex::Lock/Unlock/ReaderLock/ReaderUnlock
  # deprecated, which nixl's src/core/sync.h still uses -> -Werror=deprecated-
  # declarations turns it fatal. The methods still work; un-fatal the warnings
  # (distro builds routinely relax upstream -Werror against newer toolchains/libs).
  meson setup build \
    --prefix=/usr \
    --buildtype=plain \
    --wrap-mode=nodownload \
    -Db_ndebug=true \
    -Dwerror=false \
    -Dlog_level=info \
    -Dbuild_tests=true \
    -Dbuild_examples=false \
    -Dbuild_docs=false \
    -Drust=false \
    -Ddisable_plugins=GPUNETIO,MOONCAKE,AZURE_BLOB,HF3FS,UCCL,GUSLI,OBJ,INFINIA,TELEMETRY_DOCA \
    -Dgds_path=/opt/cuda \
    -Dcudapath_inc=/opt/cuda/include \
    -Dcudapath_lib=/opt/cuda/lib64 \
    -Dinstall_headers=true
  meson compile -C build
}

check() {
  cd "$srcdir/nixl-$pkgver"

  # The POSIX stress test opens 1024 files concurrently.  Only adjust the
  # soft limit: an unprivileged container cannot raise its inherited hard
  # limit, and `ulimit -n` attempts to change both.
  local _hard_nofile _soft_nofile=65536
  _hard_nofile="$(ulimit -Hn)"
  if [[ $_hard_nofile != unlimited ]] && (( _hard_nofile < _soft_nofile )); then
    _soft_nofile=$_hard_nofile
  fi
  ulimit -Sn "$_soft_nofile"
  (( $(ulimit -Sn) >= 2048 ))

  # A non-debug Meson build does not generate upstream's build-tree plugin
  # manifest. Give generic CPU tests a directory containing the CPU-capable
  # backends plus the mock. The main gtest binary adds its own mocks directory,
  # which receives every compiled backend. Populate every directory that gtest
  # registers so cross-plugin lookups do not produce false missing-file errors.
  local _cpu_plugins="$PWD/build/test-plugins-cpu"
  local _gtest_plugins="$PWD/build/test/gtest/mocks"
  local _prometheus_plugins="$PWD/build/src/plugins/telemetry/prometheus"
  local _nvtx_plugins="$PWD/build/src/plugins/tracing/nvtx"
  local _plugin
  mkdir -p "$_cpu_plugins"

  for _plugin in \
    build/test/gtest/mocks/libplugin_MOCK_BACKEND.so \
    build/src/plugins/ucx/libplugin_UCX.so \
    build/src/plugins/posix/libplugin_POSIX.so \
    build/src/plugins/libfabric/libplugin_LIBFABRIC.so
  do
    test -e "$_plugin"
    ln -sf "$PWD/$_plugin" "$_cpu_plugins/"
  done

  find build/src/plugins build/test/gtest/mocks -type f \
    \( -name 'libplugin_*.so' -o -name 'libtelemetry_exporter_*.so' \) \
    -print0 |
    while IFS= read -r -d '' _plugin; do
      local _plugin_dir
      for _plugin_dir in \
        "$_gtest_plugins" "$_prometheus_plugins" "$_nvtx_plugins"
      do
        if [[ "$PWD/$_plugin" != "$_plugin_dir/${_plugin##*/}" ]]; then
          ln -sf "$PWD/$_plugin" "$_plugin_dir/"
        fi
      done
    done

  NIXL_PLUGIN_DIR="$_cpu_plugins" \
  NIXL_CI_NON_GPU=1 \
    meson test -C build --no-rebuild --print-errorlogs

  # Exercise the Python API against a staged Meson installation, not the source
  # tree. The nixl meta-dispatcher is a separate upstream wheel target, so stage
  # its sources alongside the compiled nixl_cu13 extension just as package() does.
  local _testroot="$srcdir/test-root"
  local _sitedir
  rm -rf "$_testroot"
  DESTDIR="$_testroot" meson install -C build
  _sitedir="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dm755 "$_testroot$_sitedir/nixl"
  install -m644 src/bindings/python/nixl-meta/nixl/*.py \
    "$_testroot$_sitedir/nixl/"
  install -m644 src/bindings/python/nixl-meta/nixl_meta_utils.py \
    "$_testroot$_sitedir/"

  PYTHONPATH="$_testroot$_sitedir" \
  LD_LIBRARY_PATH="$_testroot/usr/lib" \
  NIXL_PLUGIN_DIR="$_testroot/usr/lib/plugins" \
    pytest -q test/python

  rm -rf "$_testroot"
}

package_nixl() {
  cd "$srcdir/nixl-$pkgver"
  meson install -C build --destdir "$pkgdir"
  # The python bindings (nixl_cu13) belong to python-nixl.
  rm -rf "$pkgdir"/usr/lib/python*
  # Upstream marks its test executables, mock plugin and helper library as
  # installable. They are exercised in check() but are not runtime interfaces.
  rm -rf "$pkgdir/usr/bin"
  rm -f \
    "$pkgdir/usr/lib/libnixl_test_utils.so" \
    "$pkgdir/usr/lib/plugins/libplugin_MOCK_BACKEND.so"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-nixl() {
  pkgdesc='Python bindings for NIXL (NVIDIA Inference Xfer Library)'
  depends=('nixl' 'python' 'openucx' 'python-numpy' 'python-pytorch')

  cd "$srcdir/nixl-$pkgver"
  meson install -C build --destdir "$pkgdir"

  # Keep only the python site-packages (the cuda-specific nixl_cuXX bindings);
  # the C++ libraries and headers are shipped by the nixl package.
  find "$pkgdir/usr" -mindepth 1 -maxdepth 1 ! -name lib -exec rm -rf {} +
  find "$pkgdir/usr/lib" -mindepth 1 -maxdepth 1 ! -name 'python*' -exec rm -rf {} +

  # NIXL ships the bindings as nixl_cuNN; dynamo (and users) `import nixl`. Install
  # upstream's meta wrapper (nixl-meta) that redirects `nixl` -> the installed
  # nixl_cuNN, so `import nixl` works.
  local sitedir
  sitedir="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dm755 "$pkgdir$sitedir/nixl"
  install -m644 src/bindings/python/nixl-meta/nixl/*.py \
    "$pkgdir$sitedir/nixl/"
  install -m644 src/bindings/python/nixl-meta/nixl_meta_utils.py \
    "$pkgdir$sitedir/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
