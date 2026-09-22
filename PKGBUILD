# Maintainer: sinbud2004 <sinbud2004@gmail.com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com> (atrust-bin: bsod_checker.js & electron-lib removal)
#
# 与上游 atrust-bin 的关键区别(后者在部分 Arch 机器上装完无法正常使用):
#   1. 保留 deb 自带的 Electron, 不依赖系统 electron9
#   2. 没有 chown ${USER}:${USER} (在主组不是用户名同名的组时必挂)
#   3. .install 钩子完整复刻官方 deb 的 postinst 初始化:
#      chmod 777 resources/app、.aTrust/var, dmidecode 工具加权,
#      InstallLocation + eaio_packman 注册, 启用/重启 aTrustDaemon
#      ——缺少这些初始化是"装上但核心服务不启动"的根因
#   4. systemd drop-in 修复关机/重启时 systemd-shutdown 长时间等待
#      (官方 KillMode=process 只杀主进程, 低权限子进程残留占住 /home /tmp)
#   5. 钩子向 /etc/environment 声明 XDG_SESSION_TYPE=x11: 桌面经 xinit/startx
#      直启时 logind 会话 Type=tty, aTrust 的登录用户检测要求 x11|wayland,
#      否则判定"无登录用户"导致核心服务拒绝以该用户运行(卸载即还原)
pkgname=sangfor-atrust-bin
_pkgname=aTrust
pkgver=2.5.16.30
pkgrel=1
pkgdesc="Sangfor aTrust SDP client (prebuilt, bundled Electron; postinst replicated, works out of the box)"
arch=('x86_64')
url="https://www.sangfor.com/"
license=('LicenseRef-unknown')
conflicts=('atrust-bin' 'sangfor-atrust')
provides=('sangfor-atrust' 'atrust')
depends=(
    'libxss'
    'qt5-base'
    'java-runtime'
    'gtk3'
    'libxrandr'
    'cairo'
    'libxcomposite'
    'at-spi2-core'
    'alsa-lib'
    'libxtst'
    'nodejs'
)
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://atrustcdn.sangfor.com/standard/linux/${pkgver}/uos/amd64/${_pkgname}Installer_amd64.deb"
    "bsod_checker.js"
    "atrust-launcher.sh"
    "atrust-loginctl"
    "atrust-daemon-path.conf"
    "atrust-daemon-shutdown.conf"
)
sha256sums=('aa8ba93532ae250dcab3d75d3b103fb01a93b97b49cbc6d9066c5ed1f70b75a6'
            'ae82a7e0575d2ed8778134fc7d5c9c85001c955a7d26710a13101ff2363c53e6'
            'c6f3e5b6da549ec3ad85f6721f72d058f94672b53e6e869dca27e8b8e6ff008b'
            'cceabc37c7ac5dcc1e0683478f0ee10b7dd5fe273f3ddb2a2797c31a7e04895c'
            'fe46dc7552321cdc01ccf90ca3acca81a155be51e8b487dfaa5cf984e2675412'
            'ad0df6c189c831a189c415db0e968f297b2bdaa43176bc665a4f051a0f0e0b64')

prepare() {
    # makepkg 已自动解开 deb, 此处解出 data 包
    bsdtar -xf data.tar.xz

    # 剔除与系统库冲突的自带库
    rm -f \
        "usr/share/sangfor/${_pkgname}/resources/lib/libstdc++.so.6" \
        "usr/share/sangfor/${_pkgname}/resources/lib/libqxcb.so" \
        "usr/share/sangfor/${_pkgname}/resources/lib/libxcb.so.1" \
        "usr/share/sangfor/${_pkgname}/resources/lib/libxcb-xinerama.so.0" \
        "usr/share/sangfor/${_pkgname}/uem/lib/libstdc++.so.6"

    # 覆盖 nodejs 兼容性修复脚本
    install -Dm644 "${srcdir}/bsod_checker.js" \
        "usr/share/sangfor/${_pkgname}/resources/app/src/service/bsod_checker.js"

    # 桌面入口指向启动器
    sed -i -e 's|^Exec=.*|Exec=atrust|' -e 's|^Icon=.*|Icon=aTrust|' \
        "usr/share/applications/cn.com.sangfor.atrust.desktop"
}

package() {
    # 主程序树 (agent 的路径白名单硬编码要求位于 /usr/share/sangfor)
    install -d "${pkgdir}/usr/share"
    cp -Pr --no-preserve=ownership "usr/share/sangfor" "${pkgdir}/usr/share/"

    # 启动器
    install -Dm755 "${srcdir}/atrust-launcher.sh" "${pkgdir}/usr/bin/atrust"

    # systemd 单元 (守护进程运行的正解环境)
    install -d "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 usr/lib/systemd/system/*.service -t "${pkgdir}/usr/lib/systemd/system/"
    if [ -d usr/lib/systemd/user ] && ls usr/lib/systemd/user/*.service >/dev/null 2>&1; then
        install -d "${pkgdir}/usr/lib/systemd/user"
        install -Dm644 usr/lib/systemd/user/*.service -t "${pkgdir}/usr/lib/systemd/user/"
    fi

    # 图标与桌面文件
    install -Dm644 "usr/share/pixmaps/${_pkgname}.png" \
        "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "usr/share/applications/cn.com.sangfor.atrust.desktop" \
        "${pkgdir}/usr/share/applications/cn.com.sangfor.atrust.desktop"

    # 兼容层: 非 display-manager 桌面(如 xinit/startx, logind 会话 Type=tty)
    # 会导致 agent 的登录用户检测失败、核心服务不启动。
    # 包装器把 show-session 的 Type=tty 改写为 Type=x11, 经 drop-in 注入 PATH。
    install -Dm755 "${srcdir}/atrust-loginctl" "${pkgdir}/usr/lib/sangfor-atrust/loginctl"
    install -Dm644 "${srcdir}/atrust-daemon-path.conf" \
        "${pkgdir}/etc/systemd/system/aTrustDaemon.service.d/path.conf"
    # 关机卡住修复: KillMode=process 导致子进程残留, 拖住 /home /tmp 卸载
    install -Dm644 "${srcdir}/atrust-daemon-shutdown.conf" \
        "${pkgdir}/etc/systemd/system/aTrustDaemon.service.d/shutdown.conf"
}
