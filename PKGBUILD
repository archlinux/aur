# Maintainer: taotieren <admin@taotieren.com>

pkgname=sudo-rs
pkgver=0.2.1
pkgrel=0
pkgdesc="A safety oriented and memory safe implementation of sudo and su written in Rust."
arch=('any')
url="https://github.com/memorysafety/sudo-rs"
license=('Apache 2.0', 'MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=()
makedepends=(cargo
    clang
    pam)
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('67469b5402375cd6f2d76d00bbce170238e2b7be9ff83bc1de88d14535288a38')

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
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/"LICENSE* -t "$pkgdir/usr/share/licenses/${pkgname}/"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/"COPYRIGHT* -t "$pkgdir/usr/share/licenses/${pkgname}/"

# Rename it to end in `-rs` to eliminate conflicts with `sudo` `util-linux`.
    directory="$pkgdir/usr/bin"

    cd "$directory"

    for file in *; do
        if [ -x "$file" ]; then
            if [ "$file" = "sudo" ] || [ "$file" = "su" ]; then
                # Add setuid
                chmod u+s "$file"
            fi
            new_name="${file}-rs"
            mv "$file" "$new_name"
        fi
    done
}
