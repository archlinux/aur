# Maintainer: tjswysqh <tjswysqh@qq.com>
# Contributor: tjswysqh <tjswysqh@qq.com>
# Previous Maintainer: hiruocha <hiruocha at gmail dot com>

pkgname=misuzu-music-bin
pkgver=1.0.19
pkgrel=4
pkgdesc="一个跨平台的本地音乐播放器，支持自动匹配歌词和海报，支持创建歌单，支持日语汉字注音假名。界面仿Apple Music。"
arch=('x86_64')
url="https://github.com/AimesSoft/MisuzuMusic"
license=('MIT')

depends=('gtk3' 'mpv' 'zenity')

provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!debug' '!strip')

source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Misuzu-Music-linux-x64-${pkgver}.tar.gz"
    "LICENSE::${url}/raw/main/LICENSE"
)

sha256sums=('5b06c926c9dbdca29d7ef820cc6462932ab206735ac92ab29392228ce53df432'
            'd674f671ab6551f2d91442d89b0c0f32ff0096893b665d8c467ed6e63539d2d0')

package() {
    set -e
    
    cd "${srcdir}"
    
    local _appname="${pkgname%-bin}"
    
    # 防御性检查
    if [[ ! -f "misuzumusic" ]]; then
        printf '%s\n' "错误: 主程序 misuzumusic 未找到" >&2
        return 1
    fi
    
    # 安装主程序到 /opt
    install -dm755 "${pkgdir}/opt/${_appname}"
    install -Dm755 "misuzumusic" "${pkgdir}/opt/${_appname}/misuzumusic"
    
    # 复制 Flutter 库和资源
    for dir in lib data; do
        if [[ -d "$dir" ]]; then
            cp -a "$dir" "${pkgdir}/opt/${_appname}/"
            chmod -R u+w,go+r-w "${pkgdir}/opt/${_appname}/$dir"
            find "${pkgdir}/opt/${_appname}/$dir" -type d -exec chmod 755 {} \;
        fi
    done
    
    # 桌面文件处理
    local _desktop="${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -dm755 "${pkgdir}/usr/share/applications"
    
    if [[ -f "share/applications/misuzumusic.desktop" ]]; then
        install -Dm644 "share/applications/misuzumusic.desktop" "${_desktop}"
        sed -i "s|^Exec=.*|Exec=/usr/bin/${_appname} %U|" "${_desktop}"
        sed -i "s|^Icon=.*|Icon=${_appname}|" "${_desktop}"
    else
        cat > "${_desktop}" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Misuzu Music
Exec=/usr/bin/${_appname} %U
Icon=${_appname}
Terminal=false
Categories=AudioVideo;Audio;Player;
MimeType=audio/mpeg;audio/flac;audio/ogg;
EOF
    fi
    
    # 图标处理
    if [[ -d "share/icons" ]]; then
        install -dm755 "${pkgdir}/usr/share/icons"
        cp -a "share/icons/"* "${pkgdir}/usr/share/icons/" 2>/dev/null || true
        
        # 重命名图标文件
        find "${pkgdir}/usr/share/icons" -type f -name "misuzumusic.*" -print0 2>/dev/null | \
        while IFS= read -r -d '' icon; do
            local _basename=$(basename "$icon")
            local _dir=$(dirname "$icon")
            local _ext="${_basename##*.}"
            mv "$icon" "${_dir}/${_appname}.${_ext}"
        done
    fi
    
    # 创建 Wrapper 脚本（使用硬编码路径，避免 $pkgdir 残留）
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${_appname}" << 'EOF'
#!/bin/bash
set -e

if [[ -z "${HOME}" || ! -d "${HOME}" ]]; then
    printf '%s\n' "Error: HOME directory not set or inaccessible" >&2
    exit 1
fi

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export TMPDIR="${TMPDIR:-${XDG_CACHE_HOME}/misuzu-music/tmp}"
mkdir -p "${TMPDIR}"
cd "${HOME}" || exit 1
exec /opt/misuzu-music/misuzumusic "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_appname}"
    
    # 许可证
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}