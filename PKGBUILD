pkgname=git-commit-helper
pkgver=0.5.3
pkgrel=1
pkgdesc="一个帮助规范 git commit message 的工具"
arch=('x86_64')
url="https://github.com/zccrs/git-commit-helper"
license=('MIT')
depends=('git')
makedepends=('rust' 'cargo')

# 直接使用当前目录作为源
source=("$pkgname-$pkgver.tar.gz::https://github.com/zccrs/git-commit-helper/archive/97861fd6b178685f13986025722d6c776690c1a6.tar.gz")
sha256sums=('406819f4be242a722d9daa9dc4db74c852431ff944623ddcf77200eb66323b3e')

pkgver() {
    cd "$srcdir/$pkgname-$GITHUB_SHA"
    # 尝试获取最新的 git tag 版本号（去除 v 前缀）
    local tag_ver=$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//' || echo "")
    if [ -n "$tag_ver" ]; then
        # 如果存在 tag，直接使用 tag 版本号
        printf "%s" "$tag_ver"
    else
        # 如果没有 tag，则使用 0.1.0.r{commit_count} 格式
        printf "$pkgver"
    fi
}

prepare() {
    cd "$srcdir/$pkgname-$GITHUB_SHA"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked || true
}

build() {
    cd "$srcdir/$pkgname-$GITHUB_SHA"
    export CARGO_HOME="$srcdir/cargo-home"
    RUSTUP_TOOLCHAIN=stable cargo build --release
}

check() {
    cd "$srcdir/$pkgname-$GITHUB_SHA"
    export CARGO_HOME="$srcdir/cargo-home"
    RUSTUP_TOOLCHAIN=stable cargo test --release || true
}

package() {
    cd "$srcdir/$pkgname-$GITHUB_SHA"

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
