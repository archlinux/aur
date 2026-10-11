# Maintainer: DarkLord-W <42199147+DarkLord-W@users.noreply.github.com>

pkgname=appimage-manager-gtk-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Scan for AppImages and create and maintain their desktop launchers"
arch=('x86_64')
url="https://github.com/DarkLord-W/appimage-manager"
license=('GPL-3.0-or-later')
depends=('gtk3' 'json-glib')

# 和源码版互斥：两个包装的是同一个 /usr/bin/appimage-manager。
# 用 provides + conflicts 而不是 replaces —— 准则里说 replaces 只在
# 软件包重命名时用，这里只是同一个软件的不同来源。
#
# 名字指向的是**源码包的 pkgbase**（appimage-manager-gtk）。两个包都叫
# -gtk 是因为 AUR 上 appimage-manager 被残留仓库占着，详见 README.md。
provides=('appimage-manager-gtk')
conflicts=('appimage-manager-gtk')

# 源就是发布出去的 AppImage。没有 build()：里面已经是编译好的产物。
source=("AppImage-Manager-$pkgver-x86_64.AppImage::https://github.com/DarkLord-W/appimage-manager/releases/download/v$pkgver/AppImage-Manager-$pkgver-x86_64.AppImage")

# 全零是占位符，提交到 AUR 之前必须由 scripts/publish-aur.sh 从 Release 的
# SHA256SUMS 里读出真值填进来。留占位符而不是留一个真哈希：真哈希会随着
# 上游重发资产而失效，占位符不可能"看起来是对的"。
sha256sums=('24f6ea0daab3369d19d48d2654e5c8e0c489d8f5f2d0deb97acfd06e3b991f8b')

package() {
    cd "$srcdir"

    # 解包，而不是把 .AppImage 直接装到 /usr/bin。
    #
    # 直接装的话用户每次运行都要 FUSE 挂载，就得给包加 fuse2 依赖 ——
    # 那是 AppImage 这个**格式**的开销，程序本身根本不需要它。
    # 解出来按正常目录结构装，装完之后和源码版**一模一样**。
    #
    # chmod 不能省：makepkg 下载下来的源文件是 0644，没有可执行位，
    # 直接跑会报 "Permission denied"。那个报错指向 .AppImage 文件本身，
    # 看着像下载坏了或者文件损坏，其实只是权限。
    chmod +x "AppImage-Manager-$pkgver-x86_64.AppImage"
    ./"AppImage-Manager-$pkgver-x86_64.AppImage" --appimage-extract >/dev/null

    install -Dm755 squashfs-root/usr/bin/appimage-manager \
        "$pkgdir/usr/bin/appimage-manager"
    install -Dm644 squashfs-root/usr/share/appimage-manager/style.css \
        "$pkgdir/usr/share/appimage-manager/style.css"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/appimage-manager.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/appimage-manager.png"

    # 许可证全文。GPL 要求分发二进制时附带；AppImage 里有（由 make install
    # 装进 AppRun 目录树），直接取过来。取不到就报错而不是静默少一个文件。
    if [ ! -f squashfs-root/usr/share/licenses/appimage-manager/LICENSE ]; then
        echo "ERROR: AppImage 里没有 LICENSE，这个包不能这么打。" >&2
        echo "       原因通常是这个 Release 的 AppImage 由旧版 Makefile 打出 ——" >&2
        echo "       那时 make install 还不装许可证（在 Makefile 的 install 目标里）。" >&2
        echo "       用当前代码重打一个 Release 再发这个包。" >&2
        exit 1
    fi
    install -Dm644 squashfs-root/usr/share/licenses/appimage-manager/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # .desktop 用 AppImage 自带的，改两处：
    #
    #   Exec=AppRun → /usr/bin/appimage-manager
    #     AppRun 是 AppImage 内部的启动器，正常安装之后那个文件不存在。
    #   X-AppImage-Version 整行删掉
    #     那是 AppImage 专用的字段。pacman 装的包不是 AppImage，
    #     留着它只会让以后排查问题的人误以为装的是 AppImage。
    #
    # 不自己写一份完整的：AppImage 里那份本来就是从仓库的模板生成的，
    # 抄一份出来就有了两个真相来源，将来改模板必然会漏掉这个 ——
    # 尤其是 StartupWMClass，它必须和程序里 set_wmclass() 的 class
    # 字段一致，否则任务栏图标会退回通用占位图。
    install -d "$pkgdir/usr/share/applications"
    sed -e 's|^Exec=AppRun|Exec=/usr/bin/appimage-manager|' \
        -e '/^X-AppImage-Version=/d' \
        squashfs-root/appimage-manager.desktop \
        > "$pkgdir/usr/share/applications/appimage-manager.desktop"
    chmod 0644 "$pkgdir/usr/share/applications/appimage-manager.desktop"
}
