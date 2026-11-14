# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=lib32-reshade-linux-git
_pkgname=reshade-linux
pkgver=6.8.0.1_r3_gb14e07d0
pkgrel=1
pkgdesc="crosire's ReShade post-processing injector as a native Vulkan layer (32-bit) (git version)"
arch=('x86_64')
url='https://github.com/TheElevatedOne/reshade-linux'
license=('BSD-3-Clause')
# reshade-linux has the reshade launcher and the desktop entry the global shortcuts portal needs.
depends=('reshade-linux' 'lib32-glibc' 'lib32-libxcb' 'lib32-libxkbcommon' 'lib32-wayland' 'lib32-dbus' 'lib32-vulkan-icd-loader')
makedepends=('git' 'cmake' 'ninja' 'gcc' 'pkgconf' 'python' 'python-jinja'
             'lib32-gcc-libs' 'lib32-libx11')
provides=("lib32-$_pkgname")
conflicts=("lib32-$_pkgname")
source=("$_pkgname::git+$url.git"
        'imgui::git+https://github.com/ocornut/imgui.git'
        'stb::git+https://github.com/nothings/stb.git'
        'glad::git+https://github.com/Dav1dde/glad.git'
        'utfcpp::git+https://github.com/nemtrif/utfcpp.git'
        'spirv::git+https://github.com/KhronosGroup/SPIRV-Headers.git'
        'vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
        'fpng::git+https://github.com/richgel999/fpng.git'
        'jxl_simple_lossless::git+https://github.com/kampidh/simple-lossless-encoder.git')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tags --abbrev=8 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/_/g' ||
      printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=8 HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  local submodule
  for submodule in imgui stb glad utfcpp spirv vma fpng jxl_simple_lossless; do
    git submodule init "deps/$submodule"
    git config "submodule.$submodule.url" "$srcdir/$submodule"
  done
  git -c protocol.file.allow=always submodule update
}

build() {
  # -m32 build against the multilib libraries in /usr/lib32 (the toolchain file sets the flags and PKG_CONFIG_LIBDIR)
  cmake -S "$_pkgname" -B build -G Ninja \
    -DCMAKE_TOOLCHAIN_FILE="$srcdir/$_pkgname/linux/toolchain-i686.cmake" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DRESHADE_INSTALL_SHARED_FILES=OFF
  cmake --build build
}

package() {
  # Installs only /usr/lib32/reshade/libreshade.so and the layer manifest reshade.x86.json;
  # the launcher, desktop entry and icon come from reshade-linux.
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgname/LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname"
}
