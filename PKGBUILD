# Maintainer: lyj <lyj404@gmail.com>
pkgname=bettbox-bin
pkgver=1.18.10
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
options=('!strip' '!debug')
source=("restart-bettbox.hook")
source_x86_64=("https://github.com/appshubcc/Bettbox/releases/download/v${pkgver}/Bettbox-${pkgver}-linux-amd64.deb")
source_aarch64=("https://github.com/appshubcc/Bettbox/releases/download/v${pkgver}/Bettbox-${pkgver}-linux-arm64.deb")
sha256sums=('9d8b0a54499c9325ed64d987184a229af75c34600ca28afd016dff43ebb53cd0')
sha256sums_x86_64=('93fbc095902e6cd5b7ae8a1cd4b91a0117afcad6bb781a51fbce113e44d4461e')
sha256sums_aarch64=('7e143ba4e32a258dd7ec2c19c5a0481e876e240afda56d13a99ff3244ccea36f')

package() {
  bsdtar -xf data.tar.zst -C "${srcdir}"

  # 应用主体
  install -dm755 "${pkgdir}/usr/share/Bettbox"
  cp -a "${srcdir}/usr/share/Bettbox/"* "${pkgdir}/usr/share/Bettbox/"

  # 创建 /usr/bin 符号链接
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/share/Bettbox/Bettbox "${pkgdir}/usr/bin/Bettbox"

  # 桌面快捷方式（添加 StartupWMClass 修复窗口图标）
  install -Dm644 "${srcdir}/usr/share/applications/Bettbox.desktop" \
    "${pkgdir}/usr/share/applications/Bettbox.desktop"
  sed -i '/^StartupNotify=true/a StartupWMClass=com.appshub.bettbox' \
    "${pkgdir}/usr/share/applications/Bettbox.desktop"

  # 图标（确保尺寸正确）
  for size in 128 256; do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}x${size}/apps/Bettbox.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/Bettbox.png"
  done

  # pacman hook: 升级后自动重启 bettbox
  install -Dm644 -t "${pkgdir}/usr/share/libalpm/hooks/" "${srcdir}/restart-bettbox.hook"
}
