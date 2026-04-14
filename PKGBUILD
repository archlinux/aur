# Maintainer: nagamine-git <nagamine-git@users.noreply.github.com>
pkgname=way-thumbsense-git
_pkgname=way-thumbsense
pkgver=r6.g8f8215f
pkgrel=1
pkgdesc="ThumbSense for Linux/Wayland — hold a virtual key while touching the trackpad (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/nagamine-git/way-thumbsense"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}::git+https://github.com/nagamine-git/way-thumbsense.git")
sha256sums=('SKIP')

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
    cd "${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 ARCHITECTURE.md "${pkgdir}/usr/share/doc/${_pkgname}/ARCHITECTURE.md"
}
