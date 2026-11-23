# Maintainer: illusory <becomeillusory@gmail.com>
# 自用维护：CrossDesk 跨平台远程桌面（GPL-3.0-only），上游 kunkundi/crossdesk。
#   上游只发布 Ubuntu 20.04+ 的 .deb（amd64 / arm64），本包直接重打包官方产物。
#   布局刻意保持 deb 原样（二进制在 /usr/lib/crossdesk/，/usr/bin/crossdesk 是包装脚本）：
#   上游自更新器把 /usr/lib/crossdesk/crossdesk-bin 写死在 SupportedInstallation 里，
#   挪走会让它判定为"便携版"。它另需 /usr/bin/apt-get，Arch 上不存在，
#   因此更新按钮只会提示手动更新，不会执行任何安装动作 —— 预期行为，不是缺陷。
#   source 走 GitHub 加速镜像（大陆直连慢，镜像由 lib/common.sh 优选）。
pkgname=crossdesk-private-bin
_pkgname=crossdesk
_upstream=kunkundi/crossdesk
# 上游 tag 形如 v1.7.6-20261112：pkgver 去掉 v 并把连字符换成点，
# 日期进版本号是为了让同版本号的重发（只改日期）能被 ver_cmp 检出。
_tag=v1.7.6-20261112
pkgver=1.7.6.20261112
pkgrel=2
pkgdesc='自用维护：跨平台远程桌面（支持 Wayland portal 采集），上游 kunkundi/crossdesk'
arch=('x86_64' 'aarch64')
url="https://github.com/${_upstream}"
# GitHub 下载加速镜像；换镜像可 makepkg GH_MIRROR=https://另一镜像/
_gh_mirror="${GH_MIRROR:-https://gh-proxy.com/}"
_gh_mirror="${_gh_mirror%/}/"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'libx11' 'libxext' 'libxrender' 'libxft' 'libxrandr'
         'libxfixes' 'libxcursor' 'libxi' 'libxcb' 'libxv' 'libxtst'
         'alsa-lib' 'sndio' 'libpulse' 'libdrm' 'dbus' 'libglvnd')
# 均为 dlopen 加载：缺了对应功能不可用，但程序照常启动。
optdepends=('gtk3: 系统托盘与文件选择对话框'
            'libayatana-appindicator: 托盘图标（AppIndicator）'
            'pipewire: Wayland 会话画面采集（端口门户 ScreenCast）'
            'xdg-desktop-portal: Wayland 采集与远程键鼠授权'
            'libxkbcommon: 键盘布局映射'
            'wayland: 原生 Wayland 支持'
            'systemd-libs: 会话/电源相关集成'
            'libxss: 空闲检测'
            'vulkan-icd-loader: Vulkan 渲染后端'
            'nvidia-utils: NVIDIA 硬件编解码（NVENC/NVDEC）')
makedepends=('binutils')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" 'crossdesk-bin')
options=('!strip')
source_x86_64=("${_pkgname}-${pkgver}.deb::${_gh_mirror}https://github.com/${_upstream}/releases/download/${_tag}/crossdesk-linux-amd64-${_tag}.deb")
source_aarch64=("${_pkgname}-${pkgver}.deb::${_gh_mirror}https://github.com/${_upstream}/releases/download/${_tag}/crossdesk-linux-arm64-${_tag}.deb")
sha256sums_x86_64=('e11fcbc21dce1f6bb1770cd6dcf975a1d4561202863936349580aafcdaa52cc2')
sha256sums_aarch64=('b1def37b08dfbb26f29919a211f07765a7ccc0f125b6cb244825731688e2fb52')

package() {
  local _deb="${srcdir}/${_pkgname}-${pkgver}.deb"
  local _extract="${srcdir}/deb-root"
  rm -rf "$_extract"; mkdir -p "$_extract"

  # deb 是 ar 归档，控制/数据段可能是 xz/zst/gz，按实际存在的解。
  ( cd "$_extract" && ar x "$_deb" )
  local data
  for data in data.tar.xz data.tar.zst data.tar.gz; do
    if [[ -f "$_extract/$data" ]] && tar -xf "$_extract/$data" -C "$_extract"; then
      break
    fi
  done

  # 一律照搬 deb 布局：usr/lib/crossdesk 下含 crossdesk-bin / crossdesk_updater
  # / libslint_cpp.so，程序靠 /usr/bin/crossdesk 设 LD_LIBRARY_PATH 后 exec。
  install -d "${pkgdir}/usr/lib/crossdesk" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"
  cp -a "$_extract/usr/lib/crossdesk/." "${pkgdir}/usr/lib/crossdesk/"
  install -Dm755 "$_extract/usr/bin/crossdesk" "${pkgdir}/usr/bin/crossdesk"
  # deb 里 /usr/bin/CrossDesk 是指向 crossdesk 的符号链接，一并保留便于命令补全
  ln -sf crossdesk "${pkgdir}/usr/bin/CrossDesk"

  install -Dm644 "$_extract/usr/share/applications/crossdesk.desktop" \
    "${pkgdir}/usr/share/applications/crossdesk.desktop"
  install -Dm644 "$_extract/usr/share/applications/crossdesk-remote-control.desktop" \
    "${pkgdir}/usr/share/applications/crossdesk-remote-control.desktop"

  # 图标已按 hicolor 各尺寸提供，整体复制
  cp -a "$_extract/usr/share/icons/." "${pkgdir}/usr/share/icons/"

  # 许可证：上游 GPL-3.0-only 全文不在 deb 内，按惯例只记声明
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  printf '%s\n' 'CrossDesk is licensed under the GNU General Public License v3.0 only.' \
    'Source: https://github.com/kunkundi/crossdesk (SPDX-License-Identifier: GPL-3.0-only)' \
    > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}