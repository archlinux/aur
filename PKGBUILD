# Maintainer: taotieren <admin@taotieren.com>

pkgname=scope-monitor
pkgver=0.6.0
pkgrel=1
pkgdesc="A multi-platform serial monitor with user-extensible features"
arch=($CARCH)
url="https://github.com/matheuswhite/scope-rs"
license=('MIT OR Apache-2.0')
provides=(${pkgname} ${pkgname%-monitor})
conflicts=(${pkgname} ${pkgname%-monitor})
replaces=()
depends=(
    libgcc_s.so
    openssl
    systemd-libs
)
makedepends=(
    git
    rust
    pkgconf
)
optdepends=()
backup=()
options=(!lto)
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('5819846536f4d3616ac19ea09d89972960f37a50b0d51d6b0fc151012959b493')

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
