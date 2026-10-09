pkgname=purelive-bin
pkgver=3.1.18
_filever=3.1.18
_buildnum=4107
pkgrel=1
pkgdesc="纯粹直播（Pure Live）基于 Flutter 的开源多平台直播聚合播放器"
arch=('x86_64')
url="https://github.com/liuchuancong/pure_live"
license=('AGPL-3.0-or-later')
depends=(
    'gtk3' 'alsa-lib'
)
makedepends=()
optdepends=()
provides=("purelive=${pkgver}")
conflicts=("purelive")
options=('!strip' '!debug')
sha256sums_x86_64=('cfb6794facba82ac46039f0f28c2619c07eb2a7771808df9a8f42a2c4d82d11e')
source_x86_64=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/liuchuancong/pure_live/releases/download/v${pkgver}/PureLive-${_filever}-${_buildnum}-linux-x64.tar.gz"
)
package() {
    # 主程序安装到 /opt/purelive
    install -d "${pkgdir}/opt/purelive"
    cp -a "${srcdir}/pure_live" "${srcdir}/data" "${srcdir}/lib" "${pkgdir}/opt/purelive/"
    chmod 755 "${pkgdir}/opt/purelive/pure_live"
    # /usr/bin 启动脚本
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/purelive" <<'EOF'
#!/bin/bash
exec /opt/purelive/pure_live "$@"
EOF

    # 桌面文件
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/purelive.desktop" <<'EOF'
[Desktop Entry]
Name=Pure Live
Name[zh_CN]=纯粹直播
Comment=A third-party live stream aggregator
Comment[zh_CN]=第三方多平台直播聚合播放器
Exec=purelive %U
Icon=purelive
Terminal=false
Type=Application
Categories=AudioVideo;Network;
StartupWMClass=pure_live
EOF

    # 图标
    install -Dm644 "${srcdir}/data/flutter_assets/assets/icons/icon.png" \
        "${pkgdir}/usr/share/pixmaps/purelive.png"
}

