# Maintainer: Jas Singh <singh.jaskir@outlook.com>

pkgname=wayle-git
_pkgname=wayle
pkgver=0.1.0.r0.ga1a31cf
pkgrel=1
pkgdesc="A configurable desktop shell for Wayland compositors"
arch=('x86_64')
url="https://github.com/wayle-rs/wayle"
license=('MIT')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
depends=(
    'gtk4'
    'gtk4-layer-shell'
    'libpulse'
    'fftw'
    'libpipewire'
)
makedepends=(
    'clang'
    'git'
    'rust'
)
optdepends=(
    'upower: battery module'
    'networkmanager: network module'
    'bluez: bluetooth module'
    'power-profiles-daemon: power profiles module'
    'swww: wallpaper rendering'
    'matugen: Material You color extraction'
    'wallust: color extraction'
    'python-pywal: color extraction'
)
options=(!lto)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd "${_pkgname}"

    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    find resources/icons/hicolor -type f -name "*.svg" -exec install -Dm644 {} "${pkgdir}/usr/share/wayle/icons/{}" \;
}
