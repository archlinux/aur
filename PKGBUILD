# Maintainer: wanger <310779211wym@gmail.com>
pkgname=mineral
pkgver=0.5.3
pkgrel=2
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
_patches=(hotfix-0.5.3-r2-01.patch )
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "${_patches[@]}")
sha256sums=('68b6ee7e3fb72362f554ea031f9b1daa07c7d91a0c2b6016aa5a9998823de385'
            '281c7816e23e3ab7500b498f675622a497d5cb3af8150a036568a988a556b0f2')

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
