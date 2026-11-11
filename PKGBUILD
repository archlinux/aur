# Maintainer: carlos <carlos.quin.node47@gmail.com>
# Upstream: https://github.com/s1dashu/quiet-md
# 解包官方 AppImage，不编译

pkgname=quiet-md-bin
pkgver=0.1.10
pkgrel=1
pkgdesc='本地优先的富文本笔记，GPUI 绘制，兼容飞书 DocxXML（官方 AppImage 解包）'
arch=('x86_64')
url='https://quiet.md'
license=('MIT')
provides=('quiet-md')
conflicts=('quiet-md')

# 上游在 Ubuntu 22.04 上构建（glibc 2.35 基线），捆绑的是 libxkbcommon*、
# libxcb-xkb、libXau、libXdmcp、libbsd、libmd。装到系统后用 Arch 自己的库：
# 直接链接 libxcb、libxkbcommon、libxkbcommon-x11；dlopen 加载 libX11-xcb、
# libwayland-client、libvulkan（ldd 看不见）。libX11-xcb.so.1 在 libx11 里
# （Arch 没有 libx11-xcb 包），libx11 也带 libxkbcommon 要的 Compose 数据。
# Arch 的 glibc 提供 BSD 函数，libbsd/libmd 不需要。
depends=(
  'fontconfig'
  'hicolor-icon-theme'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-icd-loader'
  'wayland'
  'xdg-utils'
)
optdepends=(
  'noto-fonts: 界面字体（Noto Sans）'
  'noto-fonts-cjk: 中文界面和文档需要的 Noto Sans CJK'
  'xdg-desktop-portal: 打开、保存文件时的选择框'
  'mesa: 硬件 Vulkan 驱动'
  'vulkan-swrast: 无硬件驱动时的软件 Vulkan（虚拟机）'
)
makedepends=('imagemagick')

source=("quiet-md-$pkgver-x86_64.AppImage::https://github.com/s1dashu/quiet-md/releases/download/v$pkgver/quiet-md-$pkgver-x86_64.AppImage")
sha256sums=('1a22a35263aab27833c005cb6bd4b39ace8ed1eb1147530678c39056e4bbf771')

prepare() {
  chmod +x "$srcdir/quiet-md-$pkgver-x86_64.AppImage"
  APPIMAGE_EXTRACT_AND_RUN=1 "$srcdir/quiet-md-$pkgver-x86_64.AppImage" --appimage-extract
}

package() {
  cd "$srcdir/squashfs-root"
  install -Dm755 usr/bin/quiet_md "$pkgdir/usr/bin/quiet_md"

  # linuxdeploy 在 desktop 条目里加了 X-AppImage-Version，去掉后与上游一致
  sed '/^X-AppImage-Version=/d' com.s1dashu.quietmd.desktop > "$srcdir/com.s1dashu.quietmd.desktop"
  install -Dm644 "$srcdir/com.s1dashu.quietmd.desktop" \
    "$pkgdir/usr/share/applications/com.s1dashu.quietmd.desktop"

  for size in 48 64 128 256 512; do
    dir="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    mkdir -p "$dir"
    magick com.s1dashu.quietmd.png -resize "${size}x${size}" "$dir/com.s1dashu.quietmd.png"
  done

  install -Dm644 usr/share/doc/quiet-md/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 usr/share/doc/quiet-md/THIRD_PARTY.md \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY.md"

  # usr/lib 里捆绑的 Ubuntu 库和 usr/share/X11 不装，用系统的
}
