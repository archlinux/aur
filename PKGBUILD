pkgname=purelive-bin
pkgver=3.1.2
_filever=3.1.2
_buildnum=4100
pkgrel=2
pkgdesc="纯粹直播（Pure Live）基于 Flutter 的开源多平台直播聚合播放器"
arch=('x86_64')
url="https://github.com/liuchuancong/pure_live"
license=('AGPL-3.0-or-later')
depends=(
    'gtk3' 'libayatana-appindicator' 'libayatana-indicator' 'libpulse'
    'alsa-lib' 'gnutls'
)
makedepends=('gcc' 'patchelf')
optdepends=(
    'mpv: external MPV player support as alternative decoder'
    'libva: VA-API hardware decoding interface (Intel/AMD)'
    'libvdpau: NVIDIA VDPAU hardware decoding acceleration'
    'libva-intel-driver: VA-API driver for Intel GPUs'
    'libva-mesa-driver: VA-API driver for AMD/Mesa GPUs'
)
provides=("purelive=${pkgver}")
conflicts=("purelive")
options=('!strip' '!debug')
source=("force-decor.c")
sha256sums=('03c5ac24864086b7eb697855a6ad5df7f5ed3ef99585793dabd24853da6633f2')
sha256sums_x86_64=('db74854b53d414485e2d85a4dad32ed1fb5884d60faa606ad80cfa8464499910')
source_x86_64=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/liuchuancong/pure_live/releases/download/v${pkgver}/PureLive-${_filever}-${_buildnum}-linux-x64.tar.gz"
)
build() {
    gcc -shared -fPIC -O2 -ldl -o "${srcdir}/force-decor.so" "${srcdir}/force-decor.c"
}
package() {
    # 主程序安装到 /opt/purelive
    install -d "${pkgdir}/opt/purelive"
    cp -a "${srcdir}/pure_live" "${srcdir}/data" "${srcdir}/lib" "${pkgdir}/opt/purelive/"
    chmod 755 "${pkgdir}/opt/purelive/pure_live"
    # 清除不安全的 RUNPATH
    for so in "${pkgdir}/opt/purelive/lib/"*.so; do
        patchelf --remove-rpath "$so" 2>/dev/null || true
    done
    # 标题栏修复 shim
    install -Dm755 "${srcdir}/force-decor.so" "${pkgdir}/usr/lib/purelive/force-decor.so"
    # /usr/bin
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/purelive" <<'EOF'
#!/bin/sh
[ -n "$PURELIVE_NO_SHIM" ] || \
    export LD_PRELOAD="/usr/lib/purelive/force-decor.so${LD_PRELOAD:+:$LD_PRELOAD}"
exec /opt/purelive/pure_live "$@"
EOF
    # Desktop 入口
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
StartupWMClass=purelive
EOF
    # 图标
    install -Dm644 "${srcdir}/data/flutter_assets/assets/icons/icon.png" \
        "${pkgdir}/usr/share/pixmaps/purelive.png"
}
