# Maintainer: lzsnyy <710080675@qq.com>
# Contributor: zhangxunvvv (original author) <https://github.com/zhangxunvvv>

pkgname=xiami
pkgver=0.2.0
_commit=e3fa80f3034a5ccb7255e70e09cb0545af705231
pkgrel=1
pkgdesc="虾米 — 长篇小说 Agent 创作与无人值守生产工作台 (Tauri 2)"
arch=('x86_64' 'aarch64')
url="https://github.com/zhangxunvvv/xiami"
license=('Apache-2.0')
options=('!lto')
depends=('gtk3' 'webkit2gtk-4.1')
makedepends=('cargo' 'rust' 'nodejs' 'npm')
# 上游未打 tag，固定到 main 分支最新提交
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zhangxunvvv/xiami/archive/${_commit}.tar.gz")
sha256sums=('a56416273dff0509632d8be793d020d93596060fed1779a04c458cb8c39a21be')

prepare() {
    cd "xiami-${_commit}"
    export CARGO_HOME="${srcdir}/cargo-home"
    # 上游 package-lock.json 与 package.json 不同步，无法用 npm ci
    npm install --allow-remote=all
    # 预取并锁定 crate 依赖
    (cd src-tauri && cargo fetch --locked)
}

build() {
    cd "xiami-${_commit}"
    export CARGO_HOME="${srcdir}/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    # 只编译二进制，不打 nsis/msi 包（上游 bundle 目标仅针对 Windows）
    npx tauri build --no-bundle
}

package() {
    cd "xiami-${_commit}"
    install -Dm755 src-tauri/target/release/xiami-desktop "${pkgdir}/usr/bin/xiami"

    local _icon
    for _icon in 32x32 64x64 128x128; do
        install -Dm644 "src-tauri/icons/${_icon}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icon}/apps/xiami.png"
    done
    install -Dm644 "src-tauri/icons/128x128@2x.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/xiami.png"

    cat > xiami.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Xiami
GenericName=虾米
Comment=长篇小说 Agent 创作与无人值守生产工作台
Exec=/usr/bin/xiami
Icon=xiami
Categories=Office;TextEditor;
StartupWMClass=com.xiami.desktop
EOF
    install -Dm644 xiami.desktop "${pkgdir}/usr/share/applications/xiami.desktop"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
