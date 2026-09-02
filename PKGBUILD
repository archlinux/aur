pkgname=purelive-bin
pkgver=3.0.9
_buildnum=4097
pkgrel=1
pkgdesc="纯粹直播（Pure Live）基于 Flutter 的开源多平台直播聚合播放器"
arch=('x86_64')
url="https://github.com/liuchuancong/pure_live"
license=('AGPL-3.0-or-later')
depends=(
    'gtk3' 'glib2' 'pango' 'cairo' 'gdk-pixbuf2'
    'libepoxy' 'libglvnd' 'alsa-lib' 'libpulse'
    'libayatana-appindicator' 'libayatana-indicator' 'libdbusmenu-glib'
    'libxkbcommon' 'libva' 'libvdpau' 'libxss'
    'libxv' 'mesa' 'wayland'
    'libxrandr' 'libxcb' 'freetype2' 'ayatana-ido'
    'libx11' 'libdrm' 'harfbuzz' 'libxext' 'xz' 'lcms2'
    'gcc-libs' 'at-spi2-core' 'fribidi' 'gnutls' 'libxfixes'
    'glibc' 'libunwind' 'fontconfig' 'zlib' 'libarchive'
)
optdepends=(
    'mpv: external player support'
    'java-runtime: for dart JNI plugin (libdartjni.so)'
)
provides=("purelive=${pkgver}")
conflicts=("purelive")
options=('!strip' '!debug')
source_x86_64=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/liuchuancong/pure_live/releases/download/v${pkgver}/PureLive-${pkgver}-${_buildnum}-linux-x64.tar.gz"
)
sha256sums_x86_64=(
    '9b04f579b66cf4dd0395993a974f22554b70d6c7b3c57913071357eebc6a11e3'
)

package() {
    # 安装主程序到 /opt
    install -d "${pkgdir}/opt/purelive"
    cp -a "${srcdir}/pure_live" "${srcdir}/data" "${srcdir}/lib" "${pkgdir}/opt/purelive/"
    chmod 755 "${pkgdir}/opt/purelive/pure_live"

    # 清除不安全的 RUNPATH
    for so in "${pkgdir}/opt/purelive/lib/"*.so; do
        if command -v patchelf >/dev/null 2>&1; then
            patchelf --remove-rpath "$so" 2>/dev/null || true
        fi
    done

    # /usr/bin 启动脚本
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/purelive" <<'EOF'
#!/bin/sh
exec /opt/purelive/pure_live "$@"
EOF

    # Desktop 入口
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/purelive.desktop" <<EOF
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
EOF

    # 从解压的包内安装图标
    install -Dm644 "${srcdir}/pure_live/data/flutter_assets/assets/icons/icon.png" \
        "${pkgdir}/usr/share/pixmaps/purelive.png"

    # 安装许可证
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
                    GNU AFFERO GENERAL PUBLIC LICENSE
                       Version 3, 19 November 2007
...
EOF
}
