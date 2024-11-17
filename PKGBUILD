
pkgname=yesplaymusic-new
pkgver=0.4.9
pkgrel=1
pkgdesc="A third party music application for Netease Music"
arch=("x86_64")
url="https://github.com/qier222/YesPlayMusic"
license=("MIT")
provides=("yesplaymusic")
depends=(
    "gtk3"
    "nss"
    "nodejs"
    "npm"
)
optdepends=(
    'c-ares'
    'ffmpeg'
    'http-parser'
    'libevent'
    'libvpx'
    'libxslt'
    'minizip'
    're2'
    'snappy'
    'libnotify'
    'libappindicator-gtk3'
)
source=(
    "YesPlayMusic-${pkgver}.tar.gz::https://github.com/qier222/YesPlayMusic/archive/refs/tags/v${pkgver}.tar.gz" # 修改这里为你的tar.gz文件的实际路径
)
sha256sums=('9b240d6b605d547c9dbc7d6222a0d2f28bfb0586201e01181e1d0e25bb83885a') # 替换为你的tar.gz文件的实际SHA256校验和

prepare() {
    cd "${srcdir}/YesPlayMusic-${pkgver}"
    # 安装项目依赖
    npm install --legacy-peer-deps
}

build() {
    export NODE_OPTIONS=--openssl-legacy-provider
    cd "${srcdir}/YesPlayMusic-${pkgver}"
    # 构建项目
    npm run build
}

package() {	
    export NODE_OPTIONS=--openssl-legacy-provider
    cd "${srcdir}/YesPlayMusic-${pkgver}"
    
    # 创建安装目录
    install -d "${pkgdir}/usr/share/yesplaymusic"
    install -d "${pkgdir}/usr/bin"
    
    # 复制构建后的文件
    cp -r dist/* "${pkgdir}/usr/share/yesplaymusic/"
    
    # 创建启动脚本
    cat << EOF > "${pkgdir}/usr/bin/yesplaymusic"
#!/bin/sh
exec electron "${pkgdir}/usr/share/yesplaymusic/main.js" "\$@"
EOF
    
    # 设置启动脚本权限
    chmod +x "${pkgdir}/usr/bin/yesplaymusic"
    
    # 复制桌面文件
    #install -Dm644 public/yesplaymusic.desktop "${pkgdir}/usr/share/applications/yesplaymusic.desktop"
    
    # 复制图标
    #install -Dm644 public/yesplaymusic.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/yesplaymusic.png"
    
    # Make KDE happy :)
    #echo 'Comment[zh_CN]=高颜值的第三方网易云播放器' >>"${pkgdir}/usr/share/applications/yesplaymusic.desktop"
    #sed -i -E "s|Categories=Music;|Categories=Music;AudioVideo;Player;|" "${pkgdir}/usr/share/applications/yesplaymusic.desktop"
}

post_install() {
    # SUID chrome-sandbox for Electron 5+
    chmod 4755 '/usr/lib/yesplaymusic/chrome-sandbox' || true
    update-mime-database /usr/share/mime || true
    update-desktop-database /usr/share/applications || true
}

post_remove() {
    rm -f '/usr/bin/yesplaymusic'
}
