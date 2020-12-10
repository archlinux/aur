#!/hit/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=appleseed
pkgrel=2
pkgver=2.1.0
_pkgver=${pkgver}-beta
pkgdesc="Physically-based global illumination rendering engine primarily designed for animation and visual effects."
arch=(x86_64)
url="https://appleseedhq.net"
license=('MIT')
provides=('appleseed')
conflicts=('appleseed')
depends=(python2 python embree qt5-base seexpr-qt5 boost openexr opencolorio 'openimageio=2.1.19.0' 'openshadinglanguage=1.10.13' xerces-c zlib)
makedepends=(cmake ninja)
options=()
_github="https://github.com/${pkgname}hq/${pkgname}"
source=("${_github}/archive/${_pkgver}.tar.gz"
        "cmake.extra.install.dirs.remove.patch"
        "boost_107200.patch"
        "python38.patch"
        )
sha256sums=('5f8599c64a9c1dbdf0d8ee13a4d395b03e9bcba17fec731526109437ab760898'
            '87b987f006e45d11cc4dfec2bd37fd2b760fd2bdbf06f48e7d467cbca9b2b301'
            '8c23f1800a2bfd541f86aba9929588aa318998098fe303a4ee13980b843746b6'
            '9206bc3934dcd48036b89b3721658136bf465dd37bb846bdfcf95cf9beb14130')


CMAKE_FLAGS=( -DWITH_EMBREE=ON
              -DCMAKE_BUILD_TYPE=Ship
              -DCMAKE_INSTALL_PREFIX=/opt/appleseed
              -DWITH_DISNEY_MATERIAL=ON
              -DWITH_PYTHON3_BINDINGS=ON
              -DUSE_STATIC_EMBREE=OFF
              -DUSE_STATIC_EXR=OFF
              -DUSE_STATIC_BOOST=OFF
              -DUSE_STATIC_OCIO=OFF
              -DUSE_STATIC_OIIO=OFF
              -DUSE_STATIC_OSL=OFF
              -DWARNINGS_AS_ERRORS=OFF
            )

prepare() {
  for patch in "${srcdir}"/*.patch; do
    msg2 "Applying patch: ${patch##*/}"
    patch -d "${pkgname}-${_pkgver}" -Nfp1 -i "$patch" || true #silently drop failed chunks
  done
  grep -q    avx /proc/cpuinfo && CMAKE_FLAGS+=(   -DUSE_AVX=ON)
  grep -q   avx2 /proc/cpuinfo && CMAKE_FLAGS+=(  -DUSE_AVX2=ON)
  grep -q   f16c /proc/cpuinfo && CMAKE_FLAGS+=(  -DUSE_F16C=ON)
  grep -q sse4_2 /proc/cpuinfo && CMAKE_FLAGS+=( -DUSE_SSE42=ON)
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  CMAKE_FLAGS+=( -DPYTHON3_INCLUDE_DIR="/usr/include/python${_pyver}")
  cmake "${CMAKE_FLAGS[@]}" -S "${pkgname}-${_pkgver}" -B build
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -D -m644 "${pkgname}-${_pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
