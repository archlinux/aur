# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
pkgname=steamcommunity302
pkgver=14.0.02
pkgdate=2026/02
pkgrel=4
#epoch=
pkgdesc="羽翼城制作的Steam、Github等反代加速工具,使用s302命令启动"
url="https://www.dogfight360.com/blog/18682/"
arch=('x86_64' 'aarch64')
license=('CC-BY-NC-4.0')
optdepends=(
  # 图形化提权（任选其一）
  'zenity: graphical password prompt — GTK alternative'
  'kdialog: graphical password prompt — KDE alternative'
  'polkit: pkexec graphical privilege elevation — alternative to zenity/kdialog'

  # 终端回退（任选其一）
  'gnome-terminal: terminal fallback — GNOME'
  'konsole: terminal fallback — KDE Plasma'
  'xfce4-terminal: terminal fallback — XFCE'
  'mate-terminal: terminal fallback — MATE'
  'lxterminal: terminal fallback — LXDE'
  'xterm: terminal fallback — minimal / universal'

  # Netfilter/DNS 重定向后端（任选其一）
  'iptables: Netfilter backend for DNS redirection'
  'nftables: Netfilter backend for DNS redirection'
  'firewalld: Netfilter backend for DNS redirection'
  'ufw: Netfilter backend for DNS redirection'
)
depends=('nss' 'libnetfilter_queue' 'gtk3' 'glibc' 'gcc-libs' 'zlib' 'sudo' 'xorg-xhost')
source_x86_64=(
  "https://www.dogfight360.com/blog/wp-content/uploads/${pkgdate}/steamcommunity_302_Linux_AMD64_V${pkgver}.tar.gz"
)
source_aarch64=(
  "https://www.dogfight360.com/blog/wp-content/uploads/${pkgdate}/steamcommunity_302_Linux_ARM64_V${pkgver}.tar.gz"
)
md5sums_x86_64=('4b9994102b2256ca5fdf2e806a2c7035')
md5sums_aarch64=('6b19edfc3a24c1b43024bb569da9cf5e')
options=(!strip)

_install_dir="/opt/steamcommunity302"

prepare() {
  local _root="${srcdir}/Steamcommunity_302"
  local _launcher="${_root}/.launcher/launcher_启动器.sh"
  local _setup="${_root}/.launcher/setup_desktop_生成桌面快捷方式.sh"
  local _icon="${_root}/.launcher/302_icon.ico"
  local _main="${_root}/Steamcommunity_302"

  # 校验关键文件存在(结构变更立即报错)
  for f in "${_launcher}" "${_setup}" "${_icon}" "${_main}"; do
    [ -e "$f" ] || { msg2 "ERROR: 上游缺失关键文件: $f"; return 1; }
  done

  # 校验 launcher 路径计算模式仍命中(模式失效时人工介入,避免静默坏包)
  if ! grep -q 'LAUNCHER_DIR=.*dirname.*\$0' "${_launcher}"; then
    msg2 "ERROR: 上游 launcher 路径计算方式已变,请同步更新 sed 规则"
    return 1
  fi

  # --- 1. 派生 s302 ---
  # 把上游 launcher 的动态路径探测替换为硬编码,保留所有提权逻辑
  sed -E \
    -e 's|^[[:space:]]*LAUNCHER_DIR=.*|LAUNCHER_DIR="'"${_install_dir}"'/.launcher"|' \
    -e 's|^[[:space:]]*SCRIPT_DIR=.*|SCRIPT_DIR="'"${_install_dir}"'"|' \
    "${_launcher}" > "${srcdir}/s302"
  chmod +x "${srcdir}/s302"

  # --- 2. 派生 .desktop ---
  # 执行上游脚本生成 .desktop(复用其字段内容),再修正 Exec/Icon 路径
  local _setup_out
  if ! _setup_out=$(bash "${_setup}" 2>&1); then
    msg2 "ERROR: 上游 setup_desktop 执行失败:"
    msg2 "$_setup_out"
    return 1
  fi

  local _src_desktop="${_root}/Steamcommunity_302.desktop"
  [ -f "${_src_desktop}" ] || { msg2 "ERROR: 上游未生成 .desktop"; return 1; }

  sed -E \
    -e 's|^[[:space:]]*Exec=.*|Exec=/usr/bin/s302|' \
    -e 's|^[[:space:]]*Icon=.*|Icon=/usr/share/pixmaps/steamcommunity302.ico|' \
    "${_src_desktop}" > "${srcdir}/steamcommunity302.desktop"
  rm -f "${_src_desktop}"

  # --- 3. 派生图标(复用上游 .ico) ---
  cp "${_icon}" "${srcdir}/steamcommunity302.ico"

  # --- 4. 在 prepare 中统一设置权限(避开 fakeroot 中 file 命令崩溃) ---
  find "$_root" -type f -print0 | while IFS= read -r -d '' f; do
    local ft=$(file -b "$f" 2>/dev/null)
    if echo "$ft" | grep -q 'ELF.*\(executable\|shared object\)'; then
      chmod 755 "$f"
    elif echo "$ft" | grep -q 'shell script'; then
      chmod 755 "$f"
    else
      chmod 644 "$f"
    fi
  done
}

package() {
  local _src="${srcdir}/Steamcommunity_302"
  local _f _rel _dst

  # 递归安装所有文件
  # 权限由 prepare() 中 file 检测后 chmod 设置,此处用 -x 判断即可(避开 fakeroot 中 file 崩溃)
  while IFS= read -r -d '' _f; do
    _rel="${_f#${_src}/}"

    # 跳过已有派生版本替代或无需保留的文件和脚本
    case "$_rel" in
      ".launcher/302_icon.ico"            ) continue ;;
      ".launcher/launcher_启动器.sh"      ) continue ;;
      ".launcher/setup_desktop_生成桌面快捷方式.sh" ) continue ;;
      "Steamcommunity_302.desktop"        ) continue ;;
      "run_运行.sh"                       ) continue ;;
    esac

    _dst="${pkgdir}${_install_dir}/${_rel}"
    if [ -x "$_f" ]; then
      install -Dm755 "$_f" "$_dst"
    else
      install -Dm644 "$_f" "$_dst"
    fi
  done < <(find "$_src" -type f -print0)

  # 安装派生文件
  install -Dm755 "${srcdir}/s302" "${pkgdir}/usr/bin/s302"
  install -Dm644 "${srcdir}/steamcommunity302.ico" \
    "${pkgdir}/usr/share/pixmaps/steamcommunity302.ico"
  install -Dm644 "${srcdir}/steamcommunity302.desktop" \
    "${pkgdir}/usr/share/applications/steamcommunity302.desktop"
}
