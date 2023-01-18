# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

_pkgname=mangohud
pkgname=mangohud-git
pkgver=0.6.8.r54.g99c72d3
pkgrel=1
pkgdesc="A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more."
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('gcc' 'git' 'glslang' 'libx11' 'libxnvctrl' 'meson' 'pkgconf' 'python-mako' 'vulkan-headers')
depends=('dbus' 'hicolor-icon-theme' 'vulkan-icd-loader')
optdepends=(
    'libxnvctrl: NVIDIA GPU stats'
    'lib32-mangohud-git: 32-bit support'
)
provides=('mangohud' 'mangohud-common')
conflicts=('mangohud' 'mangohud-common' 'mangohud-common-git')
replaces=('mangohud-common-git')
source=("${_pkgname%"-git"}::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "${_pkgname%"-git"}"
    git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    local meson_options=(
        --wrap-mode=forcefallback
        -Duse_system_vulkan=enabled
        -Dappend_libdir_mangohud=false
        -Dtests=disabled
        "${_pkgname%"-git"}"
    )
    arch-meson "${meson_options[@]}" build

    ninja -C build
}

package() {
    meson install --destdir="$pkgdir" -C build
    install -Dm664 "${_pkgname%"-git"}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
