# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Jan Was < janek.jan@gmail.com >
# Contributor: Dan Vratil <dan@progdan.cz>
# Contributor: andy123 < ajs AT online DOT de >

pkgname=lib32-boost-libs
pkgver=1.75.0
_boostver=${pkgver//./_}
pkgrel=1
url='http://www.boost.org'
arch=('x86_64')
pkgdesc='Free peer-reviewed portable C++ source libraries - runtime libraries (32-bit)'
license=('custom')
groups=('lib32')
depends=('lib32-bzip2' 'lib32-zlib' 'lib32-icu' 'lib32-zstd')
makedepends=('lib32-icu' 'lib32-bzip2' 'lib32-zlib' 'lib32-zstd' 'findutils' 'python')
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
# FIXME: The repository used in the orignal Arch package seems to be gone. This
#        download is listed on Boost's own download page so it should be safe,
#        but we should check what the regular boost PKGBUILD is doing after
#        that gets updated:
#        https://github.com/archlinux/svntogit-packages/blob/packages/boost/trunk/PKGBUILD
source=(https://boostorg.jfrog.io/artifactory/main/release/${pkgver}/source/boost_${_boostver}.tar.bz2
       boost-ublas-c++20-iterator.patch::https://github.com/boostorg/ublas/commit/a31e5cffa85f.patch)
sha256sums=('953db31e016db7bb207f11432bef7df100516eeb746843fa0486a222e3fd49cb'
            'aa38addb40d5f44b4a8472029b475e7e6aef1c460509eb7d8edf03491dc1b5ee')
b2sums=('ce7ecd8bcee518ce54f7e5302f202acbea60cedd6ae9248708c0bb5bbc2713607b2e1967a9e6f77cc20a4c008c1ee4db651def55937efc80407487a7a44fa8d6'
        'e5f6d4884eaa557d5547e7e079c2edb4ed9f2f4cd8579aa32a2150f824a5d04413f2a91e79b3139d5b915da6a46f7835f1438ad53f33096973f1a99f378ec1d3')

# This version of lib32-boost-libs does not include support OpenMPI or the
# Python bindings since there are no (up to date) lib32 packages available for
# them

prepare() {
   cd boost_${_boostver}

   # https://github.com/boostorg/ublas/pull/97
   patch -Np2 -i ../boost-ublas-c++20-iterator.patch
}

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
  #   ln -srL "${pkgdir}"/usr/lib32/libboost_${_lib}3{9,}.so
  # done

  install -Dm644 "${srcdir}/"boost_${_boostver}/LICENSE_1_0.txt \
     "${pkgdir}"/usr/share/licenses/lib32-boost-libs/LICENSE_1_0.txt
}
