# Maintainer: taotieren <admin@taotieren.com>

pkgname=sudo-rs
pkgver=0.2.3
pkgrel=1
pkgdesc="A safety oriented and memory safe implementation of sudo and su written in Rust."
arch=('x86_64'
    'aarch64'
    'riscv64')
url="https://github.com/trifectatechfoundation/sudo-rs"
license=('Apache-2.0 AND MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(gcc-libs
     glibc
     pam)
makedepends=(cargo
    clang)
backup=()
options=()
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2371c91644185c2bcf1f02408c2cc7a79b1dd1ba740088a9a16f0f947b649cdc')

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${srcdir}/${pkgname}-${pkgver}/"

    # https://github.com/memorysafety/sudo-rs/issues/832#issuecomment-1994101988
    sed -i 's|sudo-i|sudo|g' src/sudo/pam.rs
    cargo build --release --all-features
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
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .

# Rename it to end in `-rs` to eliminate conflicts with `sudo` `util-linux`.
    directory="$pkgdir/usr/bin"

    cd "$directory"

    for file in *; do
        if [ -x "$file" ]; then
            if [[ -f "$file" || "$file" = "sudo" ]]; then
                # Add setuid setgid
                chmod u+s,g+s "$file"
            fi
            new_name="${file}-rs"
            mv "$file" "$new_name"
        fi
    done
}
