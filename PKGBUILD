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
depends=(python2 python embree qt5-base seexpr-qt5 boost{,-python2}-libs openexr opencolorio openimageio openshadinglanguage xerces-c zlib)
makedepends=(boost{,-python2} cmake ninja)
options=()
_github="https://github.com/${pkgname}hq/${pkgname}"
source=(appleseed.tgz::"${_github}/archive/${_pkgver}.tar.gz"
        osl_1.11.8.patch::"https://github.com/appleseedhq/appleseed/pull/2900.patch"
        "cmake.extra.install.dirs.remove.patch"
        "boost_107200.patch"
        "python39.patch"
        )
sha256sums=('5f8599c64a9c1dbdf0d8ee13a4d395b03e9bcba17fec731526109437ab760898'
            '0171eaa9ec499ecf74ac8878dbacfb28f81094e9a7bed46819314613e6ae7133'
            '87b987f006e45d11cc4dfec2bd37fd2b760fd2bdbf06f48e7d467cbca9b2b301'
            '125d5191b52122434984ccc11a6f2677697a4fee3b9f4571ee0d3742a43a74a4'
            '5e0bffb5a1c1a877abf75c55a5485b2bf6220caa9886ba073e7513cbf4245886')
b2sums=('67005025f46c8fa8ac236e56e8fc3f447bd2e2a9862f8db37015cafeaf4d67536dc01aace81f2683586eced54221284e6cc7d697399f873c4e53de5b0fd59ae0'
        'cc21c08931d4e5060bbf9b8d2732e68eb28edc923e952db09665e2f63a0918e24f6d35f39a2ea2048a6b5ad67833df08bc9a5e1fea065e1df975ca5e40d414f0'
        '85d278ea12672e44657fbfe8695744508db88cea54dbc93410632b05175c94a5e29e28dfb739ba88ec10a2449ff499484854ba177db03f5e41b24d2b8e6b9328'
        '74ee6d8ef1d26155ec3775bf9c8793a760939835e8b09d574d0c152ecca90b78e31e8c1de3b576cf13c640131d5ce757c8488ab902439decd5f80b8d511f6251'
        '115d48a3b570f9b7c1bbd5b38f1b5bdb8ded6b21ccb9c83ccbb305fad00942336b2cfd7ec3674a80a94edec0512d14c9d7ada4eed57a08f8d78ab23b7e636600')

prepare() {
  for patch in "${srcdir}"/*.patch; do
    msg2 "Applying patch: ${patch##*/}"
    patch -d "${pkgname}-${_pkgver}" -Nfp1 -i "$patch" || true #silently drop failed chunks
  done
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
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
              -DWITH_BENCH=OFF
              -DPYTHON3_INCLUDE_DIR="/usr/include/python${_pyver}"
              -Wno-dev
            )
  grep -q    avx /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_AVX=ON)
  grep -q   avx2 /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_AVX2=ON)
  grep -q   f16c /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_F16C=ON)
  grep -q sse4_2 /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_SSE42=ON)

  cmake "${CMAKE_FLAGS[@]}" -S "${srcdir}/${pkgname}-${_pkgver}" -B build -G Ninja
# shellcheck disable=SC2086 # allow MAKEFLAGS to carry multiple flags
  ninja -C build ${MAKEFLAGS:--j1}
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -D -m644 "${pkgname}-${_pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
