# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Marius Knaust <marius.knaust@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>
# Contributor: Luca Roccia <little_rock@users.sourceforge.net>

pkgbase=boost-python2
pkgname=('boost-python2-libs' 'boost-python2')
pkgver=1.83.0
_boostver=${pkgver//./_}
pkgrel=1
pkgdesc='Free peer-reviewed portable C++ source libraries'
url='https://www.boost.org/'
arch=('x86_64')
license=('custom')
makedepends=('icu' 'python2' 'python2-numpy' 'bzip2' 'zlib' 'openmpi' 'zstd' 'findutils')
source=("https://boostorg.jfrog.io/artifactory/main/release/${pkgver}/source/boost_${_boostver}.tar.bz2"
        "${pkgbase%-python2}-ublas-c++20-iterator.patch::https://github.com/boostorg/ublas/commit/a31e5cffa85f.patch")
sha256sums=('6478edfe2f3305127cffe8caf73ea0176c53769f4bf1585be237eb30798c3b8e'
            'aa38addb40d5f44b4a8472029b475e7e6aef1c460509eb7d8edf03491dc1b5ee')
b2sums=('c4af1713712da82f964fe08451141ea96905e30b475ee5090bf87ae6e43bcb1f258ab92e16e992fd22405e8cd85a435cef76a22b98788d9960396a4fec8c4c62'
        'e5f6d4884eaa557d5547e7e079c2edb4ed9f2f4cd8579aa32a2150f824a5d04413f2a91e79b3139d5b915da6a46f7835f1438ad53f33096973f1a99f378ec1d3')

prepare() {
   cd ${pkgbase%-python2}_${_boostver}

   # https://github.com/boostorg/ublas/pull/97
   patch -Np2 -i ../${pkgbase%-python2}-ublas-c++20-iterator.patch
}

build() {
   export _stagedir="${srcdir}/stagedir"

   cd ${pkgbase%-python2}_${_boostver}

   ./bootstrap.sh \
     --with-toolset=gcc \
     --with-icu \
     --with-python=/usr/bin/python2 \
     --with-libraries=python

   install -Dm755 tools/build/src/engine/b2 "${_stagedir}"/bin/b2

   # Support for OpenMPI
   echo "using mpi ;" >> project-config.jam

   # boostbook is needed by quickbook
   install -dm755 "${_stagedir}"/share/boostbook
   cp -a tools/boostbook/{xsl,dtd} "${_stagedir}"/share/boostbook/

   "${_stagedir}"/bin/b2 \
      variant=release \
      debug-symbols=off \
      threading=multi \
      runtime-link=shared \
      link=shared,static \
      toolset=gcc \
      python=2.7 \
      cflags="${CPPFLAGS} ${CFLAGS} -fPIC -O3" \
      cxxflags="${CPPFLAGS} ${CXXFLAGS} -std=c++14 -fPIC -O3" \
      linkflags="${LDFLAGS}" \
      --layout=system \
      --prefix="${_stagedir}" \
      --with-python \
      install
}

package_boost-python2() {
   pkgdesc+=' - development headers'
   depends=(python2 "boost-python2-libs=${pkgver}")
   options=('staticlibs')

   install -dm755 "${pkgdir}"/usr/lib
   cp -a "${_stagedir}"/lib/*.a "${pkgdir}"/usr/lib/
   find "$_stagedir" -name "libboost_*py2.7.cmake"|while read -r file; do
      install -Dm755 "$file" "${pkgdir}/usr/${file#$_stagedir}"
   done

   install -Dm644 "${srcdir}/"${pkgbase%-python2}_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/usr/share/licenses/boost-python2/LICENSE_1_0.txt
}

package_boost-python2-libs() {
   pkgdesc+=' - runtime libraries'
   depends=(glibc gcc-libs)
   optdepends=('openmpi: for mpi support')
   provides=(libboost_python27.so)

   install -dm755 "${pkgdir}"/usr
   cp -a "${_stagedir}"/lib "${pkgdir}"/usr
   rm "${pkgdir}"/usr/lib/*.a
   rm -r "${pkgdir}"/usr/lib/cmake

   # https://github.com/boostorg/python/issues/203#issuecomment-391477685
   for _lib in python numpy; do
     ln -srL "${pkgdir}"/usr/lib/libboost_${_lib}{27,}.so
   done

   install -Dm644 "${srcdir}/"${pkgbase%-python2}_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/usr/share/licenses/boost-python2-libs/LICENSE_1_0.txt
}

# vim: ts=2 sw=2 et:
