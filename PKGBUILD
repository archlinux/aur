# Maintainer: taotieren <admin@taotieren.com>

pkgname=sudo-rs
pkgver=0.2.0
pkgrel=2
pkgdesc="A memory safe implementation of sudo and su."
arch=('any')
url="https://github.com/memorysafety/sudo-rs"
license=('Apache 2.0', 'MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(sudo)
depends=()
makedepends=(cargo
    clang
    pam)
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2d1e6bdfc8f14a6023328ffd48a00f7c973409e7bdc6199f484c095ad9817090')

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


# Rename it to end in `-rs` to eliminate conflicts with `sudo` `utils-linux`.
    directory="$pkgdir/usr/bin"

    cd "$directory"

    for file in *; do
        if [ -x "$file" ]; then
            if [ "$file" = "sudo" ] || [ "$file" = "su" ]; then
                chmod u+s "$file"  # Add setuid
            fi
            new_name="${file}-rs"
            mv "$file" "$new_name"
        fi
    done
}
