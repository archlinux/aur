# Maintainer: taotieren <admin@taotieren.com>

pkgname=sudo-rs
pkgver=0.2.2
pkgrel=0
pkgdesc="A safety oriented and memory safe implementation of sudo and su written in Rust."
arch=('x86_64'
    'aarch64'
    'riscv64')
url="https://github.com/memorysafety/sudo-rs"
license=('Apache-2.0' 'MIT')
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
sha256sums=('d4ce461f8206b36035a82197a477657afeb8a795b3378e604fe921e03c38ec5d')

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${srcdir}/${pkgname}-${pkgver}/"
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
            if [ -f "$file" = "sudo" ] || [ -f "$file" = "su" ]; then
                # Add setuid setgid
                chmod u+s,g+s "$file"
            fi
            new_name="${file}-rs"
            mv "$file" "$new_name"
        fi
    done
}
