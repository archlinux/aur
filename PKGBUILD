# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Jan Was < janek.jan@gmail.com >
# Contributor: Dan Vratil <dan@progdan.cz>
# Contributor: andy123 < ajs AT online DOT de >

pkgname=lib32-boost-libs
pkgver=1.78.0
pkgrel=1
_srcname=boost_${pkgver//./_}
pkgdesc="Free peer-reviewed portable C++ source libraries - runtime libraries (32-bit)"
url="http://www.boost.org"
arch=('x86_64')
license=('custom')
groups=('lib32')
makedepends=('lib32-icu' 'lib32-bzip2' 'lib32-zlib' 'lib32-zstd' 'python')
depends=('lib32-bzip2' 'lib32-zlib' 'lib32-icu' 'lib32-zstd')
provides=(libboost_atomic.so libboost_chrono.so libboost_container.so
          libboost_context.so libboost_contract.so libboost_coroutine.so
          libboost_date_time.so libboost_fiber.so libboost_filesystem.so
          libboost_graph.so libboost_graph_parallel.so libboost_iostreams.so
          libboost_json.so libboost_locale.so libboost_log.so libboost_log_setup.so
          libboost_math_c99.so libboost_math_c99f.so libboost_math_c99l.so
          libboost_math_tr1.so libboost_math_tr1f.so libboost_math_tr1l.so
          libboost_prg_exec_monitor.so libboost_program_options.so
          libboost_random.so libboost_regex.so libboost_serialization.so
          libboost_stacktrace_addr2line.so libboost_stacktrace_basic.so
          libboost_stacktrace_noop.so libboost_system.so libboost_thread.so
          libboost_timer.so libboost_type_erasure.so libboost_unit_test_framework.so
          libboost_wave.so libboost_wserialization.so)
options=('staticlibs')
source=(https://boostorg.jfrog.io/artifactory/main/release/$pkgver/source/$_srcname.tar.gz
        boost-b2-fix-lib-install.patch::https://github.com/bfgroup/b2/commit/78fd284a42ca.patch
        boost-ublas-c++20-iterator.patch::https://github.com/boostorg/ublas/commit/a31e5cffa85f.patch)
sha256sums=('94ced8b72956591c4775ae2207a9763d3600b30d9d7446562c552f0a14a63be7'
            'd233b16920ad7da8bb6e02bf5fb4e429592057b4f4db28d4babf3850e837a8db'
            'aa38addb40d5f44b4a8472029b475e7e6aef1c460509eb7d8edf03491dc1b5ee')

# This version of lib32-boost-libs does not include support OpenMPI or the
# Python bindings since there are no (up to date) lib32 packages available for
# them

prepare() {
  cd $_srcname

  # https://github.com/bfgroup/b2/issues/104
  patch -Np1 -d tools/build <../boost-b2-fix-lib-install.patch

  # https://github.com/boostorg/ublas/pull/97
  patch -Np2 -i ../boost-ublas-c++20-iterator.patch
}

build() {
  local JOBS="$(sed 's/.*\(-j *[0-9]\+\).*/\1/' <<<$MAKEFLAGS)"

  # We need b2 before we can compile Boost itself, but this should just be built
  # for the native architecture
  pushd $_srcname/tools/build
  ./bootstrap.sh --cxxflags="$CXXFLAGS $LDFLAGS"
  ./b2 install --prefix="$srcdir"/fakeinstall
  ln -s b2 "$srcdir"/fakeinstall/bin/bjam
  popd

  export CC='gcc'
  export CFLAGS+=' -m32'
  export CXX='g++'
  export CXXFLAGS+=' -m32'
  export LDFLAGS+=' -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_srcname
  # There are currently no up to date lib32-python packages available
  ./bootstrap.sh --with-toolset=gcc --with-icu --with-python=

  # Same for OpenMPI
  # # support for OpenMPI
  # echo "using mpi ;" >>project-config.jam

  # boostbook is needed by quickbook
  install -dm755 "$srcdir"/fakeinstall/share/boostbook
  cp -a tools/boostbook/{xsl,dtd} "$srcdir"/fakeinstall/share/boostbook/

  # Since we're sticking to the original PKGBUILD we'll still do this
  # fakeinstall thing, even though we're generating only one package
  # install to $srcdir/fakeinstall in preparation for split packaging
  ./b2 install \
    variant=release \
    debug-symbols=off \
    threading=multi \
    runtime-link=shared \
    link=shared,static \
    toolset=gcc \
    address-model=32 \
    --without-python \
    --without-mpi \
    cflags="$CPPFLAGS $CFLAGS -fPIC -O3" \
    cxxflags="$CPPFLAGS $CXXFLAGS -fPIC -O3" \
    linkflags="$LDFLAGS" \
    --layout=system \
    $JOBS \
    \
    --prefix="$srcdir"/fakeinstall
}

package() {
  # We're including both static libraries and shared objects here. The regular
  # boost package splits those between the `boost` and `boost-libs` packages.
  install -dm755 "${pkgdir}"/usr/lib32
  cp -a fakeinstall/lib/* "${pkgdir}"/usr/lib32

  # This would be needed if built with Python support
  # # https://github.com/boostorg/mpi/issues/112
  # install -d "$pkgdir"/usr/lib/python3.9/site-packages/boost
  # touch "$pkgdir"/usr/lib/python3.9/site-packages/boost/__init__.py
  # python -m compileall -o 0 -o 1 -o 2 "$pkgdir"/usr/lib/python3.9/site-packages/boost
  # cp fakeinstall/lib/boost-python3.9/mpi.so \
  #   "$pkgdir"/usr/lib32/python3.9/site-packages/boost/mpi.so

  # # https://github.com/boostorg/python/issues/203#issuecomment-391477685
  # for _lib in python numpy; do
  #   ln -srL "$pkgdir"/usr/lib32/libboost_${_lib}3{9,}.so
  # done

  install -Dm644 $_srcname/LICENSE_1_0.txt \
     "${pkgdir}"/usr/share/licenses/lib32-boost-libs/LICENSE_1_0.txt
}
