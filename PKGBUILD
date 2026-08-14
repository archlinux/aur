# Maintainer: Hocking Lee <hockinglee@gmail.com>

pkgname=cmux-tui
pkgver=0.0.1
pkgrel=1
pkgdesc="CMUX (3GPP TS 27.010) serial debugger TUI with dual-channel hex/ASCII view and millisecond timestamps"
arch=('x86_64' 'aarch64')
url="https://github.com/hocking-lee/cmux-tui"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
# release profile 里已经 strip，再让 makepkg 抽调试符号只会产出一个空的
# -debug 包，并在打包时报 "No debugging symbols"。
options=('!debug')
# 指向 tag 而非 branch：AUR 要求固定版本包的源码是不可变的，
# 同一个 pkgver 必须永远构建出同样的内容。branch 会移动，tag 不会。
#
# tag 名不带 v 前缀，是为了避开与发布分支 v$pkgver 重名：makepkg 检出时
# 用的是裸 ref 名（不加 refs/tags/ 前缀），仓库里若同时存在同名的分支和
# tag，git 会报 "ambiguous object name" 而直接构建失败。
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # 全部测试都用内存流驱动，不需要真实串口硬件。
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
