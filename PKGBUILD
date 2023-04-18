# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>
pkgname=('lib32-mangohud' 'lib32-mangoapp')
pkgbase=lib32-mangohud
pkgver=0.6.9.1
pkgrel=1
_imgui_ver=1.81
_spdlog_ver=1.8.5
_vulkan_ver=1.2.158
arch=('x86_64')
url="https://github.com/flightlessmango/MangoHud"
license=('MIT')
makedepends=('git' 'glfw-x11' 'glslang' 'lib32-cmocka' 'lib32-dbus' 'lib32-libglvnd'
             'libxnvctrl' 'meson' 'nlohmann-json' 'python-mako')
_commit=7f945627f57ecc56afea342c2dc0544d0d43728e  # tags/v0.6.9-1^0
source=("git+https://github.com/flightlessmango/MangoHud.git#commit=${_commit}"
        'git+https://github.com/flightlessmango/minhook.git'
        "https://github.com/ocornut/imgui/archive/refs/tags/v${_imgui_ver}/imgui-${_imgui_ver}.tar.gz"
        "https://wrapdb.mesonbuild.com/v2/imgui_${_imgui_ver}-1/get_patch#/imgui-${_imgui_ver}-1-wrap.zip"
        "spdlog-${_spdlog_ver}.tar.gz::https://github.com/gabime/spdlog/archive/refs/tags/v${_spdlog_ver}.tar.gz"
        "spdlog-${_spdlog_ver}-1-wrap.zip::https://wrapdb.mesonbuild.com/v1/projects/spdlog/${_spdlog_ver}/1/get_zip"
        "Vulkan-Headers-${_vulkan_ver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Headers/archive/v${_vulkan_ver}.tar.gz"
        "https://wrapdb.mesonbuild.com/v2/vulkan-headers_${_vulkan_ver}-2/get_patch#/vulkan-headers-${_vulkan_ver}-2-wrap.zip")
sha256sums=('SKIP'
            'SKIP'
            'f7c619e03a06c0f25e8f47262dbc32d61fd033d2c91796812bf0f8c94fca78fb'
            '6d00b442690b6a5c5d8f898311daafbce16d370cf64f53294c3b8c5c661e435f'
            '944d0bd7c763ac721398dca2bb0f3b5ed16f67cef36810ede5061f35a543b4b8'
            '3c38f275d5792b1286391102594329e98b17737924b344f98312ab09929b74be'
            '53361271cfe274df8782e1e47bdc9e61b7af432ba30acbfe31723f9df2c257f3'
            '860358cf5e73f458cd1e88f8c38116d123ab421d5ce2e4129ec38eaedd820e17')

pkgver() {
  cd "$srcdir/MangoHud"
#  git describe --tags | sed 's/^v//;s/-/+/g'
  git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "$srcdir/MangoHud"
  git submodule init modules/minhook
  git config submodule.subprojects/minhook.url "$srcdir/minhook"
  git -c protocol.file.allow=always submodule update

  ln -sfv \
    "$srcdir/imgui-${_imgui_ver}" \
    "$srcdir/spdlog-${_spdlog_ver}" \
    "$srcdir/Vulkan-Headers-${_vulkan_ver}" \
      subprojects/

  # Use system lib32-cmocka instead of subproject
  sed -i "s/  cmocka = subproject('cmocka')//g" meson.build
  sed -i "s/cmocka_dep = cmocka.get_variable('cmocka_dep')/cmocka_dep = dependency('cmocka')/g" meson.build
}

build() {
local meson_options=(
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
  provides=('libMangoHud.so' 'libMangoHud_dlsym.so')
  replaces=("$pkgname-x11" "$pkgname-wayland")

  meson install --tags runtime -C build --destdir "$pkgdir"
}

package_lib32-mangoapp() {
  pkgdesc="MangoApp 32-bit library"
  depends=('lib32-mangohud')

  meson install --tags mangoapp -C build --destdir "$pkgdir"
}
