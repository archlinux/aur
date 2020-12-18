# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>
pkgbase=boost1.69
pkgname=('boost1.69-libs' 'boost1.69')
pkgver=1.69.0
_boostver=${pkgver//./_}
pkgrel=7
pkgdesc='Free peer-reviewed portable C++ source libraries'
url='https://www.boost.org/'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
license=('custom')
makedepends=('icu' 'python' 'python-numpy' 'bzip2' 'zlib' 'openmpi' 'zstd' 'findutils')
source=(https://dl.bintray.com/boostorg/release/${pkgver}/source/boost_${_boostver}.tar.bz2)
sha256sums=('8f32d4617390d1c2d16f26a27ab60d97807b35440d45891fa340fc2648b04406')

build() {
   export _stagedir="${srcdir}/stagedir"
   local JOBS="$(sed -e 's/.*\(-j *[0-9]\+\).*/\1/' <<< ${MAKEFLAGS})"

   cd boost_${_boostver}

   ./bootstrap.sh \
     --with-toolset=gcc \
     --with-icu \
     --with-python=/usr/bin/python3 \

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
      python=3.9 \
      cflags="${CPPFLAGS} ${CFLAGS} -fPIC -O3" \
      cxxflags="${CPPFLAGS} ${CXXFLAGS} -std=c++14 -fPIC -O3" \
      linkflags="${LDFLAGS}" \
      --layout=system \
      ${JOBS} \
      \
      --prefix="${_stagedir}" \
      install
}

package_boost1.69() {
   pkgdesc+=' - development headers'
   depends=("boost1.69-libs")
   optdepends=('python: for python bindings')
   options=('staticlibs')

   install -dm755 "${pkgdir}"/opt/boost1.69
   cp -a "${_stagedir}"/{bin,include,share} "${pkgdir}"/opt/boost1.69

   install -d "${pkgdir}"/opt/boost1.69/lib
   cp -a "${_stagedir}"/lib/*.a "${pkgdir}"/opt/boost1.69/lib/

   install -Dm644 "${srcdir}/"boost_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/opt/boost1.69/share/licenses/boost/LICENSE_1_0.txt

   ln -s /opt/boost1.69/bin/b2 "$pkgdir"/opt/boost1.69/bin/bjam
}

package_boost1.69-libs() {
   pkgdesc+=' - runtime libraries'
   depends=('bzip2' 'zlib' 'icu' 'zstd')
   optdepends=('openmpi: for mpi support')

   install -dm755 "${pkgdir}"/opt/boost1.69
   cp -a "${_stagedir}"/lib "${pkgdir}"/opt/boost1.69
   rm "${pkgdir}"/opt/boost1.69/lib/*.a

   # https://github.com/boostorg/python/issues/203#issuecomment-391477685
   for _lib in python numpy; do
     ln -srL "${pkgdir}"/opt/boost1.69/lib/libboost_${_lib}3{9,}.so
   done

   install -Dm644 "${srcdir}/"boost_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/opt/boost1.69/share/licenses/boost-libs/LICENSE_1_0.txt
}

# vim: ts=2 sw=2 et:
