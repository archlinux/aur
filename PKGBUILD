# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>
# Contributor: Luca Roccia <little_rock@users.sourceforge.net>

pkgbase=boost
pkgname=('boost-libs' 'boost')
pkgver=1.57.0
_boostver=${pkgver//./_}
pkgrel=1
url='http://www.boost.org/'
arch=('i686' 'x86_64')
license=('custom')
makedepends=('icu>=53.1' 'python' 'python2' 'bzip2' 'zlib' 'openmpi')
source=(https://downloads.sourceforge.net/project/${pkgbase}/${pkgbase}/${pkgver}/${pkgbase}_${_boostver}.tar.bz2)
sha1sums=('e151557ae47afd1b43dc3fac46f8b04a8fe51c12')

build() {
   export _stagedir="${srcdir}/stagedir"
   local JOBS="$(sed -e 's/.*\(-j *[0-9]\+\).*/\1/' <<< ${MAKEFLAGS})"

   cd ${pkgbase}_${_boostver}

   ./bootstrap.sh --with-toolset=gcc --with-icu --with-python=/usr/bin/python2

   _bindir="bin.linuxx86"
   [[ "${CARCH}" = "x86_64" ]] && _bindir="bin.linuxx86_64"
   install -Dm755 tools/build/src/engine/$_bindir/b2 "${_stagedir}"/bin/b2

   # Add an extra python version. This does not replace anything and python 2.x
   # need to be the default.
   echo "using python : 3.4 : /usr/bin/python3 : /usr/include/python3.4m : /usr/lib ;" \
      >> project-config.jam

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
      python=2.7 \
      cflags="${CPPFLAGS} ${CFLAGS} -O3" linkflags="${LDFLAGS}" \
      --layout=system \
      --prefix="${_stagedir}" \
      ${JOBS} \
      install
}

package_boost() {
   pkgdesc='Free peer-reviewed portable C++ source libraries - development headers'
   depends=("boost-libs=${pkgver}")
   optdepends=('python: for python bindings'
               'python2: for python2 bindings'
               'boost-build: to use boost jam for building your project.')
   options=('staticlibs')

   install -dm755 "${pkgdir}"/usr
   cp -a "${_stagedir}"/{bin,include,share} "${pkgdir}"/usr

   install -d "${pkgdir}"/usr/lib
   cp -a "${_stagedir}"/lib/*.a "${pkgdir}"/usr/lib/

   install -Dm644 "${srcdir}/"${pkgbase}_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/usr/share/licenses/boost/LICENSE_1_0.txt

   ln -s /usr/bin/b2 "$pkgdir"/usr/bin/bjam
}

package_boost-libs() {
   pkgdesc='Free peer-reviewed portable C++ source libraries - runtime libraries'
   depends=('bzip2' 'zlib' 'icu')
   optdepends=('openmpi: for mpi support')

   install -dm755 "${pkgdir}"/usr
   cp -a "${_stagedir}"/lib "${pkgdir}"/usr
   rm "${pkgdir}"/usr/lib/*.a

   install -Dm644 "${srcdir}/"${pkgbase}_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/usr/share/licenses/boost-libs/LICENSE_1_0.txt
}
