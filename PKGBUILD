# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Co-Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: Guillaume Dolle  <dev at gdolle.com>

pkgname=micromamba
_pkgname=${pkgname/micro/}
pkgver=2.3.1
pkgrel=1
pkgdesc="The fast cross-platform package manager"
arch=(i686 x86_64)
url="https://github.com/${_pkgname}-org/${_pkgname}"
license=(BSD-3-Clause)
depends=(python fmt libsolv reproc yaml-cpp simdjson)
makedepends=(cli11 spdlog tl-expected nlohmann-json cmake pybind11 ninja
  python-build python-installer python-scikit-build)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz
  static-off.patch
  utils.cpp.patch)
sha512sums=('d33642652e30d105f43c01588af2324e712e10a27e735cc82f9bfde111b8beb6cc00dd595262f409b7627a7a922b816047be900a1bb8908af750abd5a11048ee'
            'ee549a0bff94bff386a820cb54e38b0c51f7f563c9dd99ab017bc4ba46a117a11fe8e6c016a8e6eef1ae30cde8e0f57b04d6cda685ad8f1609e1f22c38bf9258'
            '62deaeef709c6b03ed92cdf4890e4b8b8171ce72ddd83b3ff33ae8f9a2696a0ec1e1e6025b64ca654b3debb99654c9e36a404bc947b504becc452d6f39c168e6')
provides=(
  "libmamba=${pkgver}"
  "libmambapy=${pkgver}"
)
conflicts=(
  'micromamba-bin'
)

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -p0 -i "${srcdir}/static-off.patch"
  patch -p0 -i "${srcdir}/utils.cpp.patch"
}

build() {
  cmake \
    -S ${_pkgname}-${pkgver} \
    -B build/ \
    -G Ninja \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D CMAKE_BUILD_TYPE=Release \
    -D BUILD_LIBMAMBA=ON \
    -D BUILD_LIBMAMBAPY=ON \
    -D BUILD_MICROMAMBA=ON \
    -D BUILD_SHARED=ON \
    -D CMAKE_BUILD_WITH_INSTALL_RPATH=ON
  cmake --build build --parallel $(nproc)

  cd ${_pkgname}-${pkgver}/libmambapy
  export SKBUILD_CONFIGURE_OPTIONS="\
      -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
      -DBUILD_LIBMAMBA=ON \
      -DBUILD_LIBMAMBAPY=ON \
      -DBUILD_MICROMAMBA=OFF \
      -DBUILD_MAMBA_PACKAGE=OFF \
      -Dlibmamba_ROOT=$PWD/../install"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  ctest --test-dir build
}

package() {
    # Install main components (C++ library, executables, headers)
    DESTDIR="${pkgdir}" cmake --build build --target install
    install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt

    cd ${_pkgname}-${pkgver}/libmambapy
    python -m installer --destdir="$pkgdir" dist/*.whl
}
