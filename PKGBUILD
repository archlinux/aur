# Maintainer: piernov <piernov@piernov.org>
# Contributor: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: Marcin Kornat <rarvolt+aur@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=('boost-65-compat' 'boost-65-compat-libs')
_pkgname=boost
pkgver=1.65.1
_boostver=${pkgver//./_}
pkgrel=9
pkgdesc="Free peer-reviewed portable C++ source libraries - compat version"
arch=('x86_64')
url='https://www.boost.org/'
license=('custom')
makedepends=('python' 'python-numpy')
source=(https://boostorg.jfrog.io/artifactory/main/release/${pkgver}/source/${_pkgname}_${_boostver}.tar.bz2
    https://github.com/boostorg/build/commit/2f84a23f8d747f4ebe9d29ea7e8722a543f33f2b.patch
    https://github.com/boostorg/build/commit/48e9017139dd94446633480661e5447c7e0d8b1b.patch
    https://github.com/boostorg/build/commit/2b44ccf5dc5850c79f6bbe9811a91a1a7ad37f3d.patch
    https://github.com/boostorg/python/commit/660487c43fde76f3e64f1cb2e644500da92fe582.patch
    https://github.com/boostorg/python/commit/0474de0f6cc9c6e7230aeb7164af2f7e4ccf74bf.patch
    https://github.com/boostorg/python/commit/99a5352b5cf790c559a7b976c1ba99520431d9d1.patch
    https://src.fedoraproject.org/fork/thrnciar/rpms/boost/raw/047403fc9c6ea6f581f38214f680f3173e157138/f/boost-1.73-python3.10-Py_fopen.patch
    500194edb7833d0627ce7a2595fec49d0aae2484_python_tree.patch
    500194edb7833d0627ce7a2595fec49d0aae2484_boost_tree.patch)
#source=(https://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}_${_boostver}.tar.bz2)
sha256sums=('9807a5d16566c57fd74fb522764e0b134a8bbe6b6e8967b83afefd30dcd3be81'
            '2e533e553bd87cdf8ddf97927d26eb998cb00090e2735253d308b9329200bc39'
            'efe3964b341b25181bb111890547feba2f86f2b4b106cc4d678525d53f389c31'
            '390a8cbd10a838cdbb50175d54db2fb80759799d7e412e7672a2f9f2e00052dc'
            '00d66b49b548aa6254ec8dc5b6b859ab3ff9ca7c0cf0ceba72401f71a572bffd'
            'ccda8ef8126c93f4c8d29ba43b5f301952e5eacdc7fecb2ae3d01115a2222c53'
            '4ddb143714af0e38d5f48b3b07b57161fd86398da4ace6787802836cdc2903d8'
            'a03de50c3b7a6c07fc797551c6f52368aba2a139db0780bfd385db9039f5627d'
            'ed5a609549491fa6e7640dc9d80f23a34dee899af61850f31fe3f0e99c1754ad'
            'ecd7f0548143fbaeb79155f04e409fe295a4f13bfd9e95518fcb1dd6b73abed3')

prepare() {
    cd $srcdir/${_pkgname}_${_boostver}/tools/build
    patch -p1 < "${srcdir}"/2f84a23f8d747f4ebe9d29ea7e8722a543f33f2b.patch
    patch -p1 < "${srcdir}"/48e9017139dd94446633480661e5447c7e0d8b1b.patch
    patch -p1 < "${srcdir}"/2b44ccf5dc5850c79f6bbe9811a91a1a7ad37f3d.patch
    cd $srcdir/${_pkgname}_${_boostver}/libs/python
    patch -p1 < "${srcdir}"/660487c43fde76f3e64f1cb2e644500da92fe582.patch
    patch -p1 < "${srcdir}"/500194edb7833d0627ce7a2595fec49d0aae2484_python_tree.patch
    patch -p1 < "${srcdir}"/0474de0f6cc9c6e7230aeb7164af2f7e4ccf74bf.patch
    patch -p1 < "${srcdir}"/99a5352b5cf790c559a7b976c1ba99520431d9d1.patch
    cd $srcdir/${_pkgname}_${_boostver}
    patch -p1 < "${srcdir}"/boost-1.73-python3.10-Py_fopen.patch
    patch -p2 < "${srcdir}"/500194edb7833d0627ce7a2595fec49d0aae2484_boost_tree.patch
}

build() {
   export _stagedir="${srcdir}/stagedir"
   local JOBS="$(sed -e 's/.*\(-j *[0-9]\+\).*/\1/' <<< ${MAKEFLAGS})"

   cd ${_pkgname}_${_boostver}
   ./bootstrap.sh --with-toolset=gcc --with-icu --with-python=/usr/bin/python3

   _bindir="bin.linuxx86"
   [[ "${CARCH}" = "x86_64" ]] && _bindir="bin.linuxx86_64"
   install -Dm755 tools/build/src/engine/$_bindir/b2 "${_stagedir}"/bin/b2

   # Support for OpenMPI
   echo "using mpi ;" >> project-config.jam

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
      python=3.12 \
      cflags="${CPPFLAGS} ${CFLAGS} -fPIC -O3" \
      cxxflags="${CPPFLAGS} ${CXXFLAGS} -std=c++14 -fPIC -O3" \
      linkflags="${LDFLAGS}" \
      --layout=system \
      ${JOBS} \
      \
      --prefix="${_stagedir}" \
      install
}

package_boost-65-compat() {
   pkgdesc+=' - development headers'
   depends=("boost-65-compat-libs=${pkgver}")
   optdepends=('python: for python bindings')
   conflicts=('boost' 'boost-libs')
   options=('staticlibs')

   install -dm755 "${pkgdir}"/usr
   cp -a "${_stagedir}"/{bin,include,share} "${pkgdir}"/usr

   install -d "${pkgdir}"/usr/lib
   cp -a "${_stagedir}"/lib/*.a "${pkgdir}"/usr/lib/
   cp -a "${_stagedir}"/lib/libboost_*.so "${pkgdir}"/usr/lib/

   install -Dm644 "${srcdir}/"${_pkgname}_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/usr/share/licenses/boost-65-compat/LICENSE_1_0.txt

   ln -s /usr/bin/b2 "$pkgdir"/usr/bin/bjam
}

package_boost-65-compat-libs() {
   pkgdesc+=' - runtime libraries'
   depends=('bzip2' 'zlib' 'icu' 'zstd')
   optdepends=('openmpi: for mpi support')
   provides=(libboost_atomic.so.$pkgver libboost_chrono.so.$pkgver libboost_container.so.$pkgver
     libboost_context.so.$pkgver libboost_coroutine.so.$pkgver
     libboost_date_time.so.$pkgver libboost_fiber.so.$pkgver libboost_filesystem.so.$pkgver
     libboost_graph.so.$pkgver libboost_graph_parallel.so.$pkgver libboost_iostreams.so.$pkgver
     libboost_locale.so.$pkgver libboost_log.so.$pkgver libboost_log_setup.so.$pkgver
     libboost_math_c99.so.$pkgver libboost_math_c99f.so.$pkgver libboost_math_c99l.so.$pkgver
     libboost_math_tr1.so.$pkgver libboost_math_tr1f.so.$pkgver libboost_math_tr1l.so.$pkgver
     libboost_mpi.so.$pkgver libboost_mpi_python.so.$pkgver libboost_numpy.so.$pkgver libboost_numpy3.so.$pkgver
     libboost_prg_exec_monitor.so.$pkgver libboost_program_options.so.$pkgver
     libboost_python3.so.$pkgver libboost_random.so.$pkgver
     libboost_regex.so.$pkgver libboost_serialization.so.$pkgver libboost_signals.so.$pkgver
     libboost_stacktrace_addr2line.so.$pkgver libboost_stacktrace_basic.so.$pkgver
     libboost_stacktrace_noop.so.$pkgver libboost_system.so libboost_thread.so.$pkgver
     libboost_timer.so.$pkgver libboost_type_erasure.so.$pkgver libboost_unit_test_framework.so.$pkgver
     libboost_wave.so.$pkgver libboost_wserialization.so.$pkgver)

   install -dm755 "${pkgdir}"/usr
   cp -a "${_stagedir}"/lib "${pkgdir}"/usr
   rm "${pkgdir}"/usr/lib/*.a
   rm "${pkgdir}"/usr/lib/*.so

   install -Dm644 "${srcdir}/"${_pkgname}_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/usr/share/licenses/boost-65-compat-libs/LICENSE_1_0.txt
}
