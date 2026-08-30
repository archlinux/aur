# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
# 上游从 tar.gz(脚本启动器)换为 linuxdeploy AppImage(Wails v3 GUI):
# - 提权内置(pkexec/polkit/sudo transient daemon),无需旧版 launcher hack
# - 捆绑 198 个库(含 webkit2gtk/GTK3),运行时依赖 fuse2
# 打包采用 AUR 主流 AppImage 方式:本体装 /opt + /usr/bin wrapper(同 obsidian-appimage)
pkgname=steamcommunity302
pkgver=15.0.3
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
source_x86_64=(
  "steamcommunity302-${pkgver}.AppImage::https://www.dogfight360.com/Usbeam/V15/Steamcommunity_302_${pkgver}_Linux_WebKit_x64.AppImage"
)
source_aarch64=(
  "steamcommunity302-${pkgver}.AppImage::https://www.dogfight360.com/Usbeam/V15/Steamcommunity_302_${pkgver}_Linux_WebKit_arm64.AppImage"
)
md5sums_x86_64=('e6ea2e521811fc83bc682ce176006779')
md5sums_aarch64=('e6ea2e521811fc83bc682ce176006779')
options=(!strip)
install=steamcommunity302.install

_install_dir="/opt/steamcommunity302"

prepare() {
  # 解包 AppImage 提取 desktop 与图标(本体仍按 AppImage 安装)
  chmod +x "${srcdir}/steamcommunity302-${pkgver}.AppImage"
  "${srcdir}/steamcommunity302-${pkgver}.AppImage" --appimage-extract >/dev/null 2>&1
  local _root="${srcdir}/squashfs-root"

  # desktop:修正 Exec 指向系统 wrapper,Icon 用安装后的 png
  [ -f "${_root}/com.dogfight360.steamcommunity302.desktop" ] || { msg2 "ERROR: 上游缺失 desktop"; return 1; }
  sed -E \
    -e 's|^[[:space:]]*Exec=.*|Exec=/usr/bin/s302|' \
    -e 's|^[[:space:]]*Icon=.*|Icon=steamcommunity302|' \
    "${_root}/com.dogfight360.steamcommunity302.desktop" > "${srcdir}/steamcommunity302.desktop"

  # 图标(png)
  [ -f "${_root}/com.dogfight360.steamcommunity302.png" ] || { msg2 "ERROR: 上游缺失图标"; return 1; }
  cp "${_root}/com.dogfight360.steamcommunity302.png" "${srcdir}/steamcommunity302.png"
}

package() {
  # AppImage 本体(与旧版同目录,升级平滑)
  install -Dm755 "${srcdir}/steamcommunity302-${pkgver}.AppImage" \
    "${pkgdir}${_install_dir}/steamcommunity302.AppImage"

  # wrapper:exec AppImage(依赖 fuse2)
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/s302" <<'EOF'
#!/bin/bash
exec /opt/steamcommunity302/steamcommunity302.AppImage "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/s302"

  install -Dm644 "${srcdir}/steamcommunity302.desktop" \
    "${pkgdir}/usr/share/applications/steamcommunity302.desktop"
  install -Dm644 "${srcdir}/steamcommunity302.png" \
    "${pkgdir}/usr/share/pixmaps/steamcommunity302.png"
}
