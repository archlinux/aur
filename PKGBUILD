# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
_pkgname=MangoHud
pkgname=mangohud-nonvidia
_pkgver=0.7.0
_tarpkgver="${_pkgver%-*}"
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (without NVIDIA support)."
arch=('x86_64' 'aarch64')
url="https://github.com/flightlessmango/MangoHud"
license=('MIT')
makedepends=('appstream' 'cmocka' 'git' 'glfw-x11' 'glslang' 'meson' 'nlohmann-json' 'python-mako')
depends=('dbus' 'fmt' 'gcc-libs' 'glew' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'python' 'python-matplotlib' 'python-numpy' 'spdlog' 'vulkan-icd-loader')
optdepends=('glfw-x11: Required for MangoApp'
            'gamescope: Use MangoApp as an overlay within gamescope')
replaces=("$pkgname-common" "$pkgname-common-wayland" "$pkgname-common-x11" "mangoapp-nonvidia" "$pkgname-x11" "$pkgname-wayland")
conflicts=("$pkgname-common" "$pkgname-common-wayland" "$pkgname-common-x11" "mangoapp-nonvidia" "$pkgname-x11" "$pkgname-wayland"
	"$_pkgname-common" "$_pkgname-common-wayland" "$_pkgname-common-x11" "mangoapp" "$_pkgname-x11" "$_pkgname-wayland")
source=("$pkgname-$pkgver.tar.xz::https://github.com/flightlessmango/MangoHud/releases/download/v$_pkgver/$_pkgname-v$_pkgver-Source.tar.xz")
b2sums=('469784266ec4b8805bc5e01aa0db8c7d9b1ef1779c087b3e4817e54ae65a8440418be4ef0730859cfa04807f712734cdc2a15fbe7085c7a22f76218429b5cd70')

prepare() {
    cd "$_pkgname-v$_tarpkgver"

    # Use system cmocka instead of subproject
    sed -i "s/  cmocka = subproject('cmocka')//g" meson.build
    sed -i "s/cmocka_dep = cmocka.get_variable('cmocka_dep')/cmocka_dep = dependency('cmocka')/g" meson.build
}

build() {
    arch-meson "$_pkgname-v$_tarpkgver" build \
        -Duse_system_spdlog=enabled \
        -Dmangoapp=true \
        -Dmangohudctl=true \
        -Dmangoapp_layer=true \
	-Dwith_nvml=disabled \
	-Dwith_xnvctrl=disabled \
	-Dwith_wayland=enabled

    meson compile -C build
}

package() {
    depends+=(
        vulkan-icd-loader libvulkan.so
        spdlog libspdlog.so
    )
    meson install -C build --destdir "$pkgdir"

    install -Dm 0644 "$srcdir/$_pkgname-v$_tarpkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

check() {
    meson test -C build --print-errorlogs || :
}

