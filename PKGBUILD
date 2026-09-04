# Maintainer: nth233 <mrnothing233@gmail.com>
#
# 中国农历命令行工具（date_nongli / cal_nongli）
# 依据 Arch Wiki 的 Rust 打包规范编写：
#   https://wiki.archlinux.org/title/Rust_package_guidelines
#
# 源码取自 crates.io（而非 GitHub），以保证发布源单一一致：
#   通过 static.crates.io 的稳定 .crate 下载地址。
# 每次发版：改 pkgver / 重算 sha256sums / 重新生成 .SRCINFO。

pkgname=cal_nongli
pkgver=0.1.1
pkgrel=1
pkgdesc="Chinese lunar calendar CLI: inspect a day or a month with lunar days, ganzhi, solar terms and traditional festivals"
arch=('x86_64')
url="https://crates.io/crates/cal_nongli"
license=('MIT')
depends=('gcc-libs')                 # Rust 二进制通常链 libgcc（glibc 为隐式依赖）
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('b42408d19541bcecc8c9841ba266bf6ce9b867bdbd07f6b1e32333197fe89780')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    # 在 prepare 阶段离线缓存依赖，供 build/check 的 --frozen 全程离线使用。
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    # 非 git 源码（.crate）下，build.rs 会自动回退使用 Cargo 版本号，不会失败。
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    # 两个可执行文件都安装到 /usr/bin
    install -Dm0755 -t "$pkgdir/usr/bin/" \
        "target/release/date_nongli" \
        "target/release/cal_nongli"

    # 授权与文档（.crate 里含 LICENSE 与 README）
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
