# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=reshade-linux-git
_pkgname=reshade-linux
pkgver=6.8.0.1_r5_gea4b56e
pkgrel=1
pkgdesc="crosire's ReShade post-processing injector as a native Vulkan layer, enabled with RESHADE=1 (works with Proton via DXVK/VKD3D) (git version)"
arch=('x86_64')
url='https://github.com/TheElevatedOne/reshade-linux'
license=('BSD-3-Clause')
depends=('glibc' 'libxcb' 'libxkbcommon' 'wayland' 'dbus' 'vulkan-icd-loader' 'bash' 'git')
makedepends=('cmake' 'ninja' 'gcc' 'pkgconf' 'python' 'python-jinja' 'libx11')
optdepends=(
  'lib32-reshade-linux: 32-bit games (lib32-reshade-linux-git or lib32-reshade-linux-bin)'
  'curl: download the depth buffer compatibility list with reshade --download-shaders'
  'xdg-desktop-portal: global shortcuts (e.g. xdg-desktop-portal-kde or xdg-desktop-portal-hyprland)'
  'pipewire-audio: screenshot sound (pw-play)'
  'xdg-utils: open folders and links from the overlay'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
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
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/_/g' ||
      printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
  cmake -S "$_pkgname" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd "$_pkgname"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
