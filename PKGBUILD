# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
# 上游从 tar.gz(脚本启动器)换为 linuxdeploy AppImage(Wails v3 GUI):
# - 提权内置(pkexec/polkit/sudo transient daemon),无需旧版 launcher hack
# - 捆绑 198 个库(含 webkit2gtk/GTK3),运行时依赖 fuse2
# 打包采用 AUR 主流 AppImage 方式:本体装 /opt + /usr/bin wrapper(同 obsidian-appimage)
pkgname=steamcommunity302
pkgver=15.0.6
pkgrel=1
#epoch=
pkgdesc="羽翼城制作的Steam、Github等反代加速工具,使用s302命令启动"
url="https://www.dogfight360.com/blog/18682/"
arch=('x86_64' 'aarch64')
license=('CC-BY-NC-4.0')
# nss 提供 certutil(证书导入),libnetfilter_queue 用于 DNS 重定向——
# 均为功能依赖,AppImage 捆绑库仅覆盖 GUI 层
depends=('fuse2' 'nss' 'libnetfilter_queue')
optdepends=(
  # Netfilter/DNS 重定向后端(程序提示至少安装一种)
  'iptables: Netfilter backend for DNS redirection'
  'nftables: Netfilter backend for DNS redirection'
  'firewalld: Netfilter backend for DNS redirection'
  'ufw: Netfilter backend for DNS redirection'
  # 新版内置提权(transient daemon),任选其一
  'polkit: pkexec graphical privilege elevation'
  'sudo: CLI privilege elevation'
)
source=('s302')
source_x86_64=(
  "steamcommunity302-${pkgver}.AppImage::https://www.dogfight360.com/Usbeam/V15/Steamcommunity_302_${pkgver}_Linux_WebKit_x64.AppImage"
)
source_aarch64=(
  "steamcommunity302-${pkgver}.AppImage::https://www.dogfight360.com/Usbeam/V15/Steamcommunity_302_${pkgver}_Linux_WebKit_arm64.AppImage"
)
md5sums=('4908d587f6a5e529412ca208c8203074')
md5sums_x86_64=('1ef764a3ee65a54b764a2e7dd6193b69')
md5sums_aarch64=('1ef764a3ee65a54b764a2e7dd6193b69')
options=(!strip)
install=steamcommunity302.install

_install_dir="/opt/steamcommunity302"

package() {
  # 本包只装 AppImage 本体与控制命令;菜单项/图标**完全采用程序自己生成的文件**
  # (首次运行 's302' 时由程序写入 ~/.local/share/applications/Steamcommunity_302.desktop
  # 与 ~/.local/share/icons/hicolor/512x512/apps/com.dogfight360.steamcommunity302.png,
  # 且每次启动幂等重写)。包再装一份自己的 desktop/图标必然与它并存或互相覆盖:
  # 用不同 ID 会在菜单里多出两个同名条目,用同 ID 又会随程序更新而过期。
  # 旧版本(≤15.0.5-2)装到系统目录的 desktop/图标由 steamcommunity302.install 清理。
  install -Dm755 "${srcdir}/steamcommunity302-${pkgver}.AppImage" \
    "${pkgdir}${_install_dir}/steamcommunity302.AppImage"

  # s302 控制命令:无参/ui 开 GUI(exec AppImage),管理命令走 systemd+config
  install -Dm755 "${srcdir}/s302" "${pkgdir}/usr/bin/s302"
}
