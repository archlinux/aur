# Maintainer: LAA
pkgname=bupdate-git
pkgver=0.2.1.r0.g3a9375a
pkgrel=1
pkgdesc="Universal package updater — parallel updates for Linux, BSD and Windows (built from git)"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/iris.radicle.xyz/rad:z1SpYG13iEYC9Ds1UjyVJhe1sf1i"
license=('custom:ANTL-2.0')
provides=('bupdate')
conflicts=('bupdate' 'bupdate-bin')
makedepends=('cargo' 'git')
depends=('gcc-libs')
options=(!debug)
optdepends=(
    'sudo: privilege elevation for system package managers'
    'systemd: sleep inhibition during updates'
)
source=("${pkgname}::git+https://iris.radicle.xyz/rad:z1SpYG13iEYC9Ds1UjyVJhe1sf1i.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    local tag
    tag=$(git describe --long --tags --abbrev=7 2>/dev/null) || true
    if [[ -n "$tag" ]]; then
        echo "$tag" | sed 's/^v//;s/-/.r/;s/-/./'
    else
        printf "%s.r%s.g%s" \
            "$(grep '^version' Cargo.toml | head -1 | cut -d'"' -f2)" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --locked
}

package() {
    cd "${pkgname}"
    install -Dm755 "target/release/bupdate" "${pkgdir}/usr/bin/bupdate"
}
