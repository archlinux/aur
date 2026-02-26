# Maintainer: farnoy
# Based on Arch Linux mangohud PKGBUILD & nixpkgs

_pkgname=MangoHud
pkgname=mangohud-mangochill
pkgver=0.8.2
pkgrel=1
pkgdesc='MangoHud fork with MangoChill control socket support'
arch=('x86_64')
url='https://github.com/farnoy/MangoHud'
license=('MIT')
makedepends=('appstream' 'cmocka' 'git' 'glslang' 'libxnvctrl' 'libxrandr' 'meson' 'python-mako' 'vulkan-headers' 'unzip')
depends=('dbus' 'fmt' 'glfw' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'libxkbcommon' 'python' 'python-matplotlib' 'python-numpy' 'spdlog' 'vulkan-icd-loader' 'wayland')
optdepends=('gamescope: use MangoApp as an overlay within gamescope'
            'libxnvctrl: NVIDIA GPU stats by XNVCtrl')
provides=('mangohud')
conflicts=('mangohud' 'mangohud-git')
source=(
  "$_pkgname::git+https://github.com/farnoy/MangoHud.git#commit=ae5a7dcf49227af0548cfd4d11ae3754c2fb9cb8"
  'imgui-1.91.6.tar.gz::https://github.com/ocornut/imgui/archive/refs/tags/v1.91.6.tar.gz'
  'implot-0.16.tar.gz::https://github.com/epezent/implot/archive/refs/tags/v0.16.tar.gz'
  'Vulkan-Headers-1.3.283.tar.gz::https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/v1.3.283.tar.gz'
  'imgui-wrap.zip::https://wrapdb.mesonbuild.com/v2/imgui_1.91.6-3/get_patch'
  'implot-wrap.zip::https://wrapdb.mesonbuild.com/v2/implot_0.16-1/get_patch'
  'vulkan-headers-wrap.zip::https://wrapdb.mesonbuild.com/v2/vulkan-headers_1.3.283-1/get_patch'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$_pkgname"

  cp -a "$srcdir/imgui-1.91.6" subprojects/
  cp -a "$srcdir/implot-0.16" subprojects/
  cp -a "$srcdir/Vulkan-Headers-1.3.283" subprojects/

  (
    cd subprojects
    unzip -o "$srcdir/imgui-wrap.zip"
    unzip -o "$srcdir/implot-wrap.zip"
    unzip -o "$srcdir/vulkan-headers-wrap.zip"
  )
}

build() {
  arch-meson "$_pkgname" build \
    -Dmangoapp=true \
    -Dmangohudctl=true \
    -Duse_system_spdlog=enabled

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
