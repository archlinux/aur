# Maintainer: Tuack-GUI Develop Team

pkgname=tuack-gui-git
pkgver=1.1.0.alpha.1.14.g68fe7b3
pkgrel=1
pkgdesc="美观、跨平台的 Tuack-NG 图形化前端"
arch=("x86_64")
url="https://github.com/Qaaxaap/tuack-gui"
license=("AGPL-3.0-or-later")
depends=(
    "gtk3"
    "webkit2gtk-4.1"
    "libayatana-appindicator"
    "typst"
    "tuack-ng"
)
makedepends=(
    "cargo"
    "nodejs"
    "pnpm"
    "git"
)
options=("!lto" "!debug")
source=(
    "git+https://github.com/Qaaxaap/tuack-gui.git#branch=main"
    "tuack-gui.desktop"
)
sha256sums=(
    "SKIP"
    "cd42b230ea4da37772c2d06f991df71c03b55c9fe6700248830a8bf80f420640"
)

pkgver() {
    cd tuack-gui
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//; s/-/./g'
}

prepare() {
    cd tuack-gui
    export RUSTUP_TOOLCHAIN=stable
    # 预取 crates.io 依赖（构建期不再联网拉 Rust 依赖）
    cargo fetch --locked --manifest-path src-tauri/Cargo.toml --target "$(rustc --print host-tuple)"
    pnpm install --frozen-lockfile
}

build() {
    cd tuack-gui
    export RUSTUP_TOOLCHAIN=stable
    # 前端构建 + Rust release 构建；--no-bundle 跳过 deb/AppImage 打包器
    pnpm tauri build --no-bundle
}

package() {
    cd tuack-gui

    install -Dm755 src-tauri/target/release/tuack-gui "$pkgdir/usr/lib/tuack-gui/tuack-gui"

    # 运行时资源：仓库内 assets 是 gitignore 的（CI 时从 tuack-ng 发布包下载），
    # 这里软链到 tuack-ng 软件包安装的资产目录（tuack-ng-git / tuack-ng-bin 均装到
    # /usr/share/tuack-ng），应用首次启动会复制到自己的数据目录
    ln -s /usr/share/tuack-ng "$pkgdir/usr/lib/tuack-gui/assets"
    ln -s /usr/bin/tuack-ng "$pkgdir/usr/lib/tuack-gui/tuack-ng"
    ln -s /usr/bin/typst "$pkgdir/usr/lib/tuack-gui/typst"

    install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/pixmaps/tuack-gui.png"
    install -Dm644 "$srcdir/tuack-gui.desktop" "$pkgdir/usr/share/applications/tuack-gui.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
