# Maintainer: VHSgunzo <VHSgunzo.github.io>

pkgname=mangohud-lw-git
pkgbasename="${pkgname%-lw-git}"
pkgver=0.6.8.r159.g140c0d8
pkgrel=1
pkgdesc="A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more for Lutris Wine"
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('git' 'glslang' 'lib32-libx11' 'libxnvctrl' 'meson' 'nlohmann-json' 'python-mako' 'vulkan-headers')
depends=('dbus' 'hicolor-icon-theme' 'vulkan-icd-loader' 'lib32-dbus' 'lib32-vulkan-icd-loader')
optdepends=(
    'libxnvctrl: NVIDIA GPU stats'
    'lib32-libxnvctrl: NVIDIA GPU stats (x32)'
)
provides=('lib32-mangohud' 'mangohud' 'mangohud-common')
conflicts=('lib32-mangohud' 'lib32-mangohud-git' 'mangohud' 'mangohud-git' 'mangohud-common' 'mangohud-common-git')
source=("${pkgbasename}::git+${url}.git" 'mangohud' 'mangohud.conf' 'MangoHud.json')
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$pkgbasename"
    git describe --tags|sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgbasename"
  git submodule update --init --recursive
}

build() {
    cd "$srcdir/$pkgbasename"
    LANG=en_US.UTF-8 yes|./build.sh clean
    LANG=en_US.UTF-8 yes|./build.sh build
}

package() {
    (cd "$srcdir/$pkgbasename"
    mkdir -p build/release/usr/lib32/mangohud
    mv build/release/usr/lib/mangohud/lib64/* build/release/usr/lib/mangohud/
    mv build/release/usr/lib/mangohud/lib32/* build/release/usr/lib32/mangohud/
    rm -rf build/release/usr/lib/mangohud/{lib64,lib32}
    rm -rf build/release/usr/share/vulkan/implicit_layer.d/*
    cp -ar --no-preserve=ownership "build/release/usr" "$pkgdir/usr")
    install -Dm755 mangohud "$pkgdir/usr/bin/mangohud"
    install -Dm644 mangohud.conf "$pkgdir/etc/ld.so.conf.d/mangohud.conf"
    install -Dm644 MangoHud.json "$pkgdir/usr/share/vulkan/implicit_layer.d/MangoHud.json"
}
