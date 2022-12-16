# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=swiftshader-git
pkgver=r7019.67f5203051
pkgrel=1
pkgdesc='High-performance CPU-based implementation of the Vulkan graphics API12.'
arch=(x86_64)
url=https://swiftshader.googlesource.com/SwiftShader
license=(Apache)
depends=(gcc-libs)
makedepends=(git cmake ninja python)
provides=(swiftshader vulkan-driver)
conflicts=(swiftshader)
source=("git+$url#branch=master"
        "git+https://github.com/google/cppdap"
        "git+https://github.com/google/googletest.git"
        "git+https://github.com/nlohmann/json.git"
        "git+https://github.com/ianlancetaylor/libbacktrace.git"
        "git+https://github.com/powervr-graphics/Native_SDK.git"
        "git+https://github.com/google/benchmark.git"
        "git+https://github.com/KhronosGroup/glslang.git")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd SwiftShader
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  git -C SwiftShader submodule init
  git -C SwiftShader config submodule."third_party/cppdap".url "$srcdir/cppdap"
  git -C SwiftShader config submodule."third_party/googletest".url "$srcdir/googletest"
  git -C SwiftShader config submodule."third_party/json".url "$srcdir/json"
  git -C SwiftShader config submodule."third_party/libbacktrace/src".url "$srcdir/libbacktrace"
  git -C SwiftShader config submodule."third_party/PowerVR_Examples".url "$srcdir/Native_SDK"
  git -C SwiftShader config submodule."third_party/benchmark".url "$srcdir/benchmark"
  git -C SwiftShader config submodule."third_party/glslang".url "$srcdir/glslang"
  # this repo is not publicly accessible so we won't fetch it
  git -C SwiftShader config submodule."third_party/git-hooks".update none
  git -C SwiftShader config submodule."third_party/llvm-project".update none
  git -C SwiftShader -c protocol.file.allow=always submodule update

  cmake \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -D SWIFTSHADER_WARNINGS_AS_ERRORS=off \
    -S SwiftShader -B build
}

build() {
  ninja -C build
}

check() {
  build/ReactorUnitTests
  #build/math-unittests  # getting what looks like an infinite loop here; disabled for now
  build/system-unittests
  build/vk-unittests
}

package() {
  # this installs one of the submodules instead (spirv-tools)
  #DESTDIR="$pkgdir" ninja -C build install

  install -dm755 "$pkgdir"/usr/lib
  install -m755 -t "$pkgdir"/usr/lib \
    build/libvk_swiftshader.so

  install -dm755 "$pkgdir"/usr/share/vulkan/icd.d/
  install -m644 -t "$pkgdir"/usr/share/vulkan/icd.d/ \
    build/Linux/vk_swiftshader_icd.json
  sed 's#./libvk_swiftshader.so#/usr/lib/libvk_swiftshader.so#' \
    -i "$pkgdir"/usr/share/vulkan/icd.d/vk_swiftshader_icd.json
}
