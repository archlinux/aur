# Maintainer: yobson <aur@yobson.xyz>
pkgname=ccusage-git
pkgver=20.0.20.r101.g813d801
pkgrel=1
pkgdesc='Analyze coding (agent) CLI token usage and costs from local data.'
arch=(x86_64 aarch64)
url='https://github.com/ryoppippi/ccusage'
license=(MIT)
depends=(gcc-libs)
makedepends=(git cargo)
options=(!lto)
source=("${pkgname}::git+${url}.git")
cksums=(SKIP)

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}/rust"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target host-tuple
}

build() {
    cd "${srcdir}/${pkgname}/rust"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --frozen --all-features
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 rust/target/release/ccusage "${pkgdir}/usr/bin/ccusage"
    install -Dm644 apps/ccusage/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
