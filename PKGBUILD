pkgname=purelive-bin
pkgver=3.1.19
_filever=3.1.19
_buildnum=4108
pkgrel=1
pkgdesc="纯粹直播（Pure Live）基于 Flutter 的开源多平台直播聚合播放器"
arch=('x86_64')
url="https://github.com/liuchuancong/pure_live"
license=('AGPL-3.0-or-later')
depends=('gtk3' 'alsa-lib')
makedepends=('gcc')
optdepends=()
provides=("purelive=${pkgver}")
conflicts=("purelive")
options=('!strip' '!debug')
sha256sums_x86_64=(
    '8b64b6f18692f5287a8bb8a9ac68fb798a9f383728a0a128f53892caece974f9'
    '03c5ac24864086b7eb697855a6ad5df7f5ed3ef99585793dabd24853da6633f2'
)
source_x86_64=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/liuchuancong/pure_live/releases/download/v${pkgver}/PureLive-${_filever}-${_buildnum}-linux-x64.tar.gz"
    "force-decor.c"
)

package() 
{
    # 编译 force-decor 库
    gcc -shared -fPIC "${srcdir}/force-decor.c" -o "${srcdir}/force-decor.so" -ldl

    # 安装 force-decor 库到 /usr/lib
    install -Dm755 "${srcdir}/force-decor.so" "${pkgdir}/usr/lib/force-decor.so"

    # 主程序安装到 /opt/purelive
    install -d "${pkgdir}/opt/purelive"
    cp -a "${srcdir}/pure_live" "${srcdir}/data" "${srcdir}/lib" "${pkgdir}/opt/purelive/"
    chmod 755 "${pkgdir}/opt/purelive/pure_live"

    # /usr/bin 启动脚本（添加 LD_PRELOAD）
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/purelive" <<'EOF'
#!/bin/bash
export LD_PRELOAD=/usr/lib/force-decor.so
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
