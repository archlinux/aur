# Maintainer: Hua <majicdh@gmail.com>

pkgname=server-box-bin
pkgver=1.0.1262
pkgrel=1
pkgdesc="ServerBox - A flutter app that helps you connect to your server."
arch=('x86_64')
url="https://github.com"
license=('MIT')
depends=('fuse2')
conflicts=('server-box')
provides=('server-box')
options=(!strip)
source=("https://github.com/lollipopkit/flutter_server_box/releases/download/v1.0.1262/ServerBox_1262_amd64.AppImage")
sha256sums=('dbab2d3acc5e9c058f1e03b33df95a457db5c89c3d4933b74f8fbaa6bd3501f2')

prepare() {
    # 动态获取 AppImage 文件名
    appimage_file=$(basename "${source[0]}")
    chmod +x "$srcdir/$appimage_file"
    cd "$srcdir"

    # 提取AppImage内容
    ./"$appimage_file" --appimage-extract
}

package() {
    # 动态获取 AppImage 文件名
    appimage_file=$(basename "${source[0]}")
    
    # 创建目录
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "$pkgdir/opt/$pkgname"

    # 安装主程序
    install -Dm755 "$srcdir/$appimage_file" "$pkgdir/opt/$pkgname/server-box.AppImage"

    # 创建启动脚本
    cat > "$pkgdir/usr/bin/server-box" << EOL
#!/bin/sh
/opt/$pkgname/server-box.AppImage "$@"
EOL
    chmod 755 "$pkgdir/usr/bin/server-box"

    # 提取应用程序名称（用于图标和桌面文件）
    APP_NAME="${pkgname%-bin}"

    # 处理图标 - 增强版图标处理
    if [ -d "$srcdir/squashfs-root" ]; then
        echo "正在查找和安装图标..."

        # 定义常见的图标位置数组
        ICON_LOCATIONS=(
            "$srcdir/squashfs-root/$APP_NAME.png"
            "$srcdir/squashfs-root/${APP_NAME^}.png"  # 首字母大写
            "$srcdir/squashfs-root/icon.png"
            "$srcdir/squashfs-root/.DirIcon"
            "$srcdir/squashfs-root/$APP_NAME.svg"
            "$srcdir/squashfs-root/${APP_NAME^}.svg"  # 首字母大写
            "$srcdir/squashfs-root/icon.svg"
            "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512/apps/$APP_NAME.png"
            "$srcdir/squashfs-root/usr/share/icons/hicolor/scalable/apps/$APP_NAME.svg"
            "$srcdir/squashfs-root/usr/share/pixmaps/$APP_NAME.png"
            "$srcdir/squashfs-root/usr/share/pixmaps/$APP_NAME.xpm"
            "$srcdir/squashfs-root/usr/share/icons/$APP_NAME.png"
        )

        # 检查提取的桌面文件中的图标路径
        if find "$srcdir/squashfs-root" -name "*.desktop" | grep -q .; then
            DESKTOP_FILE=$(find "$srcdir/squashfs-root" -name "*.desktop" | head -n 1)
            if [ -f "$DESKTOP_FILE" ]; then
                ICON_FROM_DESKTOP=$(grep -oP "Icon=\K.*" "$DESKTOP_FILE")
                if [ -n "$ICON_FROM_DESKTOP" ]; then
                    # 添加从桌面文件获取的图标路径
                    ICON_LOCATIONS+=("$srcdir/squashfs-root/$ICON_FROM_DESKTOP")
                    ICON_LOCATIONS+=("$srcdir/squashfs-root/$ICON_FROM_DESKTOP.png")
                    ICON_LOCATIONS+=("$srcdir/squashfs-root/$ICON_FROM_DESKTOP.svg")
                    ICON_LOCATIONS+=("$srcdir/squashfs-root/usr/share/icons/hicolor/512x512/apps/$ICON_FROM_DESKTOP.png")
                    ICON_LOCATIONS+=("$srcdir/squashfs-root/usr/share/icons/hicolor/scalable/apps/$ICON_FROM_DESKTOP.svg")
                fi
            fi
        fi

        # 检查预定义位置
        ICON_FOUND=0
        for ICON_PATH in "${ICON_LOCATIONS[@]}"; do
            if [ -f "$ICON_PATH" ]; then
                echo "找到图标: $ICON_PATH"

                # 确定图标类型和目标目录
                if [[ "$ICON_PATH" == *.svg ]]; then
                    # SVG图标
                    install -Dm644 "$ICON_PATH" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$APP_NAME.svg"
                    echo "已安装SVG图标到: /usr/share/icons/hicolor/scalable/apps/$APP_NAME.svg"
                    # 为兼容性也创建PNG链接
                    install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
                    ln -sf "/usr/share/icons/hicolor/scalable/apps/$APP_NAME.svg" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$APP_NAME.png"
                elif [[ "$ICON_PATH" == *.xpm ]]; then
                    # XPM图标
                    install -Dm644 "$ICON_PATH" "$pkgdir/usr/share/pixmaps/$APP_NAME.xpm"
                    echo "已安装XPM图标到: /usr/share/pixmaps/$APP_NAME.xpm"
                else
                    # PNG或其他位图图标
                    install -Dm644 "$ICON_PATH" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$APP_NAME.png"
                    echo "已安装PNG图标到: /usr/share/icons/hicolor/512x512/apps/$APP_NAME.png"
                    # 同时复制到pixmaps目录以提高兼容性
                    install -Dm644 "$ICON_PATH" "$pkgdir/usr/share/pixmaps/$APP_NAME.png"
                fi

                ICON_FOUND=1
                break
            fi
        done

        # 如果预定义位置没有找到图标，则搜索整个目录
        if [ $ICON_FOUND -eq 0 ]; then
            echo "在预定义位置未找到图标，正在搜索整个目录..."

            # 先查找png文件
            if find "$srcdir/squashfs-root" -name "*.png" | grep -q .; then
                ICON_PATH=$(find "$srcdir/squashfs-root" -name "*.png" | head -n 1)
                echo "找到PNG图标: $ICON_PATH"
                install -Dm644 "$ICON_PATH" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$APP_NAME.png"
                # 同时复制到pixmaps目录以提高兼容性
                install -Dm644 "$ICON_PATH" "$pkgdir/usr/share/pixmaps/$APP_NAME.png"
                ICON_FOUND=1
            # 然后查找svg文件
            elif find "$srcdir/squashfs-root" -name "*.svg" | grep -q .; then
                ICON_PATH=$(find "$srcdir/squashfs-root" -name "*.svg" | head -n 1)
                echo "找到SVG图标: $ICON_PATH"
                install -Dm644 "$ICON_PATH" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$APP_NAME.svg"
                # 为兼容性也创建PNG链接
                install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
                ln -sf "/usr/share/icons/hicolor/scalable/apps/$APP_NAME.svg" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$APP_NAME.png"
                ICON_FOUND=1
            fi
        fi

        # 如果仍然没有找到图标，则尝试从AppImage本身提取
        if [ $ICON_FOUND -eq 0 ]; then
            echo "在AppImage中未找到图标，尝试从AppImage本身提取..."
            if command -v pngtopnm &> /dev/null && command -v pnmtopng &> /dev/null; then
                "$srcdir/$appimage_file" --appimage-extract *.png 2>/dev/null || true
                if find "$srcdir/squashfs-root" -name "*.png" | grep -q .; then
                    ICON_PATH=$(find "$srcdir/squashfs-root" -name "*.png" | head -n 1)
                    install -Dm644 "$ICON_PATH" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$APP_NAME.png"
                    install -Dm644 "$ICON_PATH" "$pkgdir/usr/share/pixmaps/$APP_NAME.png"
                    ICON_FOUND=1
                fi
            fi
        fi

        # 处理桌面文件
        echo "正在处理桌面文件..."

        if [ -f "$srcdir/squashfs-root/$APP_NAME.desktop" ]; then
            DESKTOP_PATH="$srcdir/squashfs-root/$APP_NAME.desktop"
            echo "找到桌面文件: $DESKTOP_PATH"
        elif [ -f "$srcdir/squashfs-root/${APP_NAME^}.desktop" ]; then  # 首字母大写
            DESKTOP_PATH="$srcdir/squashfs-root/${APP_NAME^}.desktop"
            echo "找到桌面文件: $DESKTOP_PATH"
        elif find "$srcdir/squashfs-root" -name "*.desktop" | grep -q .; then
            DESKTOP_PATH=$(find "$srcdir/squashfs-root" -name "*.desktop" | head -n 1)
            echo "找到桌面文件: $DESKTOP_PATH"
        fi

        if [ -n "$DESKTOP_PATH" ] && [ -f "$DESKTOP_PATH" ]; then
            install -Dm644 "$DESKTOP_PATH" "$pkgdir/usr/share/applications/$APP_NAME.desktop"

            # 更新桌面文件
            # 1. 修改Exec行
            sed -i "s|Exec=.*|Exec=/usr/bin/$APP_NAME %F|g" "$pkgdir/usr/share/applications/$APP_NAME.desktop"

            # 2. 确保Icon行指向正确的图标
            if grep -q "Icon=" "$pkgdir/usr/share/applications/$APP_NAME.desktop"; then
                sed -i "s|Icon=.*|Icon=$APP_NAME|g" "$pkgdir/usr/share/applications/$APP_NAME.desktop"
            else
                # 如果没有Icon行，添加一个
                sed -i "/\[Desktop Entry\]/a Icon=$APP_NAME" "$pkgdir/usr/share/applications/$APP_NAME.desktop"
            fi

            # 3. 添加MimeType如果没有
            if ! grep -q "MimeType=" "$pkgdir/usr/share/applications/$APP_NAME.desktop"; then
                echo "MimeType=application/x-$APP_NAME;" >> "$pkgdir/usr/share/applications/$APP_NAME.desktop"
            fi

            echo "已安装并更新桌面文件到: /usr/share/applications/$APP_NAME.desktop"
        else
            # 如果没有找到桌面文件，则创建一个基本的
            echo "未找到桌面文件，创建基本桌面文件..."
            cat > "$pkgdir/usr/share/applications/$APP_NAME.desktop" << EOL
[Desktop Entry]
Name=server-box
Comment=ServerBox - A flutter app that helps you connect to your server.
Exec=/usr/bin/server-box %F
Icon=server-box
Terminal=false
Type=Application
Categories=Utility;
MimeType=application/x-server-box;
EOL
            echo "已创建基本桌面文件: /usr/share/applications/$APP_NAME.desktop"
        fi
    fi

    # 最后执行gtk-update-icon-cache以更新图标缓存
    echo "添加post_install和post_upgrade钩子以更新图标缓存..."
    cat > "$srcdir/install" << EOL
post_install() {
    gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
    update-desktop-database -q
}

post_upgrade() {
    post_install
}

post_remove() {
    post_install
}
EOL
    install -Dm644 "$srcdir/install" "$pkgdir/usr/share/libalpm/hooks/$pkgname.install"
}
