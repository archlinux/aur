# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=boost174
pkgname=(
  boost174
  boost174-libs
)
pkgver=1.74.0
pkgrel=1
_srcname=boost_${pkgver//./_}
pkgdesc="Free peer-reviewed portable C++ source libraries (version 1.74)"
arch=(x86_64)
url="https://www.boost.org/"
license=(custom)
makedepends=(
  icu
  python39
  bzip2
  openmpi
  zstd
)
source=(
  "https://boostorg.jfrog.io/artifactory/main/release/$pkgver/source/$_srcname.tar.bz2"
  "$pkgbase-ublas-c++20-allocator-patch1.patch::https://github.com/boostorg/ublas/commit/47a314dd01d1.patch"
  "$pkgbase-ublas-c++20-allocator-patch2.patch::https://github.com/boostorg/ublas/commit/a23a903f9a36.patch"
  "$pkgbase-ublas-c++20-iterator.patch::https://github.com/boostorg/ublas/commit/a31e5cffa85f.patch"
)
sha256sums=(
  '83bfc1507731a0906e387fc28b7ef5417d591429e51e788417fe9ff025e116b1'
  '3f42688a87c532ac916889f21a4487b9e94a38a047b18724385eaa474719a9f7'
  '67f413463a1a12bdf63c913acd318148dda618d3f994e466232e265bbf0c2903'
  'aa38addb40d5f44b4a8472029b475e7e6aef1c460509eb7d8edf03491dc1b5ee'
)

prepare() {
  cd $_srcname

  # https://github.com/boostorg/ublas/issues/96
  patch -Np2 -i ../$pkgbase-ublas-c++20-allocator-patch1.patch
  patch -Np2 -i <(<../$pkgbase-ublas-c++20-allocator-patch2.patch \
    sed 's:test/:pls-apply-cleanly-kthxbai/libs/numeric/ublas/&:g')

  # https://github.com/boostorg/ublas/pull/97
  patch -Np2 -i ../$pkgbase-ublas-c++20-iterator.patch
}

_python_version=3.9
_python_exe=python$_python_version

build() {
  local JOBS="$(sed 's/.*\(-j *[0-9]\+\).*/\1/' <<<$MAKEFLAGS)"

  pushd $_srcname/tools/build
  ./bootstrap.sh --cxxflags="$CXXFLAGS $LDFLAGS"
  ./b2 install --prefix="$srcdir"/fakeinstall
  ln -s b2 "$srcdir"/fakeinstall/bin/bjam
  popd

  cd $_srcname
  ./bootstrap.sh --with-toolset=gcc --with-icu --with-python=$_python_exe

  # support for OpenMPI
  echo "using mpi ;" >>project-config.jam

  # boostbook is needed by quickbook
  install -dm755 "$srcdir"/fakeinstall/share/boostbook
  cp -a tools/boostbook/{xsl,dtd} "$srcdir"/fakeinstall/share/boostbook/

  # install to $srcdir/fakeinstall in preparation for split packaging
  ./b2 install \
    variant=release \
    debug-symbols=off \
    threading=multi \
    runtime-link=shared \
    link=shared,static \
    toolset=gcc \
    python=$_python_version \
    cflags="$CPPFLAGS $CFLAGS -fPIC -O3 -ffat-lto-objects" \
    cxxflags="$CPPFLAGS $CXXFLAGS -fPIC -O3 -ffat-lto-objects" \
    linkflags="$LDFLAGS" \
    --layout=system \
    $JOBS \
    \
    --prefix="$srcdir"/fakeinstall
}

package_boost174() {
  pkgdesc+=' (development headers)'
  depends=("boost-libs=$pkgver")
  provides=("boost=$pkgver")
  optdepends=('python39: for python bindings')
  options=('staticlibs')

  install -d "$pkgdir"/usr/lib
  cp -a fakeinstall/lib/*.{a,so} "$pkgdir"/usr/lib/
  cp -a fakeinstall/lib/cmake "$pkgdir"/usr/lib/
  cp -a fakeinstall/{bin,include,share} "$pkgdir"/usr/

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" $_srcname/LICENSE_1_0.txt
}

package_boost174-libs() {
  pkgdesc+=' (runtime libraries)'
  depends=('bzip2' 'zlib' 'icu' 'zstd')
  optdepends=('openmpi: for mpi support')
  provides=(
    "boost-libs=$pkgver"

    "libboost_atomic.so=$pkgver"
    "libboost_chrono.so=$pkgver"
    "libboost_container.so=$pkgver"
    "libboost_context.so=$pkgver"
    "libboost_contract.so=$pkgver"
    "libboost_coroutine.so=$pkgver"
    "libboost_date_time.so=$pkgver"
    "libboost_fiber.so=$pkgver"
    "libboost_filesystem.so=$pkgver"
    "libboost_graph.so=$pkgver"
    "libboost_graph_parallel.so=$pkgver"
    "libboost_iostreams.so=$pkgver"
    "libboost_locale.so=$pkgver"
    "libboost_log.so=$pkgver"
    "libboost_log_setup.so=$pkgver"
    "libboost_math_c99.so=$pkgver"
    "libboost_math_c99f.so=$pkgver"
    "libboost_math_c99l.so=$pkgver"
    "libboost_math_tr1.so=$pkgver"
    "libboost_math_tr1f.so=$pkgver"
    "libboost_math_tr1l.so=$pkgver"
    "libboost_mpi.so=$pkgver"
    "libboost_numpy39.so=$pkgver"
    "libboost_prg_exec_monitor.so=$pkgver"
    "libboost_program_options.so=$pkgver"
    "libboost_python39.so=$pkgver"
    "libboost_random.so=$pkgver"
    "libboost_regex.so=$pkgver"
    "libboost_serialization.so=$pkgver"
    "libboost_stacktrace_addr2line.so=$pkgver"
    "libboost_stacktrace_basic.so=$pkgver"
    "libboost_stacktrace_noop.so=$pkgver"
    "libboost_system.so=$pkgver"
    "libboost_thread.so=$pkgver"
    "libboost_timer.so=$pkgver"
    "libboost_type_erasure.so=$pkgver"
    "libboost_unit_test_framework.so=$pkgver"
    "libboost_wave.so=$pkgver"
    "libboost_wserialization.so=$pkgver"
  )

  install -dm755 "$pkgdir"/usr/lib
  cp -a fakeinstall/lib/*.so.* "$pkgdir"/usr/lib/

  # https://github.com/boostorg/mpi/issues/112
  local site_packages=$($_python_exe -c 'import site; print(site.getsitepackages()[0])')
  install -d "$pkgdir"$site_packages/boost
  touch "$pkgdir"$site_packages/boost/__init__.py
  $_python_exe -m compileall -o 0 -o 1 -o 2 "$pkgdir"$site_packages/boost
  cp fakeinstall/lib/boost-python*/mpi.so "$pkgdir"$site_packages/boost/mpi.so

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" $_srcname/LICENSE_1_0.txt
}
