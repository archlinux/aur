# Maintainer: Carlos Prieto <prietus@live.com>
pkgname=ipeek-git
_pkgname=ipeek
_reponame=peek
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Terminal image viewer (Kitty/Sixel/iTerm2/half-blocks) — git version"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/peek"
license=('MIT')
depends=('gcc-libs')
optdepends=('ffmpeg: video previews')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
options=('!lto')
source=("${_reponame}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_reponame}"
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "0.1.0.r%s.g%s" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${_reponame}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_reponame}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${_reponame}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --all-features
}

package() {
    cd "${_reponame}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
