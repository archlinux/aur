# Maintainer: LAA
pkgname=bupdate-git
pkgver=0.4.1.r0.gbedf364
pkgrel=1
pkgdesc="Universal package updater — parallel updates for Linux, BSD and Windows (built from git)"
arch=('x86_64' 'aarch64')
url="https://radicle.network/nodes/iris.radicle.network/rad%3Az1SpYG13iEYC9Ds1UjyVJhe1sf1i"
license=('Unlicense')
provides=('bupdate')
conflicts=('bupdate' 'bupdate-bin')
makedepends=('cargo' 'git')
depends=('gcc-libs')
options=(!debug)
optdepends=(
    'sudo: privilege elevation for system package managers'
    'systemd: sleep inhibition during updates'
)
source=("${pkgname}::git+https://iris.radicle.network/rad:z1SpYG13iEYC9Ds1UjyVJhe1sf1i.git")
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
