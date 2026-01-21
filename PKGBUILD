# Maintainer: Canmi <t@canmi.icu>
pkgname=vane
pkgver=0.8.14
pkgrel=1
pkgdesc="A flow-based reverse proxy with multi-layer routing and programmable pipelines"
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64' 'loongarch64')
url="https://vaneproxy.com"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git' 'cmake' 'clang')
backup=('etc/vane/.env')
install=vane.install
source=("git+https://github.com/canmi21/vane.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # Force using Clang for C/C++ compilation to satisfy aws-lc-sys requirements
    export CC=clang
    export CXX=clang++

    # Configure features based on architecture to match CI workflows
    case "$CARCH" in
        riscv64|loongarch64)
            echo ":: Building with 'ring' crypto backend for $CARCH"
            cargo build --frozen --release --no-default-features --features full,ring
            ;;
        *)
            echo ":: Building with default 'aws-lc-rs' crypto backend for $CARCH"
            cargo build --frozen --release --all-features
            ;;
    esac
}

check() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # Run tests with the same feature set as build
    case "$CARCH" in
        riscv64|loongarch64)
            cargo test --frozen --release --no-default-features --features full,ring
            ;;
        *)
            cargo test --frozen --release --all-features
            ;;
    esac
}

package() {
    cd "${pkgname}"

    # Install Binary
    install -Dm755 "target/release/vane" "$pkgdir/usr/bin/vane"

    # Install License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install Systemd Service
    # Note: Source location in repo is package/default/vane.service
    install -Dm644 "package/default/vane.service" "$pkgdir/usr/lib/systemd/system/vane.service"

    # Install Configuration Files
    # We install the structure from package/default
    install -dm755 "$pkgdir/etc/vane"

    # Install .env.example as .env
    # We don't overwrite if it exists (backup array handles this, but install handles the initial copy)
    install -Dm644 "package/default/.env.example" "$pkgdir/etc/vane/.env"

    # Install skeleton directories and example configs
    # Copying application, listener, resolver directories
    for dir in application listener resolver; do
        if [ -d "package/default/$dir" ]; then
            # Create the directory in /etc/vane
            install -dm755 "$pkgdir/etc/vane/$dir"
            # Copy contents if any
            cp -r "package/default/$dir"/* "$pkgdir/etc/vane/$dir/" 2>/dev/null || true
        fi
    done
}
