# Maintainer: Armando Zambrano <zambrano@armando.one>
pkgname=aquafin-git
_pkgname=aquafin
pkgver=r3.e3c7daa
pkgrel=2
pkgdesc="Jellyfin TUI client for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/Armando-ven/aquafin"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'opus' 'dbus' 'chafa')
makedepends=('git' 'cargo' 'pkgconf' 'cmake' 'nasm')
optdepends=('mpv: video playback'
            'pipewire: audio output (alternative to alsa)'
            'kitty: inline image support'
            'ghostty: inline image support'
            'foot: inline image support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!lto')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
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
    cargo test --frozen --release
}

package() {
    cd "${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 config.example.toml "${pkgdir}/usr/share/doc/${pkgname}/config.example.toml"
}
