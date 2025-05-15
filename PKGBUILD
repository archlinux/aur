# Maintainer: Edmund Lodewijks <archlinux [dot] proteamail [dot] com>

pkgname=oniux
pkgver=0.4.0
pkgrel=1
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
# Custom variable for the target architecture that Cargo will build for.
_target=("$(rustc -vV | sed -n 's/host: //p')")

prepare() {
    cd ${pkgname}-v${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${pkgname}-v${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --target "$(rustc -vV | sed -n 's/host: //p')" --release --all-features
}

check() {
    cd ${pkgname}-v${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --target "$(rustc -vV | sed -n 's/host: //p')" --frozen --all-features
}

package() {
    cd ${pkgname}-v${pkgver}
    
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/"$(rustc -vV | sed -n 's/host: //p')"/release/${pkgname}"

    # Documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Licenses
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
