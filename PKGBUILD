# Maintainer: lyj <lyj404@gmail.com>
pkgname=bettbox-bin
pkgver=1.19.7
pkgrel=1
pkgdesc="基于 Mihomo（Clash.Meta 内核）的多平台代理客户端"
arch=('x86_64' 'aarch64')
url="https://github.com/appshubcc/Bettbox"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libkeybinder3'
)
optdepends=('polkit: TUN 模式授权（配合 polkit 规则免密调用 resolvectl）')
options=('!strip' '!debug')
install=bettbox.install
source=("restart-bettbox.hook"
        "bettbox.install")
source_x86_64=("https://github.com/appshubcc/Bettbox/releases/download/v${pkgver}/Bettbox-${pkgver}-linux-amd64.deb")
source_aarch64=("https://github.com/appshubcc/Bettbox/releases/download/v${pkgver}/Bettbox-${pkgver}-linux-arm64.deb")
sha256sums=('9d8b0a54499c9325ed64d987184a229af75c34600ca28afd016dff43ebb53cd0'
            'ba5165cd9c2fa422507323c1942bea73c001613fb5b4ffeb0d41c5c451709810')
sha256sums_x86_64=('20a9297e8490263518a4629f5bd7a21384f2eeeb07dc4599a8ea99b356087d81')
sha256sums_aarch64=('ea7eaafc0ef4fd4944fcc429fada3f703ffac4aeeeafdafd74ed5ced8add61eb')

package() {
  bsdtar -xf data.tar.zst -C "${srcdir}"

  # 应用主体
  install -dm755 "${pkgdir}/usr/share/Bettbox"
  cp -a "${srcdir}/usr/share/Bettbox/"* "${pkgdir}/usr/share/Bettbox/"

  # 创建 /usr/bin 符号链接
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/share/Bettbox/Bettbox "${pkgdir}/usr/bin/Bettbox"

  # 桌面快捷方式（v1.19.5 起上游 desktop 已自带 StartupWMClass）
  install -Dm644 "${srcdir}/usr/share/applications/Bettbox.desktop" \
    "${pkgdir}/usr/share/applications/Bettbox.desktop"

  # 图标（确保尺寸正确）
  for size in 128 256; do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}x${size}/apps/Bettbox.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/Bettbox.png"
  done

  # pacman hook: 升级后自动重启 bettbox
  install -Dm644 -t "${pkgdir}/usr/share/libalpm/hooks/" "${srcdir}/restart-bettbox.hook"

  # TUN 的 DNS 授权规则：自 v1.19.6 起随上游 deb 交付（PR #539 已合入），
  # 规则收窄为仅放行实际用到的 4 个 org.freedesktop.resolve1.* action，
  # 直接从 deb 内取出安装，保证与上游包逐字节一致
  install -Dm644 "${srcdir}/usr/share/polkit-1/rules.d/90-bettbox.rules" \
    "${pkgdir}/usr/share/polkit-1/rules.d/90-bettbox.rules"
}
