# Maintainer: taotieren <admin@taotieren.com>

pkgname=uf2conv-rs-git
pkgver=0.1.0.r6.g8dd76fd
pkgrel=10
pkgdesc="Converts binary files to Microsoft's UF2 format https://github.com/Microsoft/uf2"
arch=($CARCH)
url="https://github.com/sajattack/uf2conv-rs"
license=('MIT')
provides=(${pkgname%-git} ${pkgname%-rs-git})
conflicts=(${pkgname%-git} ${pkgname%-rs-git})
replaces=()
depends=(gcc-libs
    glibc)
makedepends=(git
    cargo)
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    #     cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
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
