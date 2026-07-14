# Maintainer: houmain <houmain at posteo dot net>

pkgname=gpupad-git
_pkgname=gpupad
pkgver=latest
pkgrel=1
pkgdesc='A flexible GLSL/HLSL shader editor and IDE.'
arch=(x86_64 aarch64)
url="https://github.com/houmain/gpupad"
license=(GPL3)
depends=(qt6-declarative qt6-wayland qt6-multimedia libdrm openimageio vulkan-headers glslang spdlog spirv-cross spirv-tools)
makedepends=(cmake git)
conflicts=(${_pkgname})
provides=(${_pkgname})
source=(git+https://github.com/houmain/gpupad.git
        git+https://github.com/houmain/KDGpu.git)
md5sums=(SKIP
         SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git config submodule.KDGpu.url $srcdir/libs/KDGpu
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"

  cmake -B _build -DVERSION="$pkgver" -DGPUPAD_UNITY_BUILD=ON -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build _build -j 4
}

package() {
  cd "${srcdir}/${_pkgname}/_build"
  make DESTDIR="$pkgdir" install
}
