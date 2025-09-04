# Maintainer: taotieren <admin@taotieren.com>

pkgname=mujoco
pkgver=3.3.5
pkgrel=1
pkgdesc="Multi-Joint dynamics with Contact. A general purpose physics simulator."
arch=($CARCH)
url="https://www.mujoco.org"
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
  'glfw'
  'tinyxml2'
  'qhull'
)
makedepends=(
  'abseil-cpp'
  'benchmark'
  'cmake'
  'git'
  'eigen'
  'ninja'
  # AUR
  'tinyobjloader'
)
source=("${pkgname}::git+https://github.com/deepmind/mujoco.git#tag=$pkgver"
  "0001-fix-cmake.patch"
)
sha256sums=('7e9392c142307cd8566c5de42259bfceffa56c9841c8e66b8f2cbafc72912bd4'
            '0547d19efb39cf251176d582375a791f839605fed313337e7d21280ae6973c6f')

prepare() {
  cd "${pkgname}"

  # Use as many system libs as possible.
  # Had to build and statically link some dependencies because the build was
  # failing. Feel free to investigate and fix the build to use shared libraries.
  # Patch to use system qhull comes from
  # https://github.com/conda-forge/staged-recipes/pull/19049
  patch -Np1 <"${srcdir}/0001-fix-cmake.patch"
}

build() {
  cd "${pkgname}"

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -B build \
    -G Ninja \
    -Wno-dev

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
  install -Dm0644 "${srcdir}"/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
