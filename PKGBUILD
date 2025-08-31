# Maintainer: WangYiben0 <wangyiben1@outlook.com>
# Contributor: Sheng Fan <fredtools999@gmail.com>
# Contributor: Chumeng <lihaoze123>

pkgname=com.wxriw.lyricify4
pkgver=4.2.28.240502
pkgrel=1
pkgdesc="A lyrics player for spotify running in Wine container (unofficial packaging) / 使用 Wine 容器运行的一个 Spotify 歌词播放器（非官方打包）"
arch=('x86_64')
url="https://github.com/Lyricify/Lyricify-on-Wine"
license=('custom')
depends=('spark-dwine-helper')
makedepends=('7zip')
source=("lyricify4.deb::https://github.com/Lyricify/Lyricify-on-Wine/releases/download/v4.2.28/com.wxriw.lyricify4_4.2.28.240502-release-wpack240503.02_amd64.deb") # 软件更新靠的是内部自动更新，我就直接硬编码了
sha256sums=('8261d4e9509e4eb51db56da80cf1e7b6da5ebb49eab7bfb342885c57878880de')
options=('!strip')

prepare() {
    # 解压deb包
    mkdir "${srcdir}/lyricify-deb" -p
    tar xf "${srcdir}/data.tar.xz" --directory "${srcdir}/lyricify-deb"

    # 静默解压7z文件，忽略链接错误
    { 7z x "${srcdir}/lyricify-deb/opt/apps/com.wxriw.lyricify4/files/files.7z" -o"${srcdir}/lyricify-files" -y || true; }
    { 7z x "${srcdir}/lyricify-deb/opt/apps/com.wxriw.lyricify4/files/wine_archive.7z" -o"${srcdir}/wine-for-lyricify" -y || true; }
}

package() {
    # 安装主程序文件
    install -d "${pkgdir}/opt/apps/${pkgname}"
    cp -r "${srcdir}/lyricify-files/"* "${pkgdir}/opt/apps/${pkgname}/"

    # 安装Wine环境
    install -d "${pkgdir}/opt/apps/${pkgname}/wine"
    cp -r "${srcdir}/wine-for-lyricify/"* "${pkgdir}/opt/apps/${pkgname}/wine/"

    # 安装图标
    install -Dm644 "${srcdir}/lyricify-deb/opt/apps/com.wxriw.lyricify4/entries/icons/hicolor/scalable/apps/com.wxriw.lyricify4.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.wxriw.lyricify4.png"

    # 创建启动脚本（使用系统已有的spark_run_v4.sh）
    install -d "${pkgdir}/usr/bin"
    cat >"${pkgdir}/usr/bin/lyricify" <<EOF
#!/bin/sh
export WINEPREFIX="\${WINEPREFIX:-\$HOME/.deepinwine/${pkgname}}"
export APPRUN_CMD="/opt/apps/${pkgname}/wine/bin/wine64"
export PATH="/opt/apps/${pkgname}/wine/bin:\$PATH"

[ ! -d "\$WINEPREFIX" ] && mkdir -p "\$WINEPREFIX"

exec /opt/deepinwine/tools/spark_run_v4.sh \\
  "Lyricify" \\
  "${pkgver}" \\
  "C:/Program Files/Lyricify 4/Lyricify for Spotify.exe" \\
  "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/lyricify"

    # 创建桌面文件
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Lyricify 4
GenericName=Lyrics Display
Comment=Show synchronized lyrics for Spotify and Apple Music
Icon=com.wxriw.lyricify4
Exec=lyricify
Categories=Audio;Music;Player;
StartupNotify=false
Terminal=false
EOF
}
