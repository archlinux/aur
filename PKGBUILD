# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('mangohud' 'mangoapp' 'mangohud-common')
pkgbase=mangohud
_pkgver=0.6.7-1
pkgver=${_pkgver//-/.}
pkgrel=4
_imgui_ver=1.81
pkgdesc="A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more."
arch=('x86_64')
url="https://github.com/flightlessmango/MangoHud"
license=('MIT')
makedepends=('dbus' 'git' 'glew' 'glfw-x11' 'glslang' 'libglvnd' 'libxnvctrl' 'meson'
             'nlohmann-json' 'python-mako' 'spdlog' 'vulkan-headers')
source=("git+https://github.com/flightlessmango/MangoHud.git#tag=v$_pkgver"
        'git+https://github.com/flightlessmango/minhook.git'
        "https://github.com/ocornut/imgui/archive/v${_imgui_ver}/imgui-${_imgui_ver}.tar.gz"
        "https://wrapdb.mesonbuild.com/v2/imgui_${_imgui_ver}-1/get_patch#/imgui-${_imgui_ver}-1-wrap.zip")
sha256sums=('SKIP'
            'SKIP'
            'f7c619e03a06c0f25e8f47262dbc32d61fd033d2c91796812bf0f8c94fca78fb'
            '6d00b442690b6a5c5d8f898311daafbce16d370cf64f53294c3b8c5c661e435f')

prepare() {
  cd "$srcdir/MangoHud"
  git submodule init modules/minhook
  git config submodule.minhook.url "$srcdir/minhook"
  git submodule update

  mkdir -p "$srcdir/common"

  ln -sfv "$srcdir/imgui-${_imgui_ver}" subprojects

  # Use system nlohmann-json package instead of subproject
  sed -i "s/  json_sp = subproject('nlohmann_json')//g" meson.build
  sed -i "s/json_dep = json_sp.get_variable('nlohmann_json_dep')/json_dep = dependency('nlohmann_json')/g" meson.build
}

build() {
local meson_options=(
  -Duse_system_spdlog=enabled
  -Duse_system_vulkan=enabled
  -Dappend_libdir_mangohud=false
  -Dmangoapp=true
  -Dmangohudctl=true
  -Dmangoapp_layer=true
)

  arch-meson MangoHud build "${meson_options[@]}"
  meson compile -C build
}

package_mangohud() {
  depends=('mangohud-common' 'dbus' 'gcc-libs' 'libx11' 'spdlog' 'vulkan-icd-loader')
  optdepends=('libxnvctrl: NVIDIA GPU stats by XNVCtrl'
              'mangoapp')
  replaces=("$pkgname-x11" "$pkgname-wayland")

  meson install -C build --destdir "$pkgdir"

  mv -f \
    "$pkgdir/usr/bin/mangoapp" \
    "$pkgdir/usr/lib/libMangoApp.so" \
    "$pkgdir/usr/share/vulkan/implicit_layer.d/libMangoApp.json" \
    "$srcdir/"
  mv -f "$pkgdir"/usr/share/{doc,man} "$srcdir/common/"
}

package_mangoapp() {
  pkgdesc="A transparent background OpenGL application with a built-in MangoHud designed to be run inside a gamescope instance"
  depends=('glew' 'glfw-x11' 'mangohud')
  optdepends=('gamescope')

  install -Dm755 mangoapp -t "$pkgdir/usr/bin/"
  install -Dm644 libMangoApp.so -t "$pkgdir/usr/lib/"
  install -Dm644 libMangoApp.json -t "$pkgdir/usr/share/vulkan/implicit_layer.d/"
}

package_mangohud-common() {
  pkgdesc="Common files for MangoHud"
  replaces=("$pkgname-x11" "$pkgname-wayland")

  install -d "$pkgdir/usr/share"
  cp -r common/* "$pkgdir/usr/share/"

  cd "$srcdir/MangoHud"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgbase/"
}
