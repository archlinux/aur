# Maintainer: lingdianshiren <ldsrwu@foxmail.com>
pkgname=usbeam-hosts-editor
pkgver=5.0.1
_pkgdate=2026/01
pkgrel=3
pkgdesc="羽翼城制作的UsbEAm Hosts Editor,多平台hosts修改工具,使用uhe命令启动"
url="https://www.dogfight360.com/blog/18627/"
arch=('x86_64')
# 与同作者 steamcommunity302 一致
license=('CC-BY-NC-4.0')
optdepends=(
  'polkit: pkexec graphical privilege elevation (recommended)'
  'sudo: CLI privilege elevation fallback'
)
depends=(
  # self-contained .NET 单文件运行时 NEEDED
  'glibc' 'gcc-libs' 'zlib'
  # libSkiaSharp.so NEEDED
  'brotli' 'bzip2' 'expat' 'fontconfig' 'freetype2' 'libpng'
  # Avalonia X11 后端运行时 dlopen；xhost 在 root GUI 运行期间授权 X11
  'libx11' 'libxcursor' 'libxrandr' 'libxi' 'libxext' 'libice' 'libsm' 'libgl' 'xorg-xhost'
)
makedepends=('python')
source=("https://www.dogfight360.com/blog/wp-content/uploads/${_pkgdate}/UsbEAm_Hosts_Editor.${pkgver}_X64.tar.gz")
md5sums=('5da83cf0d86f4c99ba907ef8a9bffd69')
options=(!strip)

_install_dir="/usr/lib/usbeam-hosts-editor"

prepare() {
  local _root="${srcdir}/UsbEAm Hosts Editor"
  local _main="${_root}/UsbEAm Hosts Editor"

  # 校验关键文件存在(结构变更立即报错)
  for f in "${_main}" "${_root}/libSkiaSharp.so" "${_root}/libHarfBuzzSharp.so" "${_root}/ip2region.xdb"; do
    [ -e "$f" ] || { printf 'ERROR: 上游缺失关键文件: %s\n' "$f" >&2; return 1; }
  done

  # --- 1. 派生 uhe 启动器 ---
  # 上游 .sh 只支持终端 sudo -S；包提供的启动器改用 polkit 或 sudo
  # 的正常认证流程，绝不读取、缓存或管道传递用户密码。
  cat > "${srcdir}/uhe" << 'LAUNCHER_EOF'
#!/usr/bin/env bash
set -u

INSTALL_DIR="/usr/lib/usbeam-hosts-editor"
EXEC_FILE="${INSTALL_DIR}/UsbEAm Hosts Editor"
CURRENT_DISPLAY="${DISPLAY:-}"
CURRENT_XAUTHORITY="${XAUTHORITY:-${HOME}/.Xauthority}"

show_error() {
    printf '错误: %s\n' "$1" >&2
}

if [[ ! -x "$EXEC_FILE" ]]; then
    show_error "未找到主程序: $EXEC_FILE"
    exit 1
fi

# The program edits /etc/hosts. X11 rejects root even with the caller's
# XAUTHORITY in this Avalonia runtime, so grant local root access only while
# the elevated process runs and always revoke it on exit.
if [[ $EUID -eq 0 ]]; then
    exec "$EXEC_FILE"
fi

[[ -n "$CURRENT_DISPLAY" ]] || {
    show_error "未检测到图形会话；请在 X11 图形会话中启动 uhe。"
    exit 1
}
command -v xhost >/dev/null 2>&1 || {
    show_error "缺少 xhost；请安装 xorg-xhost。"
    exit 1
}

_xhost_granted=0
cleanup_xhost() {
    if (( _xhost_granted )); then
        xhost -SI:localuser:root >/dev/null 2>&1 || true
        _xhost_granted=0
    fi
}
trap cleanup_xhost EXIT
trap 'exit 1' HUP INT TERM

if ! xhost +SI:localuser:root >/dev/null 2>&1; then
    show_error "无法授权 root 访问当前 X11 会话。"
    exit 1
fi
_xhost_granted=1

# pkexec delegates credential collection to the desktop's polkit agent. Never
# collect a password in this launcher or pipe one to sudo.
if command -v pkexec >/dev/null 2>&1; then
    if pkexec env DISPLAY="$CURRENT_DISPLAY" XAUTHORITY="$CURRENT_XAUTHORITY" "$EXEC_FILE"; then
        exit 0
    fi
fi

# sudo is safe only with the launcher's controlling terminal: the shell waits
# for the root GUI to exit before the EXIT trap revokes the X11 authorization.
if command -v sudo >/dev/null 2>&1 && [[ -t 0 ]]; then
    sudo env DISPLAY="$CURRENT_DISPLAY" XAUTHORITY="$CURRENT_XAUTHORITY" "$EXEC_FILE"
    exit $?
fi

show_error "无法请求管理员权限；请在终端运行 uhe 使用 sudo。"
exit 1
LAUNCHER_EOF
  chmod +x "${srcdir}/uhe"

  # --- 2. 派生 .desktop ---
  cat > "${srcdir}/usbeam-hosts-editor.desktop" << 'DESKTOP_EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=UsbEAm Hosts Editor
GenericName=Hosts Editor
Comment=Cross-platform hosts file editor for Steam/Origin/Uplay etc.
Comment[zh_CN]=多平台hosts修改工具(Steam/Origin/Uplay等加速)
Exec=/usr/bin/uhe
Icon=/usr/share/pixmaps/usbeam-hosts-editor.png
Terminal=false
Categories=Network;
StartupNotify=true
Keywords=hosts;steam;origin;uplay;epic;
DESKTOP_EOF

  # --- 3. 提取内嵌图标(取最大方形 PNG,过滤界面截图) ---
  python3 - "${_main}" "${srcdir}/usbeam-hosts-editor.png" << 'PY_EOF'
import re, sys

src, dst = sys.argv[1], sys.argv[2]
data = open(src, 'rb').read()
magic = b'\x89PNG\r\n\x1a\n'
best = None
for off in [m.start() for m in re.finditer(re.escape(magic), data)]:
    if off + 33 > len(data):
        continue
    w = int.from_bytes(data[off+16:off+20], 'big')
    h = int.from_bytes(data[off+20:off+24], 'big')
    if w != h:  # 仅方形,避免窗口截图
        continue
    iend = data.find(b'IEND', off + 8)
    if iend < 0:
        continue
    if best is None or w * h > best[0]:
        best = (w * h, off, iend + 8)
if best is None:
    sys.exit('ERROR: 未在二进制中找到方形 PNG 图标')
open(dst, 'wb').write(data[best[1]:best[2]])
PY_EOF
  [ -s "${srcdir}/usbeam-hosts-editor.png" ] || { printf '%s\n' 'ERROR: 图标提取失败' >&2; return 1; }
}

package() {
  local _root="${srcdir}/UsbEAm Hosts Editor"
  local _main="${_root}/UsbEAm Hosts Editor"

  # 主程序与运行时本机库必须同目录(.NET 单文件相对加载 libSkiaSharp 等)
  install -Dm755 "${_main}" "${pkgdir}${_install_dir}/UsbEAm Hosts Editor"
  install -Dm644 "${_root}/libSkiaSharp.so" "${pkgdir}${_install_dir}/libSkiaSharp.so"
  install -Dm644 "${_root}/libHarfBuzzSharp.so" "${pkgdir}${_install_dir}/libHarfBuzzSharp.so"
  install -Dm644 "${_root}/ip2region.xdb" "${pkgdir}${_install_dir}/ip2region.xdb"

  install -Dm755 "${srcdir}/uhe" "${pkgdir}/usr/bin/uhe"
  install -Dm644 "${srcdir}/usbeam-hosts-editor.png" \
    "${pkgdir}/usr/share/pixmaps/usbeam-hosts-editor.png"
  install -Dm644 "${srcdir}/usbeam-hosts-editor.desktop" \
    "${pkgdir}/usr/share/applications/usbeam-hosts-editor.desktop"
}
