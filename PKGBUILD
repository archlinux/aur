#!/hint/bash
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
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
pkgver=1.74.0
_boostver=${pkgver//./_}
pkgrel=2
pkgdesc='Free peer-reviewed portable C++ source libraries'
url='https://www.boost.org/'
arch=('x86_64')
license=('custom')
makedepends=('icu' 'python' 'python2' 'python-numpy' 'python2-numpy' 'bzip2' 'zlib' 'openmpi' 'zstd' 'findutils')
source=("https://dl.bintray.com/boostorg/release/${pkgver}/source/boost_${_boostver}.tar.bz2"
        "${pkgbase%-python2}-ublas-c++20-allocator-patch1.patch::https://github.com/boostorg/ublas/commit/47a314dd01d1.patch"
        "${pkgbase%-python2}-ublas-c++20-allocator-patch2.patch::https://github.com/boostorg/ublas/commit/a23a903f9a36.patch"
        "${pkgbase%-python2}-ublas-c++20-iterator.patch::https://github.com/boostorg/ublas/commit/a31e5cffa85f.patch")
sha256sums=('83bfc1507731a0906e387fc28b7ef5417d591429e51e788417fe9ff025e116b1'
            '3f42688a87c532ac916889f21a4487b9e94a38a047b18724385eaa474719a9f7'
            '67f413463a1a12bdf63c913acd318148dda618d3f994e466232e265bbf0c2903'
            'aa38addb40d5f44b4a8472029b475e7e6aef1c460509eb7d8edf03491dc1b5ee')
b2sums=('2982f64fccf6fdb3b4b74452e603f459242d7abb42df4162278d9b558b637786a2eb97442126967b19088d591777c64ced8f60a23e71eaa0b7545e80f800de63'
        '2375711ebfa084fbf91171c326c3219daa2038c803338340528ff873932c2cf3a49531ed72af1be9fc7af0440e311772ee1f4c44669eb551a81476b1d65f6ca0'
        'cef20c446636a2d68746537bdbe8d2821ae9d7f56c26dc1ef5d60ce7815c133debd616617f0f5db708d5365511f176e32f863f14bf69bc5a25e72def0a6cf147'
        'e5f6d4884eaa557d5547e7e079c2edb4ed9f2f4cd8579aa32a2150f824a5d04413f2a91e79b3139d5b915da6a46f7835f1438ad53f33096973f1a99f378ec1d3')

prepare() {
   cd ${pkgbase%-python2}_${_boostver}

   # https://github.com/boostorg/ublas/issues/96
   patch -Np2 -i ../${pkgbase%-python2}-ublas-c++20-allocator-patch1.patch
   patch -Np2 -i <(<../${pkgbase%-python2}-ublas-c++20-allocator-patch2.patch \
     sed 's:test/:pls-apply-cleanly-kthxbai/libs/numeric/ublas/&:g')

   # https://github.com/boostorg/ublas/pull/97
   patch -Np2 -i ../${pkgbase%-python2}-ublas-c++20-iterator.patch
}

build() {
   export _stagedir="${srcdir}/stagedir"
   local JOBS; JOBS="$(grep -oP -- "-j\s*[0-9]+" <<< "${MAKEFLAGS}")"

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
      "${JOBS}" \
      \
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
