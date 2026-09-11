# Maintainer: chen-shuhan <2502820816@qq.com>
# 非官方社区打包 - 与上游 ASYS 科技无隶属关系，仅供 Arch 社区使用
pkgname=vantage-browser-bin
pkgver=153.2.0
pkgrel=1
pkgdesc="Vantage 浏览器 - 基于 Firefox ESR (预编译 deb 解包安装) - 非官方社区打包"
arch=('x86_64' 'aarch64')
url="https://github.com/asystech-chen/Vantage"
license=('MPL-2.0')
depends=(
  dbus
  alsa-lib
  at-spi2-core
  cairo
  ffmpeg
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  gtk3
  hicolor-icon-theme
  libpulse
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
optdepends=(
  'hunspell-dictionary: Spell checking'
  'libnotify: Notification integration'
)
provides=('vantage-browser')
conflicts=('vantage-browser' 'vantage-browser-appimage')
# 上游 deb 按架构区分，使用关联数组形式
source_x86_64=("https://github.com/asystech-chen/Vantage/releases/download/v${pkgver}-${pkgrel}/vantage_${pkgver}-${pkgrel}_amd64.deb")
source_aarch64=("https://github.com/asystech-chen/Vantage/releases/download/v${pkgver}-${pkgrel}/vantage_${pkgver}-${pkgrel}_arm64.deb")
sha256sums_x86_64=('09d737cbb640e5d574288b338444953ab0c0c26b1f5316b156a1e8ee9cff1afc')
sha256sums_aarch64=('4f8b7285215031e1ef0410c64f0ec1498071070541d6a613d00b5d2addbfff31')

package() {
  # deb 为 ar 归档，data.tar.xz 内含 /opt/vantage 等
  # 使用 bsdtar 自动解包（makepkg 已处理 source 解压至 srcdir，但 deb 需手动）
  cd "$srcdir"
  # makepkg 已将 deb 解压为 data.tar.xz 等，此处直接解包 data
  if [ -f data.tar.xz ]; then
    bsdtar -xf data.tar.xz -C "$pkgdir"
  elif [ -f data.tar.zst ]; then
    bsdtar -xf data.tar.zst -C "$pkgdir"
  else
    # 兼容 makepkg 未自动解 deb 的情况
    _deb=$(find . -name "*.deb" | head -1)
    if [ -n "$_deb" ]; then
      bsdtar -xf "$_deb" -C "$srcdir"
      bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir" 2>/dev/null || bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"
    fi
  fi

  # deb 默认安装到 /opt/vantage，创建 /usr/bin 链接
  mkdir -p "$pkgdir/usr/bin"
  if [ -x "$pkgdir/opt/vantage/vantage" ]; then
    ln -s /opt/vantage/vantage "$pkgdir/usr/bin/vantage"
  elif [ -x "$pkgdir/usr/lib/vantage/vantage" ]; then
    ln -s /usr/lib/vantage/vantage "$pkgdir/usr/bin/vantage"
  fi

  # 修正桌面文件 Exec 路径（若存在）
  if [ -f "$pkgdir/usr/share/applications/vantage.desktop" ]; then
    sed -i 's|Exec=.*|Exec=/usr/bin/vantage %u|' "$pkgdir/usr/share/applications/vantage.desktop"
  fi

  # 许可证
  if [ -f "$pkgdir/opt/vantage/LICENSE" ]; then
    install -Dm644 "$pkgdir/opt/vantage/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
