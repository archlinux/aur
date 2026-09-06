# Maintainer: Eon <eon-dev@qq.com>
pkgname=busic-bin
_pkgname=busic
pkgver=0.4.3
pkgrel=2
pkgdesc="A high-value, cross-platform music player based on Flutter"
arch=('x86_64')
url="https://github.com/eon-ic/BuSic"
license=('GPLv3')
depends=('gtk3' 'alsa-lib' 'nss' 'nspr' 'libsecret')
options=('!strip' '!libtool')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.deb::https://github.com/eon-ic/BuSic/releases/download/release/busic_${pkgver}_amd64.deb")
sha256sums=('c7286c6b85c36f7c6f7f93c7bb25549a6f7e337e378da0b144c72e3c8f0ebcc1')

package() {
    # 1. 核心修复：手动解压 deb 内部的 data.tar 数据包到 srcdir
    # 因为 makepkg 只解开 deb 的外层，真正的文件都在 data.tar.* 里
    bsdtar -xf data.tar.* -C "${srcdir}"
    # 1. 准备系统目标目录
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"

    # 2. 将主程序移动到 /opt/busic
    # 提示：makepkg 会自动解压 deb 包的内容到 ${srcdir} 根目录下，无需手动解压 data.tar
    if [ -d "${srcdir}/usr/share/${_pkgname}" ]; then
        cp -r "${srcdir}/usr/share/${_pkgname}" "${pkgdir}/opt/"
    elif [ -d "${srcdir}/opt/${_pkgname}" ]; then
        cp -r "${srcdir}/opt/${_pkgname}" "${pkgdir}/opt/"
    fi

    # 3. 动态写入符合 Arch 规范的全新 .desktop 快捷方式文件
    # 注意：下面的 EOF 必须完全顶格写，左侧不能有任何空格或缩进
cat <<EOF> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=BuSic
GenericName=Music Player
GenericName[zh_CN]=音乐播放器
Comment=A high-value, cross-platform music player based on Flutter
Comment[zh_CN]=一款基于 Flutter 的高颜值跨平台音乐播放器
Exec=/usr/bin/${_pkgname}
Icon=${_pkgname}
Terminal=false
Categories=Audio;Player;
MimeType=audio/mpeg;audio/ogg;audio/mp3;audio/flac;
StartupNotify=true
EOF

    # 确保写入的 desktop 文件权限为标准只读权限 (rw-r--r--)
    chmod 644 "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # 4. 恢复应用图标
    if [ -d "${srcdir}/usr/share/icons" ]; then
        mkdir -p "${pkgdir}/usr/share"
        cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share/"
    fi

    # 5. 在 /usr/bin 创建软链接指向 /opt 中的主程序，方便命令行直接输入 busic 启动
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # 6. 统一修正 /opt 核心程序的执行权限
    chmod +x "${pkgdir}/opt/${_pkgname}/${_pkgname}"
}
