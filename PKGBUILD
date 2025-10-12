# Maintainer: firstpick <you@example.com>
pkgname=usrgrp-manager-git
pkgver=0.2.0.r16.gb782371
pkgrel=2
pkgdesc="Keyboard-driven TUI to view and manage UNIX users and groups (git version)"
arch=('x86_64')
url="https://github.com/Firstp1ck/UsrGrp-Manager-TUI"
license=('MIT')
depends=('glibc' 'shadow')
makedepends=('git' 'cargo')
provides=("usrgrp-manager=${pkgver}")
conflicts=('usrgrp-manager' 'usrgrp-manager-bin')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    : "${srcdir:?srcdir is not set}"
    cd "${srcdir}/${pkgname}" || exit 1

    if git describe --tags --abbrev=0 >/dev/null 2>&1; then
        git describe --tags --long --always \
            | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    : "${srcdir:?srcdir is not set}"
    cd "${srcdir}/${pkgname}" || exit 1
    
    # Download/update cargo dependencies
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    : "${srcdir:?srcdir is not set}"
    cd "${srcdir}/${pkgname}" || exit 1
    
    # Build in release mode
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    : "${srcdir:?srcdir is not set}"
    cd "${srcdir}/${pkgname}" || exit 1
    
    # Run tests
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    : "${pkgdir:?pkgdir is not set}"
    : "${srcdir:?srcdir is not set}"
    cd "${srcdir}/${pkgname}" || exit 1
    
    # Install the binary
    install -Dm755 "target/release/usrgrp-manager" "${pkgdir}/usr/bin/usrgrp-manager"
    
    # Install license file if it exists
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
    
    # Install documentation if it exists
    if [[ -f README.md ]]; then
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi
}
