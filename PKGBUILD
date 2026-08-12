# Maintainer: taotieren <admin@taotieren.com>

pkgname=scope-monitor-git
pkgver=0.6.0.r2.g275f243
pkgrel=1
pkgdesc="A multi-platform serial monitor with user-extensible features"
arch=($CARCH)
url="https://github.com/matheuswhite/scope-rs"
license=('MIT OR Apache-2.0')
provides=(${pkgname%-git} ${pkgname%-monitor-git})
conflicts=(${pkgname%-git} ${pkgname%-monitor-git})
replaces=()
depends=(
    libgcc_s.so
    systemd-libs
)
makedepends=(
    git
    rust
    pkgconf
)
optdepends=()
backup=()
options=(!lto !debug)
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
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    #     cargo build --release --all-features
    # CFLAGS+=" -ffat-lto-objects"
    cargo build \
        --offline \
        --locked \
        --release
}

# check() {
#     cd "${srcdir}/${pkgname}/"
#
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --all-features
# }

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    #     cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -vDm0755 -t "$pkgdir/usr/bin/" {} +
    # install -vDm0755 target/release/${pkgname%-monitor} -t "$pkgdir/usr/bin/"
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    
    cd target/release/
    local _sh _compdest
    for _sh in bash zsh fish; do
        ./scope completions "$_sh" > "scope.$_sh"
        case "$_sh" in
            bash) _compdest="$pkgdir/usr/share/bash-completion/completions/scope" ;;
            zsh)  _compdest="$pkgdir/usr/share/zsh/site-functions/_scope" ;;
            fish) _compdest="$pkgdir/usr/share/fish/vendor_completions.d/scope.fish" ;;
        esac
        install -Dm0644 "scope.$_sh" "$_compdest"
    done
}
