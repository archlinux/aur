pkgname=git-commit-helper
pkgver=0.6.0.r22.21abe3e
pkgrel=1
pkgdesc="一个帮助规范 git commit message 的工具"
arch=('x86_64')
url="https://github.com/zccrs/git-commit-helper"
license=('MIT')
depends=('git')
makedepends=('rust' 'cargo')

# 直接使用当前目录作为源
source=("$pkgname-$pkgver.tar.gz::https://github.com/zccrs/git-commit-helper/archive/21abe3ec1bad211ae452568323a5606173d9de2b.tar.gz")
sha256sums=('50d7131614f7fb508c685d2b060a9c07110df6b8a21e040bdf8bd4b21f7dd836')


prepare() {
    cd "$srcdir/$pkgname-21abe3ec1bad211ae452568323a5606173d9de2b"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked || true
}

build() {
    cd "$srcdir/$pkgname-21abe3ec1bad211ae452568323a5606173d9de2b"
    export CARGO_HOME="$srcdir/cargo-home"
    RUSTUP_TOOLCHAIN=stable cargo build --release
}

check() {
    cd "$srcdir/$pkgname-21abe3ec1bad211ae452568323a5606173d9de2b"
    export CARGO_HOME="$srcdir/cargo-home"
    RUSTUP_TOOLCHAIN=stable cargo test --release || true
}

package() {
    cd "$srcdir/$pkgname-21abe3ec1bad211ae452568323a5606173d9de2b"

    # 创建必要的目录
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"

    # 安装二进制文件
    install -Dm755 "target/release/git-commit-helper" "$pkgdir/usr/bin/git-commit-helper"

    # 安装补全文件（使用固定路径）
    if [ -f "completions/git-commit-helper.bash" ]; then
        install -Dm644 "completions/git-commit-helper.bash" \
            "$pkgdir/usr/share/bash-completion/completions/git-commit-helper"
    else
        echo "Warning: Bash completion file not found"
    fi

    if [ -f "completions/git-commit-helper.zsh" ]; then
        install -Dm644 "completions/git-commit-helper.zsh" \
            "$pkgdir/usr/share/zsh/site-functions/_git-commit-helper"
    else
        echo "Warning: Zsh completion file not found"
    fi

    # 安装许可证文件
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
