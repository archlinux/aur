# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Jan Was < janek.jan@gmail.com >
# Contributor: Dan Vratil <dan@progdan.cz>
# Contributor: andy123 < ajs AT online DOT de >

pkgname=lib32-boost-libs
pkgver=1.72.0
_boostver=${pkgver//./_}
pkgrel=1
url='http://www.boost.org'
arch=('x86_64')
pkgdesc='Free peer-reviewed portable C++ source libraries - runtime libraries (32-bit)'
license=('custom')
groups=('lib32')
depends=('lib32-bzip2' 'lib32-zlib' 'lib32-icu' 'lib32-zstd')
makedepends=('lib32-icu' 'lib32-bzip2' 'lib32-zlib' 'lib32-zstd' 'findutils' 'python' 'python2')
provides=(libboost_atomic.so libboost_chrono.so libboost_container.so
          libboost_context.so libboost_contract.so libboost_coroutine.so
          libboost_date_time.so libboost_fiber.so libboost_filesystem.so
          libboost_graph.so libboost_graph_parallel.so libboost_iostreams.so
          libboost_locale.so libboost_log.so libboost_log_setup.so
          libboost_math_c99.so libboost_math_c99f.so libboost_math_c99l.so
          libboost_math_tr1.so libboost_math_tr1f.so libboost_math_tr1l.so
          libboost_prg_exec_monitor.so libboost_program_options.so
          libboost_random.so libboost_regex.so libboost_serialization.so
          libboost_stacktrace_addr2line.so libboost_stacktrace_basic.so
          libboost_stacktrace_noop.so libboost_system.so libboost_thread.so
          libboost_timer.so libboost_type_erasure.so libboost_unit_test_framework.so
          libboost_wave.so libboost_wserialization.so)
options=('staticlibs')
source=(https://dl.bintray.com/boostorg/release/${pkgver}/source/boost_${_boostver}.tar.bz2)
sha256sums=('59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722')
b2sums=('ab270a0e3cb24da687d86785e2d2e6d7731b4dbc07bd839eadb642dfa5a428ad584acb1f3529661a8de9a986008ff3427491041059ea2b742348d02e00761cd8')

# This version of lib32-boost-libs does not include support OpenMPI or the
# Python bindings since there are no (up to date) lib32 packages available for
# them

build() {
  export CC='gcc'
  export CFLAGS='-m32'
  export CXX='g++'
  export CXXFLAGS='-m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  export _stagedir="${srcdir}/stagedir"
  local JOBS="$(sed -e 's/.*\(-j *[0-9]\+\).*/\1/' <<< ${MAKEFLAGS})"

  cd boost_${_boostver}

  # There are currently no up to date lib32-python packages available
  ./bootstrap.sh --with-toolset=gcc --with-icu --with-python=

  install -Dm755 tools/build/src/engine/b2 "${_stagedir}"/bin/b2

  # Same for OpenMPI
  # # Support for OpenMPI
  # echo "using mpi ;" >> project-config.jam

  # boostbook is needed by quickbook
  install -dm755 "${_stagedir}"/share/boostbook
  cp -a tools/boostbook/{xsl,dtd} "${_stagedir}"/share/boostbook/

  # default "minimal" install: "release link=shared,static
  # runtime-link=shared threading=single,multi"
  # --layout=tagged will add the "-mt" suffix for multithreaded libraries
  # and installs includes in /usr/include/boost.
  # --layout=system no longer adds the -mt suffix for multi-threaded libs.
  # install to ${_stagedir} in preparation for split packaging
  "${_stagedir}"/bin/b2 \
     variant=release \
     debug-symbols=off \
     threading=multi \
     runtime-link=shared \
     link=shared,static \
     toolset=gcc \
     address-model=32 \
     --without-python \
     --without-mpi \
     cflags="${CPPFLAGS} ${CFLAGS} -fPIC -O3" \
     cxxflags="${CPPFLAGS} ${CXXFLAGS} -std=c++14 -fPIC -O3" \
     linkflags="${LDFLAGS}" \
     --layout=system \
     ${JOBS} \
     \
     --prefix="${_stagedir}" \
     install
}

package() {
  # We're including both static libraries and shared objects here. The regular
  # boost package splits those between the `boost` and `boost-libs` packages.
  install -dm755 "${pkgdir}"/usr/lib32
  cp -a "${_stagedir}"/lib/* "${pkgdir}"/usr/lib32

  # These are already included in the regular `boost` package
  rm -r "${pkgdir}"/usr/lib32/cmake

  # This would be needed if built with Python support
  # # https://github.com/boostorg/python/issues/203#issuecomment-391477685
  # for _lib in python numpy; do
  #   ln -srL "${pkgdir}"/usr/lib32/libboost_${_lib}{27,}.so
  #   ln -srL "${pkgdir}"/usr/lib32/libboost_${_lib}3{8,}.so
  # done

  install -Dm644 "${srcdir}/"boost_${_boostver}/LICENSE_1_0.txt \
     "${pkgdir}"/usr/share/licenses/lib32-boost-libs/LICENSE_1_0.txt
}
