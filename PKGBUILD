# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Marius Knaust <marius.knaust@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>
# Contributor: Luca Roccia <little_rock@users.sourceforge.net>

pkgbase=boost1.69
pkgname=('boost1.69-libs' 'boost1.69')
pkgver=1.69.0
_boostver=${pkgver//./_}
pkgrel=5
url='https://www.boost.org/'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
license=('custom')
makedepends=('icu' 'python' 'python-numpy' 'bzip2' 'zlib' 'openmpi')
source=(https://downloads.sourceforge.net/project/boost/boost/${pkgver}/boost_${_boostver}.tar.bz2)
sha256sums=('8f32d4617390d1c2d16f26a27ab60d97807b35440d45891fa340fc2648b04406')

# ************************************************************************* #
# Temporary package added for building mapnik; should NOT be used elsewhere #
# ************************************************************************* #

build() {
   export _stagedir="${srcdir}/stagedir"
   local JOBS="$(sed -e 's/.*\(-j *[0-9]\+\).*/\1/' <<< ${MAKEFLAGS})"

   cd boost_${_boostver}

    ./bootstrap.sh --with-toolset=gcc --with-icu --with-python=/usr/bin/python3

   _bindir="bin.linuxx86"
   [[ "${CARCH}" = "x86_64" ]] && _bindir="bin.linuxx86_64"
   install -Dm755 tools/build/src/engine/$_bindir/b2 "${_stagedir}"/bin/b2

   # Support for OpenMPI
   echo "using mpi ;" >> project-config.jam

   # boostbook is needed by quickbook
   install -dm755 "${_stagedir}"/share/boostbook
   cp -a tools/boostbook/{xsl,dtd} "${_stagedir}"/share/boostbook/

   "${_stagedir}"/bin/b2 clean
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
   pkgdesc='Free peer-reviewed portable C++ source libraries - development headers'
   depends=("boost1.69-libs=${pkgver}")
   conflicts=('boost')
   optdepends=('python: for python bindings')
   options=('staticlibs')

   install -dm755 "${pkgdir}"/usr
   cp -a "${_stagedir}"/{bin,include,share} "${pkgdir}"/usr

   install -d "${pkgdir}"/usr/lib
   cp -a "${_stagedir}"/lib/*.a "${pkgdir}"/usr/lib/
   cp -a "${_stagedir}"/lib/libboost_*.so "${pkgdir}"/usr/lib/

   install -Dm644 "${srcdir}/"boost_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/usr/share/licenses/boost1.69/LICENSE_1_0.txt

   ln -s /usr/bin/b2 "$pkgdir"/usr/bin/bjam
}

package_boost1.69-libs() {
   pkgdesc='Free peer-reviewed portable C++ source libraries - runtime libraries'
   depends=('bzip2' 'zlib' 'icu')
   optdepends=('openmpi: for mpi support')
   provides=('libboost_context.so')

   install -dm755 "${pkgdir}"/usr
   cp -a "${_stagedir}"/lib "${pkgdir}"/usr
   rm "${pkgdir}"/usr/lib/*.a

   # remove library symlinks shipped in boost1.69 / conflicting with boost-libs
   rm "${pkgdir}"/usr/lib/libboost_*.so

   # remove mpi.so module which conflicts with boost
   rm "${pkgdir}"/usr/lib/mpi.so

   install -Dm644 "${srcdir}/"boost_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/usr/share/licenses/boost1.69-libs/LICENSE_1_0.txt
}

# vim: ts=2 sw=2 et:
