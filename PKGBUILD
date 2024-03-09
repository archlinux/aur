# Maintainer: taotieren <admin@taotieren.com>

pkgname=probe-rs-git
pkgver=0.23.0.r21.g8e561138
pkgrel=1
pkgdesc="A debugging toolset and library for debugging embedded ARM and RISC-V targets on a separate host"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/probe-rs/probe-rs"
license=('MIT' 'Apache-2.0')
provides=(${pkgname%-git}
    cargo-embed
    cargo-flash
    rtthost
    smoke_tester
    target-gen
    xtask)
conflicts=(${pkgname%-git}
    cargo-embed
    cargo-flash
    rtthost
    smoke_tester
    target-gen
    xtask)
replaces=()
depends=(gcc-libs
    glibc
    libusb
    libftdi
    openssl
    systemd-libs)
makedepends=(git
    cargo)
backup=()
options=(!lto)
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
#     cargo build \
# 		--offline \
# 		--locked \
# 		--features 'cli,ftdi' \
# 		--release
}

check() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
#     cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
        find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
