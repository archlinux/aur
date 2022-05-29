# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>
pkgname=('lib32-mangohud' 'lib32-mangoapp')
pkgbase=lib32-mangohud
_pkgver=0.6.7-1
pkgver=${_pkgver//-/.}
pkgrel=3
_imgui_ver=1.81
_spdlog_ver=1.8.5
arch=('x86_64')
url="https://github.com/flightlessmango/MangoHud"
license=('MIT')
makedepends=('git' 'glfw-x11' 'glslang' 'lib32-dbus' 'lib32-libglvnd' 'libxnvctrl'
             'meson' 'nlohmann-json' 'python-mako' 'vulkan-headers')
source=("git+https://github.com/flightlessmango/MangoHud.git#tag=v$_pkgver"
        'git+https://github.com/flightlessmango/minhook.git'
        "https://github.com/ocornut/imgui/archive/v${_imgui_ver}/imgui-${_imgui_ver}.tar.gz"
        "https://wrapdb.mesonbuild.com/v2/imgui_${_imgui_ver}-1/get_patch#/imgui-${_imgui_ver}-1-wrap.zip"
        "spdlog-${_spdlog_ver}.tar.gz::https://github.com/gabime/spdlog/archive/v${_spdlog_ver}.tar.gz"
        "spdlog-${_spdlog_ver}-1-wrap.zip::https://wrapdb.mesonbuild.com/v1/projects/spdlog/${_spdlog_ver}/1/get_zip")
sha256sums=('SKIP'
            'SKIP'
            'f7c619e03a06c0f25e8f47262dbc32d61fd033d2c91796812bf0f8c94fca78fb'
            '6d00b442690b6a5c5d8f898311daafbce16d370cf64f53294c3b8c5c661e435f'
            '944d0bd7c763ac721398dca2bb0f3b5ed16f67cef36810ede5061f35a543b4b8'
            '3c38f275d5792b1286391102594329e98b17737924b344f98312ab09929b74be')

prepare() {
  cd "$srcdir/MangoHud"
  git submodule init modules/minhook
  git config submodule.minhook.url "$srcdir/minhook"
  git submodule update

  mkdir -p "$srcdir/common"

  ln -sfv \
    "$srcdir/imgui-${_imgui_ver}" \
    "$srcdir/spdlog-${_spdlog_ver}" \
    subprojects

  # Use system nlohmann-json package instead of subproject
  sed -i "s/  json_sp = subproject('nlohmann_json')//g" meson.build
  sed -i "s/json_dep = json_sp.get_variable('nlohmann_json_dep')/json_dep = dependency('nlohmann_json')/g" meson.build
}

build() {
local meson_options=(
    -Duse_system_vulkan=enabled
    -Dappend_libdir_mangohud=false
    -Dmangoapp_layer=true
    -Dinclude_doc=false
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LLVM_CONFIG="/usr/bin/llvm-config32"

  arch-meson MangoHud build "${meson_options[@]}" --libdir lib32
  meson compile -C build
}

package_lib32-mangohud() {
  pkgdesc="MangoHud 32-bit library"
  depends=('lib32-dbus' 'lib32-gcc-libs' 'lib32-libx11' 'lib32-vulkan-icd-loader' 'mangohud-common')
#  optdepends=('lib32-libxnvctrl: NVIDIA GPU stats by XNVCtrl') # AUR
  replaces=("$pkgname-x11" "$pkgname-wayland")

  meson install -C build --destdir "$pkgdir"

  mv -f "$pkgdir/usr/lib32/libMangoApp.so" "$srcdir/"
  rm -rf "$pkgdir"/usr/{bin,share}
}

package_lib32-mangoapp() {
  pkgdesc="MangoApp 32-bit library"
  depends=('lib32-mangohud')

  install -Dm644 libMangoApp.so -t "$pkgdir/usr/lib32/"
}
