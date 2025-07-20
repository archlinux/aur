# Maintainer: houmain <houmain at posteo dot net>

pkgname=gpupad-git
_pkgname=gpupad
pkgver=latest
pkgrel=7
pkgdesc='A flexible GLSL shader editor and IDE.'
arch=(x86_64)
url="https://github.com/houmain/gpupad"
license=(GPL3)
depends=(qt6-declarative qt6-multimedia libdrm openimageio vulkan-headers glslang spdlog)
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

  if [ ! -d vcpkg ]; then
    git clone --depth=1 https://github.com/microsoft/vcpkg.git
    vcpkg/bootstrap-vcpkg.sh
  fi
  vcpkg/vcpkg --triplet="x64-linux-release" install "ktx[vulkan]" spirv-cross vulkan-memory-allocator

  cmake -B _build -DVERSION="$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_TOOLCHAIN_FILE=vcpkg/scripts/buildsystems/vcpkg.cmake -DVCPKG_TARGET_TRIPLET="x64-linux-release"
  cmake --build _build -j 8
}

package() {
  cd "${srcdir}/${_pkgname}/_build"
  make DESTDIR="$pkgdir" install
}
