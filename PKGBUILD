# Maintainer: YageGeng <icoderdev@outlook.com>
# 使用官网域名对应的名称，区分 AUR 上另一个曾叫 runner-bin 的项目。
pkgname=runnersh-bin
pkgver=0.20.4
pkgrel=1
pkgdesc='Local desktop cockpit for CLI coding agents'
arch=('x86_64' 'aarch64')
url='https://github.com/yicheng47/runner'
license=('MIT' 'Apache-2.0')
depends=(
  'fontconfig' 'freetype2' 'glibc>=2.35' 'hicolor-icon-theme' 'libgcc' 'libglvnd'
  'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-driver' 'vulkan-icd-loader'
  'wayland' 'xcb-util-cursor' 'xdg-utils'
)
optdepends=(
  'git: repository status, diffs and worktree support'
  'noto-fonts-cjk: Chinese, Japanese and Korean font coverage'
  'xdg-desktop-portal: desktop integration for file dialogs'
)
provides=("runnersh=$pkgver")
# 本地旧包 runner-bin 安装相同路径，迁移时由 pacman 处理冲突。
conflicts=('runnersh' 'runner-bin')
# 保留上游预编译的二进制文件，避免再次剥离符号或生成调试包。
options=('!strip' '!debug')
source=("runner-$pkgver-LICENSE::https://raw.githubusercontent.com/yicheng47/runner/v$pkgver/LICENSE")
source_x86_64=("$url/releases/download/v$pkgver/Runner_${pkgver}_linux-x64.deb")
source_aarch64=("$url/releases/download/v$pkgver/Runner_${pkgver}_linux-arm64.deb")
sha256sums=('9cd05f17e4eb355ec72bcc88306c54e0e0d19a9d701fe38ddb02604f0ea68af7')
sha256sums_x86_64=('fd0d36a7107ec2f32e74a4b71459811565625b9fd1099cae23c66701beecf692')
sha256sums_aarch64=('de5770d9eb1480c885b46fd554a9f58a778cacee809b2cb3c4942fb7fc1d3600')

# 安装官方载荷及许可证，并将命令入口交给 pacman 管理。
package() {
  # 避免在 fakeroot 中尝试恢复 Debian 文件所有权，由 makepkg 统一记录。
  bsdtar --no-same-owner -xf "$srcdir/data.tar.zst" -C "$pkgdir"

  # 这些链接原由 Debian 的 postinst 创建，桌面入口也依赖 runner-app。
  install -d "$pkgdir/usr/bin"
  ln -s ../lib/runner/runner-agent-cli "$pkgdir/usr/bin/runner"
  ln -s ../lib/runner/runnerd "$pkgdir/usr/bin/runnerd"
  ln -s ../lib/runner/Runner "$pkgdir/usr/bin/runner-app"

  # 省略上游自安装脚本和标记，应用更新由 pacman 接管。
  rm -f "$pkgdir/usr/lib/runner/install.sh" "$pkgdir/usr/lib/runner/install-layout-v1"
  install -Dm644 "$srcdir/runner-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv "$pkgdir/usr/lib/runner/LICENSE.themes" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.themes"
}
