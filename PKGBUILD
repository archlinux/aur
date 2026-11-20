# Maintainer: logan_reed <liulingzhang.work@icloud.com>

pkgname=orca-ide
pkgver=1.4.266
pkgrel=1
pkgdesc="Next-gen IDE for parallel agentic development"
arch=('x86_64' 'aarch64')
url="https://github.com/stablyai/orca"
license=('MIT')
# 同一上游的 AUR 包（deb / rpm / AppImage / 源码构建），全部互斥
conflicts=('orca-ide-bin' 'onorca-bin' 'stably-orca' 'stably-orca-bin' 'stably-orca-git')
# 上游 deb 的 Depends/Recommends 映射；headless 模式（orca serve）依赖 python 与虚拟显示栈
depends=('alsa-lib' 'at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst'
         'mesa' 'nss' 'python' 'python-gobject' 'util-linux-libs' 'xdg-utils'
         'xclip' 'xdotool' 'xorg-server-xvfb')
optdepends=('libappindicator-gtk3: system tray indicator support')
options=('!strip' '!debug')

# source 写完整字面 URL：updater 遇到含 shell 变量的 URL 会跳过更新
# （pkgbuild_editor._update_source_field），用 ${pkgver} 模板会让
# update_source_url 静默失效。上游文件名已含版本号，SRCDEST 不会命中
# 旧缓存，故不需要 :: 别名。
# LICENSE 走 main 而非 v${pkgver}：deb 不含上游 MIT 全文，旧 tag 删除会断构建
source=("LICENSE::https://raw.githubusercontent.com/stablyai/orca/main/LICENSE")
source_x86_64=("https://github.com/stablyai/orca/releases/download/v1.4.266/orca-ide_1.4.266_amd64.deb")
source_aarch64=("https://github.com/stablyai/orca/releases/download/v1.4.266/orca-ide_1.4.266_arm64.deb")
b2sums=('fdce4a5f4313d37ca3f4a68dc9c31a242cd7f0fb7eae5a9764b9ca79b9316d328d2374154443338f9addc9134490c95fd1973c79c307d5f228f0f37dd6e3fa45')
b2sums_x86_64=('82fe543e9720e86e8c8c6ee71f6c9640a2ac345eb195ea6cc18a96a4c1981523180337940b8750d630d8b67b61fb63f52c435b58122c84a6ff8bfe18c672ee7f')
b2sums_aarch64=('349c177f15bc823942b4418996607d0a57435a671e62285468ed9494b89d94add7d0816c440b29caefb6f9fa88d1691461c087a95610e2148e8577599d06e7f6')

package() {
    bsdtar --no-same-owner -xf data.tar.xz -C "${pkgdir}/"

    # 上游 postinst 为无 unprivileged user namespace 的主机设置 SUID
    chmod 4755 "${pkgdir}/opt/Orca/chrome-sandbox"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/Orca/resources/bin/orca-ide" "${pkgdir}/usr/bin/orca-ide"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    rm -rf "${pkgdir}/usr/share/doc"
}
