# Maintainer: Edmund Lodewijks <echo "==gCt92YuwWah1WYlR3byBHQ4VnbpxGajJXY" | rev | base64 -d>

pkgname=oniux
pkgver=0.7.0
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
source=("${url}-/archive/v${pkgver}/oniux-v${pkgver}.tar.gz"
	"Cargo.lock")
b2sums=('4078a8b811d6b8c3fd0f8866c863dd129d211e5bae46413c098b851f944cea4022691ab87ded6ef9ae7ff2ddc421f849ff19d3fc2b4b7f222597a01907590325'
        '3e6dc054b9da68c22d06adb9abb9b6ffcf15a72612d15e04b33e9e13a638d1b13b49a616e815a444c940360acb0a6b54573a457d943e77a5dbfdde3a2a849afd')

prepare() {
    cd ${pkgname}-v${pkgver}

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${pkgname}-v${pkgver}

    # Use debug
    export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

    # Use lto
    export CARGO_PROFILE_RELEASE_LTO=thin

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

