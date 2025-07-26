# Maintainer: GalileoLion <galileolion@example.com>



pkgname=noteey-bin
pkgver=1.27.1
pkgrel=1
pkgdesc="Noteey - A powerful note-taking application"
arch=('x86_64')
url="https://github.com/andyyoungm/muenzo"
license=('custom')
depends=('electron' 'gtk3' 'libxss' 'gconf' 'nss' 'alsa-lib')
makedepends=('p7zip' 'unzip' 'curl' 'jq' 'icoutils')



# 获取下载URL - 支持两个源
_get_download_url() {
    local version=$1
    local github_url="https://github.com/andyyoungm/muenzo/releases/download/v${pkgver}/Noteey-Setup-${pkgver}.exe"
    local oss_url="https://noteey.oss-cn-beijing.aliyuncs.com/Noteey-Setup-${pkgver}.exe"

    # 优先尝试GitHub，如果失败则使用OSS
    if curl --output /dev/null --silent --head --fail "$github_url"; then
        echo "$github_url"
    elif curl --output /dev/null --silent --head --fail "$oss_url"; then
        echo "$oss_url"
    else
        echo "ERROR: Neither download source is available for version ${pkgver}" >&2
        return 1
    fi
}

# 在构建时动态设置源
source=("noteey-${pkgver}.exe::$(_get_download_url ${pkgver})")
noextract=("noteey-${pkgver}.exe")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir"

    echo "Extracting Noteey installer (version ${pkgver})..."

    # 解压主安装包
    if ! 7z x "noteey-${pkgver}.exe" -o"noteey-extract" &>/dev/null; then
        echo "7z failed, trying unzip..."
        if ! unzip -q "noteey-${pkgver}.exe" -d "noteey-extract" 2>/dev/null; then
            echo "Standard extraction failed, trying as NSIS installer..."
            mkdir -p "noteey-extract"
            7z x "noteey-${pkgver}.exe" -o"noteey-extract" -y 2>/dev/null || {
                echo "All extraction methods failed"
                exit 1
            }
        fi
    fi

    cd "noteey-extract"

    echo "Directory contents after extraction:"
    ls -la

    # 智能查找app相关的压缩文件
    local app_archive
    app_archive=$(find . \( -name "app-*.7z" -o -name "app.7z" -o -name "*app*.7z" \) -type f | head -1)

    if [ -n "$app_archive" ]; then
        echo "Found app archive: $app_archive"
        7z x "$app_archive" -o"app-extracted" -y
    else
        echo "No app archive found, searching for direct app.asar..."
        if ! find . -name "app.asar" -type f | head -1; then
            echo "Warning: No app.asar found directly, listing all files for debugging:"
            find . -type f | head -20
        fi
    fi

    # 最终验证
    local app_asar_path
    app_asar_path=$(find . -name "app.asar" -type f | head -1)

    if [ -z "$app_asar_path" ]; then
        echo "Error: app.asar not found!"
        echo "Directory structure:"
        find . -type f -name "*.asar" -o -name "*.7z" -o -name "*.zip" | head -10
        exit 1
    else
        echo "Successfully found app.asar at: $app_asar_path"
    fi
}

package() {
    cd "$srcdir/noteey-extract"

    # 创建目录结构
    install -dm755 "$pkgdir/opt/noteey"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/doc/noteey"

    # 查找并复制app.asar
    local app_asar_path
    app_asar_path=$(find . -name "app.asar" -type f | head -1)

    if [ -n "$app_asar_path" ]; then
        install -Dm644 "$app_asar_path" "$pkgdir/opt/noteey/app.asar"
        echo "Installed app.asar from: $app_asar_path"
    else
        echo "Error: Could not find app.asar to install"
        exit 1
    fi

    # 复制其他资源文件
    local resources_dir
    resources_dir=$(dirname "$app_asar_path")

    if [ -d "$resources_dir" ] && [ "$(basename "$resources_dir")" = "resources" ]; then
        echo "Copying additional resources..."
        cp -r "$resources_dir"/* "$pkgdir/opt/noteey/" 2>/dev/null || true
    fi

    # 创建高级启动脚本
    cat > "$pkgdir/usr/bin/noteey" << 'EOF'
#!/bin/bash

# Noteey启动脚本
# 设置环境变量
export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_NO_ATTACH_CONSOLE=1

# 应用程序路径
APP_PATH="/opt/noteey/app.asar"

# 检查依赖
if ! command -v electron &> /dev/null; then
    echo "错误: 未找到 electron，请安装 electron 包："
    echo "sudo pacman -S electron"
    exit 1
fi

if [ ! -f "$APP_PATH" ]; then
    echo "错误: 找不到应用文件 $APP_PATH"
    exit 1
fi

# 创建用户数据目录
USER_DATA_DIR="$HOME/.config/noteey"
mkdir -p "$USER_DATA_DIR"

# 启动应用
echo "启动 Noteey..."
exec electron "$APP_PATH" \
    --user-data-dir="$USER_DATA_DIR" \
    --no-sandbox \
    --disable-dev-shm-usage \
    "$@"
EOF

    chmod +x "$pkgdir/usr/bin/noteey"

    # 创建桌面文件
    cat > "$pkgdir/usr/share/applications/noteey.desktop" << 'EOF'
[Desktop Entry]
Name=Noteey
Name[zh_CN]=Noteey 笔记
Comment=A powerful note-taking application (auto-updated to latest version)
Comment[zh_CN]=强大的笔记应用程序（自动更新到最新版本）
Exec=noteey %U
Icon=noteey
Type=Application
Categories=Office;TextEditor;Utility;Development;
MimeType=text/plain;text/markdown;application/json;
StartupWMClass=Noteey
StartupNotify=true
Keywords=note;notes;text;markdown;editor;
Keywords[zh_CN]=笔记;文本;编辑器;记录;
EOF

    # 查找Noteey.exe并从中提取图标
    local noteey_exe
    noteey_exe=$(find . -name "Noteey.exe" -type f | head -1)

    if [ -n "$noteey_exe" ]; then
        echo "Found Noteey.exe, extracting icon: $noteey_exe"

        # 使用wrestool从Noteey.exe提取图标
        if command -v wrestool &> /dev/null; then
            mkdir -p "temp_icons"
            wrestool -x --output="temp_icons" -t14 "$noteey_exe" 2>/dev/null && {
                # 查找提取的ico文件并转换为png
                for ico_file in temp_icons/*.ico; do
                    if [ -f "$ico_file" ]; then
                        echo "Converting icon from Noteey.exe: $ico_file"
                        if command -v icotool &> /dev/null; then
                            icotool -x -w 256 -h 256 -o "temp_icons/" "$ico_file" 2>/dev/null || \
                            icotool -x -o "temp_icons/" "$ico_file" 2>/dev/null
                        fi
                        break
                    fi
                done

                # 安装转换后的png图标
                for png_file in temp_icons/*.png; do
                    if [ -f "$png_file" ]; then
                        install -Dm644 "$png_file" "$pkgdir/usr/share/pixmaps/noteey.png"
                        echo "Installed icon from Noteey.exe: $png_file"
                        break
                    fi
                done
            } || {
                echo "wrestool failed, using fallback icon method"
            }
        else
            echo "wrestool not found, skipping Noteey.exe icon extraction"
        fi
    else
        echo "Noteey.exe not found, using fallback icon search"
    fi

    # 如果从Noteey.exe提取图标失败，使用原来的方法
    if [ ! -f "$pkgdir/usr/share/pixmaps/noteey.png" ]; then
        echo "Fallback: searching for alternative icons..."
        local icon_file
        icon_file=$(find . \( -name "*.png" -o -name "*.ico" -o -name "*.svg" \) -type f | grep -i -E "(noteey|icon|logo|app)" | head -1)

        if [ -z "$icon_file" ]; then
            icon_file=$(find . \( -name "*.png" -o -name "*.ico" \) -type f | head -1)
        fi

        if [ -n "$icon_file" ]; then
            echo "Using fallback icon: $icon_file"
            local ext="${icon_file##*.}"

            case "$ext" in
                "ico")
                    if command -v convert &> /dev/null; then
                        convert "$icon_file" -resize 256x256 "$pkgdir/usr/share/pixmaps/noteey.png"
                    else
                        cp "$icon_file" "$pkgdir/usr/share/pixmaps/noteey.ico"
                    fi
                    ;;
                "svg")
                    cp "$icon_file" "$pkgdir/usr/share/pixmaps/noteey.svg"
                    ;;
                *)
                    cp "$icon_file" "$pkgdir/usr/share/pixmaps/noteey.png"
                    ;;
            esac
        else
            echo "Warning: No icon file found"
        fi
    fi

    # 创建文档和版本信息
    echo "Noteey version $pkgver (auto-updated from GitHub)" > "$pkgdir/usr/share/doc/noteey/VERSION"
    echo "Installed from: https://github.com/andyyoungm/muenzo" >> "$pkgdir/usr/share/doc/noteey/VERSION"
    echo "Installation date: $(date)" >> "$pkgdir/usr/share/doc/noteey/VERSION"
    echo "Build date: 2025-07-20 10:30:03 UTC" >> "$pkgdir/usr/share/doc/noteey/VERSION"
}
