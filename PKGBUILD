# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>

pkgname=wayback-rs-git
_pkgname=${pkgname%-git}
pkgver=r8.7b106e7
pkgrel=1
pkgdesc="Fetch all the URLs that the Wayback Machine knows about for a domain. (Rust version)"
arch=('any')
url="https://github.com/pfahard/wayback-rs"
license=("MIT")
makedepends=("cargo")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}.git")
sha256sums=("SKIP")

prepare() {
    cd "${pkgname}"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
    cd "${pkgname}"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # speed up compilation with sccache if available
    export RUSTC_WRAPPER=$(which sccache) &> /dev/null
    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname}"
    install -Dm0755 "target/release/wayback" "${pkgdir}/usr/bin/${_pkgname}"
}
