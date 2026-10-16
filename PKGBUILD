# Maintainer: lyj <lyj404@gmail.com>
pkgname=bettbox-bin
pkgver=1.19.6
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
        "99-bettbox.rules"
        "bettbox.install")
source_x86_64=("https://github.com/appshubcc/Bettbox/releases/download/v${pkgver}/Bettbox-${pkgver}-linux-amd64.deb")
source_aarch64=("https://github.com/appshubcc/Bettbox/releases/download/v${pkgver}/Bettbox-${pkgver}-linux-arm64.deb")
sha256sums=('9d8b0a54499c9325ed64d987184a229af75c34600ca28afd016dff43ebb53cd0'
            'f1a21fce8675e6bd03565f56d21954e9c13991426bdc38368cd1b85f6893a593'
            'ba5165cd9c2fa422507323c1942bea73c001613fb5b4ffeb0d41c5c451709810')
sha256sums_x86_64=('910a65453650037f000fac81f50ac92053103adcfdd6339adf3c6cee9eaf51ba')
sha256sums_aarch64=('7b2a0c2ac4120ff998a90dbdfa7b9cd7f7aac6dc5b3212c1071505667007da6e')

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

  # polkit 规则作为包内容交付：从 v1.19.5 起 TUN 的 DNS 授权依赖它。
  # 不能沿用上游 deb 的做法（postinstall 向 rules.d 写文件）——该文件不进包清单，
  # 属"无主"文件，pacman -Qkk 等校验不可见，卸载/校验失败时还会残留一条免密规则。
  # 上游已提交 PR https://github.com/appshubcc/Bettbox/pull/539 改为随包交付规则（连带收窄
  # 放行范围），合入后将从 deb 内直接取出该规则，本文件可移除
  install -Dm644 "${srcdir}/99-bettbox.rules" \
    "${pkgdir}/usr/share/polkit-1/rules.d/99-bettbox.rules"
}
