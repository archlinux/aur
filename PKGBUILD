# Maintainer: Edmund Lodewijks <echo "==gCt92YuwWah1WYlR3byBHQ4VnbpxGajJXY" | rev | base64 -d>

pkgname=oniux
pkgver=0.4.0
pkgrel=2
pkgdesc='Kernel-level Tor isolation for any Linux app'
url='https://gitlab.torproject.org/tpo/core/oniux/'
license=('MIT' 'Apache-2.0')
options=('!lto')
depends=(
  'glibc'
  'gcc-libs'
)
makedepends=(
  'git'
  'cargo'
)
arch=('x86_64') # I don't know if it builds on other archs, happy to add if so.
source=("${url}-/archive/v${pkgver}/oniux-v${pkgver}.tar.gz")
b2sums=('03dc2d1c466816fb2e261d47abed7554ee2b4d3bd1c4eb420bb8aa021081a97375d590d06ecb77b845b75b77e727eb66bc313010deb0422d01d711c7b80c3c0d')

prepare() {
    cd ${pkgname}-v${pkgver}

    # Remove a .toml file that belongs to the developer and will be removed in the next release.
    # Cf.: https://gitlab.torproject.org/tpo/core/oniux/-/commit/441ddce15173add6b8bd49cf315091fd4480d717
    rm -rf .cargo

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${pkgname}-v${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd ${pkgname}-v${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd ${pkgname}-v${pkgver}
    
    # Binary
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/"${_target}"/release/${pkgname}"

    # Documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Licenses
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
