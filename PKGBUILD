# Maintainer: bootloader <bootloader@localhost>
# Upstream download page: https://enterprise.todesk.com/download
# 上游只发 rpm/deb，本包解 deb 转打包。主控端见 todesk-enterprise-client-bin。

pkgname=todesk-enterprise-host-bin
pkgver=3.2.0.0
pkgrel=1
pkgdesc="ToDesk Enterprise Host (controlled endpoint) - remote control, enterprise edition"
arch=('x86_64')
url="https://enterprise.todesk.com"
license=('LicenseRef-Proprietary')
depends=('gtk3' 'kmod' 'nss' 'xcb-util' 'xcb-util-keysyms')
options=('!strip' 'emptydirs')
source=("ToDesk_Host_${pkgver}_amd64.deb::https://dl.todesk.com/tob/linux/ToDesk_Host_${pkgver}_amd64.deb")
sha256sums=('658aaa3275cf737bde10576181c181f1a7a6c3091aa3706ca38632540832a455')
install="${pkgname}.install"

# 注意：dl.todesk.com 有腾讯 EdgeOne 反爬（按 TLS/HTTP2 指纹拦 curl，UA 无关），
# 默认 DLAGENTS 会拿到几 KB 的 JS 挑战页（HTTP 200，sha256 校验才会失败）。
# 实测 --http1.1（降 HTTP/1.1 绕开指纹检测）+ 浏览器 UA 可稳定直取真实文件。
DLAGENTS=('https::/usr/bin/curl -gqfL --http1.1 -A "Mozilla/5.0" --retry 3 --retry-delay 3 -o %o %u')

package() {
    cd "${srcdir}"

    # data.tar.zst contains /opt/todesk_host, /etc and /usr entries.
    bsdtar --no-same-owner -xf data.tar.zst -C "${pkgdir}"

    # Arch 惯例：/usr/local/bin 启动器移到 /usr/bin
    install -Dm755 "${pkgdir}/usr/local/bin/todesk_host" "${pkgdir}/usr/bin/todesk_host"
    rm -r "${pkgdir}/usr/local"
    install -dm755 "${pkgdir}/opt/todesk_host/config"

    # systemd 单元照装，但不 enable（Arch 惯例交给用户：
    #   sudo systemctl enable --now todesk_host.service）
    # deb 的 postinst 会自动 enable，不照抄。
    # 单元以 root 运行 /opt/todesk_host/bin/ToDesk_Host_Service。
    # res/20-todesk.conf 是 X11 intel 驱动虚拟显示器配置（本包未装到 xorg.conf.d，
    # 需要虚拟屏时用户自行拷贝到 /etc/X11/xorg.conf.d/）。
}
