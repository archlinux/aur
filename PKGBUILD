# Maintainer: zero <zero@localhost>
# Automatically updated by GitHub Actions

pkgname=zerx-lab-pencil-bin
pkgver=1.1.31
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
    'libappindicator-gtk3: 系统托盘图标支持'
    'libayatana-appindicator: 系统托盘图标支持（Ayatana）'
)
provides=('pencil')
conflicts=('pencil')
options=('!strip')

source_x86_64=("Pencil-${pkgver}-linux-x64.tar.gz::https://www.pencil.dev/download/Pencil-linux-x64.tar.gz")
sha256sums_x86_64=('5fb8825b8bb097bc708d0621259459b7bc4fc017f1828df5b10c79092a45213b')

package() {
    local _srcdir="Pencil-${pkgver}-linux-x64"

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

    # 提取图标（从 app.asar 内嵌的 512x512.png）
    local _asar="$srcdir/$_srcdir/resources/app.asar"
    install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    python3 - "$_asar" "$pkgdir/usr/share/icons/hicolor/512x512/apps/pencil.png" << 'PYEOF'
import struct, json, sys

asar_path, out_path = sys.argv[1], sys.argv[2]
with open(asar_path, 'rb') as f:
    f.read(4); f.read(4); f.read(4)
    json_size = struct.unpack('<I', f.read(4))[0]
    json_data = f.read(json_size)
    header_end = f.tell()
    tree = json.loads(json_data)

    def find_file(node, target, prefix=''):
        if 'files' not in node:
            return None
        for name, child in node['files'].items():
            path = (prefix + '/' + name).lstrip('/')
            if path == target:
                return child
            result = find_file(child, target, path)
            if result:
                return result
        return None

    info = find_file(tree, 'out/assets/512x512.png')
    if not info:
        sys.exit('未找到图标文件 out/assets/512x512.png')
    offset = int(info['offset'])
    size   = int(info['size'])
    f.seek(header_end + offset)
    data = f.read(size)
    # asar 在每个文件数据前有 1 字节的 \n padding，跳过
    if data[0:1] == b'\n' and data[1:2] == b'\x89':
        data = data[1:]
    with open(out_path, 'wb') as out:
        out.write(data)
PYEOF

    # .desktop 文件
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/pencil.desktop" << 'EOF'
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
EOF
}
