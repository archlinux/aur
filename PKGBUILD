# Maintainer: taotieren <admin@taotieren.com>

pkgname=sudo-rs
pkgver=0.2.4
pkgrel=3
pkgdesc="A safety oriented and memory safe implementation of sudo and su written in Rust."
arch=($CARCH)
url="https://github.com/trifectatechfoundation/sudo-rs"
license=('Apache-2.0 AND MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    gcc-libs
    glibc
    pam
)
makedepends=(
    cargo
)
backup=()
options=(!debug !strip)
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c2c1f4c8087134a90df47a8bee76746c4ab24dd7d12f3b26a74d1560ea3ee68c')

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${srcdir}/${pkgname}-${pkgver}/"
    #     cargo build --release --all-features
    cargo build --release
}

# check() {
#     export RUSTUP_TOOLCHAIN=stable
#     export CARGO_TARGET_DIR=target
#
#     cd "${srcdir}/${pkgname}-${pkgver}/"
#     cargo test --release --all-features
# }

package() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${srcdir}/${pkgname}-${pkgver}/"
    #     cargo install --no-track --all-features --root "${pkgdir}/usr/" --path .
    cargo install --no-track --root "${pkgdir}/usr/" --path .

    install -Dm0644 LICENSE-{APACHE,MIT} -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    # Rename it to end in `-rs` to eliminate conflicts with `sudo` `util-linux`.
    directory="${pkgdir}/usr/bin"

    cd "$directory"

    for file in *; do
        if [ -x "$file" ]; then
            if [[ "$file" == "sudo" || "$file" == "su" ]]; then
                # Add setuid setgid
                chmod u+s,g+s "$file"
            fi
            new_name="${file}-rs"
            mv "$file" "$new_name"
        fi
    done
}
