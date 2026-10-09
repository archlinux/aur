# Maintainer: Tuack-GUI Develop Team

pkgname=tuack-gui-git
pkgver=1.1.0.alpha.1.0.g53dd54f
pkgrel=3
pkgdesc="美观、跨平台的 Tuack-NG 图形化前端"
arch=("x86_64")
url="https://github.com/tuackng/Tuack-GUI"
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
    "git+https://github.com/tuackng/Tuack-GUI.git#branch=main"
    "tuack-gui.desktop"
)
sha256sums=(
    "SKIP"
    "cd42b230ea4da37772c2d06f991df71c03b55c9fe6700248830a8bf80f420640"
)
install="tuack-gui-git.install"

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

    # 主程序直接进 /usr/bin：sidecar（tuack-ng/typst）按 exe 同目录解析，
    # 正好命中 /usr/bin 的系统二进制；assets 由 tuack-ng 原生从
    # /usr/share/tuack-ng 读取，无需随包复制
    install -Dm755 src-tauri/target/release/tuack-gui "$pkgdir/usr/bin/tuack-gui"

    # 启动器图标：pixmaps 回退 + hicolor 主题多尺寸（缺了启动器会显示缺省齿轮）
    install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/pixmaps/tuack-gui.png"
    install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/tuack-gui.png"
    install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/tuack-gui.png"
    install -Dm644 src-tauri/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/tuack-gui.png"
    install -Dm644 src-tauri/icons/icon-src-light.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tuack-gui.svg"

    install -Dm644 "$srcdir/tuack-gui.desktop" "$pkgdir/usr/share/applications/tuack-gui.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
