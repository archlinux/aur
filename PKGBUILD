# Maintainer: shiyi
pkgname=fd-rdd-git
_pkgname=fd-rdd
pkgver=0.2.0
pkgrel=2
pkgdesc="Event-driven elastic file indexer with RDD lineage and glob support"
arch=('x86_64')
url="https://github.com/awei807-wei/vcp-fd-rdd"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('fd-rdd')
conflicts=('fd-rdd')
# 关键修正：强制克隆到 $_pkgname 目录
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
    cargo build --release --frozen
}

package() {
    cd "$_pkgname"
    # 安装二进制文件
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    
    # 安装并修正 Service 文件
    mkdir -p "$pkgdir/usr/lib/systemd/user/"
    sed 's|%h/.vcp/bin/fd-rdd|/usr/bin/fd-rdd|g' scripts/fd-rdd.service > "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
    
    # 安装文档
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}