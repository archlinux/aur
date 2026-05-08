# Maintainer: zero <zero@localhost>
# Automatically updated by GitHub Actions

pkgname=zerx-lab-pencil-bin
pkgver=1.1.56
pkgrel=1
pkgdesc="Pencil - Full canvas design tool with native performance"
arch=('x86_64')
url="https://www.pencil.dev"
license=('LicenseRef-proprietary')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'hicolor-icon-theme'
    'libcups'
    'libdrm'
    'libsecret'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'xdg-utils'
)
optdepends=(
    'libappindicator: 系统托盘图标支持'
    'libayatana-appindicator: 系统托盘图标支持（Ayatana）'
)
provides=('pencil')
conflicts=('pencil')
options=('!strip')

source_x86_64=("Pencil-${pkgver}-linux-x64.tar.gz::https://www.pencil.dev/download/Pencil-linux-x64.tar.gz")
sha256sums_x86_64=('219933964e4e0d0487f43acef90b5e897cdc3dcbf97b75e4b8258ea7c2f49afc')

# _extract_asar_file: 从 app.asar 中提取指定文件
# 用法: _extract_asar_file <asar_path> <内部路径> <输出路径>
#
# 修复说明: asar 格式的 header 区域采用 Chromium pickle 封装，
# 数据区起始位置 = 8 + header_size，需对齐到 4 字节边界。
# 旧版代码直接用 f.tell() 获取 header_end，缺少对齐处理，
# 导致偏移少 1 字节，提取出的文件前面带有垃圾数据。
_extract_asar_file() {
    python3 - "$1" "$2" "$3" << 'PYEOF'
import struct, json, sys

asar_path, inner_path, out_path = sys.argv[1], sys.argv[2], sys.argv[3]

with open(asar_path, 'rb') as f:
    # asar 格式 header 布局（均为 little-endian uint32）：
    #   [0:4]   pickle_size   — 外层 pickle 的数据大小
    #   [4:8]   header_size   — 内层 header 区域的总大小（含 JSON 长度字段 + JSON 数据 + padding）
    #   [8:12]  header_str_sz — header 字符串长度（= json_size + padding）
    #   [12:16] json_size     — JSON 字符串的实际长度
    f.read(4)  # pickle_size（未使用）
    header_size = struct.unpack('<I', f.read(4))[0]
    f.read(4)  # header_str_sz（未使用）
    json_size = struct.unpack('<I', f.read(4))[0]

    json_data = f.read(json_size)

    # 数据区起始 = 8（前两个 uint32 字段自身）+ header_size
    # 再向上对齐到 4 字节边界（pickle 对齐要求）
    data_start = 8 + header_size
    if data_start % 4 != 0:
        data_start += 4 - (data_start % 4)

    tree = json.loads(json_data)

    def find_file(node, target, prefix=''):
        if 'files' not in node:
            return None
        for name, child in node['files'].items():
            path = f'{prefix}/{name}'.lstrip('/')
            if path == target:
                return child
            result = find_file(child, target, path)
            if result:
                return result
        return None

    info = find_file(tree, inner_path)
    if not info:
        sys.exit(f'错误: 在 asar 中未找到 {inner_path}')

    offset = int(info['offset'])
    size = int(info['size'])
    f.seek(data_start + offset)
    data = f.read(size)

    with open(out_path, 'wb') as out:
        out.write(data)
PYEOF
}

package() {
    local _srcdir="Pencil-${pkgver}-linux-x64"
    local _asar="$srcdir/$_srcdir/resources/app.asar"

    # 安装主程序目录
    install -d "$pkgdir/opt/pencil"
    cp -r "$srcdir/$_srcdir/." "$pkgdir/opt/pencil/"

    # chrome-sandbox 需要 setuid root
    chmod 4755 "$pkgdir/opt/pencil/chrome-sandbox"

    # /usr/bin 启动脚本
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/pencil" << 'EOF'
#!/bin/bash
exec /opt/pencil/pencil "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/pencil"

    # 从 app.asar 提取图标（多尺寸）
    # asar 内可用的图标:
    #   out/assets/512x512.png    — 512x512 高分辨率图标
    #   out/editor/images/512x512.png — 同上（编辑器用）
    #   out/editor/images/64x64.png   — 64x64 小图标
    local _icon_512="$srcdir/pencil-512x512.png"
    local _icon_64="$srcdir/pencil-64x64.png"

    _extract_asar_file "$_asar" "out/assets/512x512.png" "$_icon_512"
    _extract_asar_file "$_asar" "out/editor/images/64x64.png" "$_icon_64"

    # 验证提取的图标是否为有效 PNG
    for _icon_file in "$_icon_512" "$_icon_64"; do
        if ! head -c8 "$_icon_file" | grep -q $'\x89PNG'; then
            error "图标文件不是有效的 PNG: $_icon_file"
            return 1
        fi
    done

    # 安装多尺寸图标到 hicolor 主题
    install -Dm644 "$_icon_512" "$pkgdir/usr/share/icons/hicolor/512x512/apps/pencil.png"
    install -Dm644 "$_icon_64"  "$pkgdir/usr/share/icons/hicolor/64x64/apps/pencil.png"

    # 生成 128x128 中间尺寸（如果 ImageMagick 可用）
    if command -v magick &>/dev/null; then
        local _icon_128="$srcdir/pencil-128x128.png"
        magick "$_icon_512" -resize 128x128 "$_icon_128"
        install -Dm644 "$_icon_128" "$pkgdir/usr/share/icons/hicolor/128x128/apps/pencil.png"
    elif command -v convert &>/dev/null; then
        local _icon_128="$srcdir/pencil-128x128.png"
        convert "$_icon_512" -resize 128x128 "$_icon_128"
        install -Dm644 "$_icon_128" "$pkgdir/usr/share/icons/hicolor/128x128/apps/pencil.png"
    fi

    # 同时安装到 pixmaps 作为后备
    install -Dm644 "$_icon_512" "$pkgdir/usr/share/pixmaps/pencil.png"

    # .desktop 文件
    # KDE Plasma Wayland 通过 desktopFileName 匹配 .desktop 文件名来查找图标。
    # Electron 使用 package.json 的 productName（"Pencil"，大写 P）作为：
    #   - desktopFileName → KDE 用此匹配 .desktop 文件名（区分大小写）
    #   - resourceClass   → 即 WM_CLASS / app_id
    # 因此 .desktop 文件名必须为 Pencil.desktop，StartupWMClass 必须为 Pencil。
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/Pencil.desktop" << 'EOF'
[Desktop Entry]
Name=Pencil
Comment=Full canvas design tool with native performance
Exec=pencil %U
Icon=pencil
Terminal=false
Type=Application
Categories=Graphics;Design;
MimeType=x-scheme-handler/pencil;
StartupWMClass=Pencil
StartupNotify=true
EOF
}
