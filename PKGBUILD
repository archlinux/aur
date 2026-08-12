# Maintainer: Detrital <Detritalw@outlook.com>
pkgname=bloret-launcher
pkgver=27.1
pkgrel=1
pkgdesc="Be creative, be simple. Your Personal Innovative Open Source AI Minecraft Launcher. Relax, it's Bloret Launcher."
arch=('any')
url="https://github.com/BloretCrew/Bloret-Launcher"
license=('GPL-3.0-only')
depends=(
    'python'
    'pyside6'
    'python-requests'
    'python-psutil'
    'python-dulwich'
    'python-send2trash'
    'python-toml'
    'python-qrcode'
    'python-pillow'
    'python-darkdetect'
    'qt6-5compat'
    'qt6-declarative'
)
optdepends=(
    'java-runtime: 运行 Minecraft 所需的 Java 环境'
    'easytier: 局域网联机功能所需的 EasyTier 网络工具'
    'fcitx5-qt: Qt6 fcitx5 输入法前端（Linux 下中文输入/切换）'
    'fcitx5: fcitx5 输入法框架'
    'python-websocket-client: Blora Agent 多平台即时通讯连接器'
    'python-cryptography: 微信媒体加解密等安全相关功能'
    'python-dingtalk-stream: 钉钉 Stream 连接器（AUR）'
    'python-lark-oapi: 飞书 / Lark OpenAPI 连接器（AUR）'
    'python-aiortc: BBBS Live WebRTC 支持（AUR）'
)
# RinUI is a git submodule and is empty in the GitHub source tarball.
_rinui_commit=5fa8d11bea1a35543811f058c3ee36baa050c1a7
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "RinUI-${_rinui_commit}.tar.gz::https://github.com/Detritalw/Rin-UI/archive/${_rinui_commit}.tar.gz"
)
sha256sums=(
    'bf931f6282aea5595435bd38aceb080556d52d234d3db6019f02edec1f7dd7a9'
    '765555972b85a8ac0ae1097cf8282c19bcf2e2c4940ae8a953d7132b3040b29e'
)

prepare() {
    cd "${srcdir}/Bloret-Launcher-${pkgver}"

    # Populate empty RinUI submodule from the pinned commit archive.
    rm -rf RinUI
    mv "${srcdir}/Rin-UI-${_rinui_commit}" RinUI
}

package() {
    cd "${srcdir}/Bloret-Launcher-${pkgver}"

    _install_dir="${pkgdir}/usr/share/bloret-launcher"

    # 安装源码和数据文件
    install -Dm755 Bloret-Launcher.py "${_install_dir}/Bloret-Launcher.py"
    cp -r qml "${_install_dir}/qml"
    cp -r RinUI "${_install_dir}/RinUI"
    cp -r icon "${_install_dir}/icon"
    cp -r lang "${_install_dir}/lang"
    cp -r modules "${_install_dir}/modules"
    cp -r ui "${_install_dir}/ui"
    if [[ -d img ]]; then
        cp -r img "${_install_dir}/img"
    fi
    if [[ -d examples/plugins ]]; then
        install -d "${_install_dir}/examples"
        cp -r examples/plugins "${_install_dir}/examples/plugins"
    fi
    install -Dm644 config.json "${_install_dir}/config.json"
    install -Dm644 JavaWrapper.jar "${_install_dir}/JavaWrapper.jar"
    install -Dm644 Bloret.png "${_install_dir}/Bloret.png"
    install -Dm644 Bloret-Fluent.png "${_install_dir}/Bloret-Fluent.png"
    install -Dm644 bloret.ico "${_install_dir}/bloret.ico"
    install -Dm644 servers.dat "${_install_dir}/servers.dat" 2>/dev/null || true

    # 清理不应随包安装的内容（开发文档、测试、缓存等）
    rm -rf \
        "${_install_dir}/RinUI/docs" \
        "${_install_dir}/RinUI/examples" \
        "${_install_dir}/RinUI/test" \
        "${_install_dir}/RinUI/scripts" \
        "${_install_dir}/RinUI/.github" \
        "${_install_dir}/img/New-Images" \
        2>/dev/null || true
    find "${_install_dir}" -type d -name '__pycache__' -exec rm -rf {} + 2>/dev/null || true
    find "${_install_dir}" -type d -name '.git' -exec rm -rf {} + 2>/dev/null || true
    find "${_install_dir}" -type f \( -name '*.pyc' -o -name '.gitignore' -o -name '.python-version' \) -delete 2>/dev/null || true

    # 安装启动脚本
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/bloret-launcher" <<EOF
#!/bin/sh
cd /usr/share/bloret-launcher
exec python Bloret-Launcher.py "\$@"
EOF

    # 安装图标
    install -Dm644 Bloret-Fluent.png "${pkgdir}/usr/share/pixmaps/bloret-launcher.png"

    # 安装桌面文件
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/bloret-launcher.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Bloret Launcher
GenericName=Minecraft Launcher
Comment=A Minecraft Launcher designed by BloretValley administrator.
Exec=bloret-launcher
Icon=bloret-launcher
Terminal=false
Categories=Game;
Keywords=minecraft;game;launcher;
EOF

    # 安装许可证
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
