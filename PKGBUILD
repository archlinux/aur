# Maintainer: shiyi
pkgname=fd-rdd-git
_pkgname=vcp-fd-rdd
pkgver=0.2.0
pkgrel=3
pkgdesc="Event-driven elastic file indexer with RDD lineage and glob support"
arch=('x86_64')
url="https://github.com/awei807-wei/vcp-fd-rdd"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('fd-rdd')
conflicts=('fd-rdd')
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "0.2.0.r%s.%s" "$(git rev-list --count HEAD 2>/dev/null || echo 0)" "$(git rev-parse --short HEAD 2>/dev/null || echo init)"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Strip LTO from CFLAGS — GCC LTO bitcode is incompatible with rust-lld
    CFLAGS="${CFLAGS//-flto=auto/}"
    CXXFLAGS="${CXXFLAGS//-flto=auto/}"
    cargo build --release --frozen
}

package() {
    cd "$_pkgname"
    # 安装二进制文件 (注意：cargo 编译出的二进制名字由 Cargo.toml 定义，通常是 fd-rdd)
    # 如果 Cargo.toml 里的 name 是 fd-rdd，这里就用 fd-rdd
    install -Dm755 "target/release/fd-rdd" "$pkgdir/usr/bin/fd-rdd"
    
    # 安装并修正 Service 文件
    mkdir -p "$pkgdir/usr/lib/systemd/user/"
    sed 's|%h/.vcp/bin/fd-rdd|/usr/bin/fd-rdd|g' scripts/fd-rdd.service > "$pkgdir/usr/lib/systemd/user/fd-rdd.service"
    
    # 安装文档
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
