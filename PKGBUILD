# Maintainer: wanger <310779211wym@gmail.com>
pkgname=mineral
pkgver=0.5.4
pkgrel=1
pkgdesc="A multi-source TUI music player in Rust — ratatui frontend, pluggable channel backends, real streaming playback with lyrics & spectrum."
arch=('x86_64')
url="https://github.com/10knamesmore/Mineral"
license=('MIT')
options=(!lto !debug)
depends=('alsa-lib' 'openssl' 'zlib' 'gcc-libs')
makedepends=('cargo')
# 同版本重打包(hotfix)的 patch 列表。仓库里恒为空,不要手工填:
# aur-publish 工作流按 dispatch 输入的 commit SHA 现场生成 patch 并注入此数组,
# release.yml 正式发版渲染时强制清空(新 tag 已含修复,残留 patch 会二次 apply 失败)。
_patches=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "${_patches[@]}")
sha256sums=('8e3589d68f239e5309a35c09df5d6a6eb4a1405e4ee6aec1f302dfb184185cf9')

prepare() {
    cd "Mineral-$pkgver"
    local p
    for p in "${_patches[@]}"; do
        patch -Np1 -i "$srcdir/$p"
    done
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "Mineral-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --package mineral
}

package() {
    cd "Mineral-$pkgver"
    install -Dm755 "target/release/mineral" "$pkgdir/usr/bin/mineral"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
