# Maintainer: zerx-lab <https://github.com/zerx-lab>

pkgname=zerx-lab-zed-nightly-bin
pkgver=0.0.0.nightly.placeholder
pkgrel=1
pkgdesc="Zed 编辑器 Nightly 预编译版本（来自 main 分支每日构建）"
arch=('x86_64')
url="https://zed.dev"
license=('GPL-3.0-or-later' 'AGPL-3.0-or-later')
provides=('zed')
conflicts=('zed' 'zed-git' 'zed-preview' 'zed-preview-bin')
depends=(
    'alsa-lib'
    'fontconfig'
    'libgit2'
    'libxcb'
    'libxkbcommon-x11'
    'openssl'
    'sqlite'
    'zlib'
    'libxkbcommon'
    'wayland'
    'vulkan-icd-loader'
)
optdepends=(
    'clang: C/C++ language support'
    'rust: Rust language support'
)
source_x86_64=("zed-nightly-linux-x86_64.tar.gz::https://github.com/zerx-lab/actions/releases/download/zed-nightly-latest/zed-nightly-linux-x86_64.tar.gz")
sha256sums_x86_64=('SKIP')
options=('!strip')

package() {
    # 解压后目录格式为 zed-<pkgver>/
    local _srcdir
    _srcdir=$(find "${srcdir}" -maxdepth 1 -type d -name 'zed-*' | head -1)

    if [ -z "$_srcdir" ]; then
        echo "错误：找不到解压后的 zed-* 目录"
        ls "${srcdir}"
        return 1
    fi

    install -Dm755 "${_srcdir}/zed" "${pkgdir}/usr/bin/zed"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/zed.desktop" <<DESKTOP
[Desktop Entry]
Name=Zed Nightly
Comment=A high-performance, multiplayer code editor (Nightly Build)
Exec=zed %F
Icon=zed
Type=Application
Categories=Development;TextEditor;
MimeType=text/plain;
StartupWMClass=dev.zed.Zed-Preview
Keywords=Text;Editor;
DESKTOP

    if [ -f "${_srcdir}/zed.png" ]; then
        install -Dm644 "${_srcdir}/zed.png" "${pkgdir}/usr/share/pixmaps/zed.png"
    fi
}
