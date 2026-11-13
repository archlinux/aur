# Maintainer: logan_reed <liulingzhang.work@icloud.com>

pkgname=orca-ide
pkgver=1.4.258
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
source_x86_64=("https://github.com/stablyai/orca/releases/download/v1.4.258/orca-ide_1.4.258_amd64.deb")
source_aarch64=("https://github.com/stablyai/orca/releases/download/v1.4.258/orca-ide_1.4.258_arm64.deb")
b2sums=('fdce4a5f4313d37ca3f4a68dc9c31a242cd7f0fb7eae5a9764b9ca79b9316d328d2374154443338f9addc9134490c95fd1973c79c307d5f228f0f37dd6e3fa45')
b2sums_x86_64=('9556c5eb54deba8247d7d232e7081c2bd36f0ef6af25a1eeb023652677d96dfea20405ac97faabae2d4a485a5a1cae7a190cfa876ba46cb021bd0657e1afefb1')
b2sums_aarch64=('12f9948c1674f33e3e39d9571ab8a2fdaab299948fcb354dc39bda3c9e12a171e208f4c9fcbc06624b34f6da4c78273d06338ed7685ae69fa0f8dc31d28880fc')

package() {
    bsdtar --no-same-owner -xf data.tar.xz -C "${pkgdir}/"

    # 上游 postinst 为无 unprivileged user namespace 的主机设置 SUID
    chmod 4755 "${pkgdir}/opt/Orca/chrome-sandbox"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/Orca/resources/bin/orca-ide" "${pkgdir}/usr/bin/orca-ide"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    rm -rf "${pkgdir}/usr/share/doc"
}
