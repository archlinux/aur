# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
# 上游从 tar.gz(脚本启动器)换为 linuxdeploy AppImage(Wails v3 GUI):
# - GUI 继续使用原始 AppImage；headless 后端从同一上游映像中解出并安装
# - 提权内置(pkexec/polkit/sudo transient daemon),无需旧版 launcher hack
# - GUI 运行时依赖 fuse2；headless 使用已打包的 CLI/Caddy/规则库
pkgname=steamcommunity302
pkgver=15.0.7
pkgrel=7
#epoch=
pkgdesc="羽翼城制作的Steam、Github等反代加速工具,使用s302命令启动"
url="https://www.dogfight360.com/blog/18682/"
arch=('x86_64' 'aarch64')
license=('CC-BY-NC-4.0')
# nss 提供 certutil，libnetfilter_queue 用于 DNS 重定向；python 是 s302
# 管理命令解析 JSON/INI 的直接依赖。headless 初始化可使用 pkexec 或 sudo。
depends=('fuse2' 'nss' 'libnetfilter_queue' 'polkit' 'python')
optdepends=(
  # Netfilter/DNS 重定向后端(程序提示至少安装一种)
  'iptables: Netfilter backend for DNS redirection'
  'nftables: Netfilter backend for DNS redirection'
  'firewalld: Netfilter backend for DNS redirection'
  'ufw: Netfilter backend for DNS redirection'
  'sudo: CLI privilege elevation for management commands'
)
source=('s302')
source_x86_64=(
  "steamcommunity302-${pkgver}.AppImage::https://www.dogfight360.com/Usbeam/V15/Steamcommunity_302_${pkgver}_Linux_WebKit_x64.AppImage"
)
source_aarch64=(
  "steamcommunity302-${pkgver}.AppImage::https://www.dogfight360.com/Usbeam/V15/Steamcommunity_302_${pkgver}_Linux_WebKit_arm64.AppImage"
)
sha256sums=('4ef0cef466426f5472f503f14c9762c5d512a2ab4296d0734a3d438774ce5fe8')
sha256sums_x86_64=('e17ee108e97c10f4003367e8196cb7f7bec3a30a1da211d063acaf9faa4b7c26')
sha256sums_aarch64=('64e9044dffccd8fa164d17ba4a6ea0e77dc6a0550e81634c0fe5dcbf65001458')
options=(!strip)
install=steamcommunity302.install

_install_dir="/opt/steamcommunity302"
prepare() {
  local _appimage="${srcdir}/steamcommunity302-${pkgver}.AppImage"

  rm -rf "${srcdir}/squashfs-root"
  chmod 755 "${_appimage}"
  (
    cd "${srcdir}"
    "${_appimage}" --appimage-extract
  )
}


package() {
  # 本包只装 AppImage 本体与控制命令;菜单项/图标**完全采用程序自己生成的文件**
  # (首次运行 's302' 时由程序写入 ~/.local/share/applications/Steamcommunity_302.desktop
  # 与 ~/.local/share/icons/hicolor/512x512/apps/com.dogfight360.steamcommunity302.png,
  # 且每次启动幂等重写)。包再装一份自己的 desktop/图标必然与它并存或互相覆盖:
  # 用不同 ID 会在菜单里多出两个同名条目,用同 ID 又会随程序更新而过期。
  # 旧版本(≤15.0.5-2)装到系统目录的 desktop/图标由 steamcommunity302.install 清理。
  install -Dm755 "${srcdir}/steamcommunity302-${pkgver}.AppImage" \
    "${pkgdir}${_install_dir}/steamcommunity302.AppImage"

  # The upstream GUI initializes this CLI through pkexec. Package its complete
  # trusted payload so `s302 init` also works without a graphics session or a
  # runtime FUSE mount.
  local _headless_dir="${pkgdir}/usr/lib/${pkgname}"
  install -Dm755 "${srcdir}/squashfs-root/usr/bin/steamcommunity_302.cli" \
    "${_headless_dir}/steamcommunity_302.cli"
  install -Dm755 "${srcdir}/squashfs-root/usr/bin/steamcommunity_302.caddy" \
    "${_headless_dir}/steamcommunity_302.caddy"
  install -Dm755 "${srcdir}/squashfs-root/usr/bin/s302-service-installer" \
    "${_headless_dir}/s302-service-installer"
  install -Dm755 "${srcdir}/squashfs-root/usr/bin/iframe_api" \
    "${_headless_dir}/iframe_api"
  install -Dm644 "${srcdir}/squashfs-root/usr/bin/iframe_api.js" \
    "${_headless_dir}/iframe_api.js"
  install -Dm644 "${srcdir}/squashfs-root/usr/bin/S302_rules.ini" \
    "${_headless_dir}/S302_rules.ini"
  install -Dm644 "${srcdir}/squashfs-root/usr/bin/s302-service-manifest.json" \
    "${_headless_dir}/s302-service-manifest.json"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/steamcommunity_302.cli" \
    "${pkgdir}/usr/bin/steamcommunity302-cli"

  # s302 控制命令:无参/ui 开 GUI(exec AppImage),管理命令走 systemd+config
  install -Dm755 "${srcdir}/s302" "${pkgdir}/usr/bin/s302"
}
