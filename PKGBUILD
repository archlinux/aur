# Maintainer: taotieren <admin@taotieren.com>

pkgname=gmv-git
_name=${pkgname%-git}
pkgver=0.1.r49.g74b3767
pkgrel=1
pkgdesc="This is a video surveillance implementation based on GB28181: compatible with 2016 and 2022 versions."
arch=($CARCH)
url="https://github.com/epimore/gmv"
license=('MIT')
provides=(
    ${_name}
    gmv-session
    gmv-stream
)
conflicts=(
    ${_name}
    gmv-session
    gmv-stream
)
replaces=()
depends=(
    gcc-libs
    glibc
    openssl
    systemd-libs
)
makedepends=(
    rust
    cmake
    git
    pkgconf
)
backup=()
options=(!lto !debug)
install=
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${_name}/"

    sed -i 's|/home/ubuntu20/code/rs/mv/github/epimore/gmv/session/config.yml|/etc/gmv/session/config.yml|g' session/src/storage/entity.rs
    sed -i 's|/home/ubuntu20/code/rs/mv/github/epimore/gmv/session/config.yml|/etc/gmv/session/config.yml|g' session/src/storage/mapper.rs
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

# check() {
#     cd "${srcdir}/${pkgname}/"
#
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --all-features
# }

package() {
    cd "${srcdir}/${_name}/"

    export RUSTUP_TOOLCHAIN=stable
    install -Dm0644 session/config.yml "${pkgdir}/etc/gmv/session/config.yml"
    install -Dm0644 stream/readme "${pkgdir}/usr/share/doc/gmv/stream/readme"
    install -Dm0644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/

    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
