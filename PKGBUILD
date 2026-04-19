# Maintainer: nagamine-git <nagamine-git@users.noreply.github.com>
pkgname=way-thumbsense-git
_pkgname=way-thumbsense
pkgver=r8.gdd77470
pkgrel=1
pkgdesc="ThumbSense for Linux/Wayland — hold a virtual key while touching the trackpad (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/nagamine-git/way-thumbsense"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=(
    "${_pkgname}::git+https://github.com/nagamine-git/way-thumbsense.git"
    "99-uinput.rules"
)
sha256sums=(
    'SKIP'
    '85abd3fb5c0351281a3e4a6001f138c251d791c92c0c45baf984fefa1bdb58c7'
)

pkgver() {
    cd "${_pkgname}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --all-features
}

package() {
    install -Dm644 "99-uinput.rules" "${pkgdir}/usr/lib/udev/rules.d/99-uinput.rules"

    cd "${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 ARCHITECTURE.md "${pkgdir}/usr/share/doc/${_pkgname}/ARCHITECTURE.md"
}
