# Maintainer: lyj <lyj404@gmail.com>
pkgname=bettbox-bin
pkgver=null
pkgrel=1
pkgdesc="基于 Mihomo（Clash.Meta 内核）的多平台代理客户端"
arch=('x86_64' 'aarch64')
url="https://github.com/lyj404/bettbox-aur"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libkeybinder3'
)
options=('!strip' '!debug')
source_x86_64=("https://github.com/appshubcc/Bettbox/releases/download/v${pkgver}/Bettbox-${pkgver}-linux-amd64.deb")
source_aarch64=("https://github.com/appshubcc/Bettbox/releases/download/v${pkgver}/Bettbox-${pkgver}-linux-arm64.deb")
sha256sums_x86_64=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')
sha256sums_aarch64=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

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
}
