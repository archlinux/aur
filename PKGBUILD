# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=slipstream
pkgname=slipstream-git
pkgver=r66.bc772dd
pkgrel=1
pkgdesc="High-performance multi-path covert channel over DNS in Rust with vibe coding"
url="https://github.com/Mygod/slipstream-rust"
license=("Apache-2.0")
makedepends=("git" "cargo" "cmake")
depends=()
arch=("x86_64")
source=("${_pkgname}-rust::git+${url}.git")
sha256sums=('SKIP')
provides=("slipstream")
conflicts=("slipstream")
options=(!lto)

pkgver() {
    cd "${srcdir}/${_pkgname}-rust"

    # Get the version number.
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}-rust"
    git submodule update --init --recursive
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # # Remove LTO flags that break linking with picoquic C libraries
    # export CFLAGS="${CFLAGS/-flto=auto/}"
    # export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
    cargo build --frozen --release -p slipstream-client -p slipstream-server
}

check() {
    cd "${srcdir}/${_pkgname}-rust"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release -p slipstream-client -p slipstream-server
}

package() {
    cd "${srcdir}/${_pkgname}-rust"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}-client"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}-server"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
