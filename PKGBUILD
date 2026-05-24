# Maintainer: jinzhongjia <jinzhongjia@manus.ai>

pkgname=zap-oss-git
pkgver=2026.05.22.preview.r0.g3d4eaa4
pkgrel=1
# Upstream renamed releases from "YYYY.MM.DD.preview" to "0.YYYY.MM.DD.HHMM",
# which sorts lower under pacman vercmp. epoch ensures clean upgrades.
# This package replaces openwarp-git (project was renamed OpenWarp → Zap).
# Named zap-oss-* (after the binary `zap-oss`) because the AUR names
# zap-bin / zap-git are taken by unrelated projects (an AppImage manager
# and a web-shortcuts tool, respectively).
epoch=1
pkgdesc="Zap (formerly OpenWarp) - open-source fork of Warp, a Rust-based terminal with AI built in (git version)"
arch=('x86_64')
url="https://github.com/zerx-lab/zap"
license=('AGPL-3.0-only')
makedepends=(
    'git'
    'rustup'
    'cmake'
    'pkgconf'
    'openssl'
    'freetype2'
    'expat'
    'libgit2'
    'dbus'
    'fontconfig'
    'alsa-lib'
    'clang'
    'jq'
    'brotli'
    'protobuf'
)
depends=(
    'alsa-lib'
    'dbus'
    'fontconfig'
    'libglvnd'
    'wayland'
    'libx11'
    'libxcb'
    'libxcursor'
    'libxi'
    'libxkbcommon-x11'
    'zlib'
)
optdepends=(
    'mesa: hardware-accelerated rendering'
    'adwaita-icon-theme: fallback icon theme'
    'python: bundled skill scripts (create-skill, pr-comments, feedback)'
    'python-yaml: skill validation script'
)
provides=('zap-oss' 'openwarp' 'warp-terminal-oss')
conflicts=('openwarp-git' 'openwarp-bin' 'zap-oss-bin' 'warp-terminal-oss')
replaces=('openwarp-git')
# '!lto': makepkg 默认会往 CFLAGS/CXXFLAGS/LDFLAGS 注入 -flto=auto。
#         ring crate 的 build.rs 用这些 CFLAGS 通过 cc-rs 编译 C/asm，
#         GCC 会产出 slim LTO 对象（.text 段为 0 字节，符号只在 .gnu.lto_.symtab 里）。
#         rustc 调用的 rust-lld 不识别 GCC 的 GIMPLE LTO plugin，
#         结果 ring 的全部 C 符号在链接时 undefined。必须关掉 makepkg 的 LTO。
options=('!strip' '!debug' '!lto')
source=("${pkgname}::git+https://github.com/zerx-lab/zap.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    export CARGO_HOME="${srcdir}/.cargo"

    # Strip build paths from the binary. Without this, ~30k panic-site file
    # paths under $srcdir (project source, cargo registry, git checkouts)
    # get baked into zap-oss and makepkg flags them as $srcdir references.
    # --remap-path-prefix covers Rust code; -ffile-prefix-map covers the
    # tree-sitter grammar .c files compiled via cc-rs.
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}=/build --remap-path-prefix=${HOME}=/build/home"
    export CFLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=/build"
    export CXXFLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}=/build"

    cargo build --release --bin zap-oss --features "gui,nld_improvements"
}

package() {
    cd "${srcdir}/${pkgname}"

    _optdir="/opt/zap"

    # Install binary
    install -Dm755 "target/release/zap-oss" "${pkgdir}${_optdir}/zap-oss"

    # Install bundled resources (skills, MCP skills, etc.)
    if [[ -d "resources/bundled" ]]; then
        cp -r "resources/bundled" "${pkgdir}${_optdir}/resources"
    fi

    # Create symlinks
    install -d "${pkgdir}/usr/bin"
    # Use zap-oss (the binary's actual name) rather than /usr/bin/zap, to
    # avoid colliding with the unrelated `zap-bin` AppImage-manager package.
    ln -s "${_optdir}/zap-oss" "${pkgdir}/usr/bin/zap-oss"
    # Keep /usr/bin/openwarp for users with launchers from before the rename.
    ln -s "${_optdir}/zap-oss" "${pkgdir}/usr/bin/openwarp"

    # Install desktop file
    install -Dm644 "app/channels/oss/dev.zap.Zap.desktop" \
        "${pkgdir}/usr/share/applications/dev.zap.Zap.desktop"

    # Install icons
    for _size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
        _icon="app/channels/oss/icon/no-padding/${_size}.png"
        if [[ -f "${_icon}" ]]; then
            install -Dm644 "${_icon}" \
                "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/dev.zap.Zap.png"
        fi
    done
}
