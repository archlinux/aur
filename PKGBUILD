# Maintainer: Myqfeng <viagrahuang@outlook.com>

pkgname=easytier-connector
pkgver=0.3.3
pkgrel=1
pkgdesc="EasyTier Web Connector based on Qt6"
arch=('x86_64')
url="https://gitee.com/myqfeng/et-connector"
license=('LGPL3')
depends=('qt6-base' 'qt6-svg')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/et-connector-v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/et-connector-v${pkgver}"
    mkdir -p build && cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    cmake --build .
}

package() {
    cd "${srcdir}/et-connector-v${pkgver}"
    
    # 安装主程序到 /opt/etconnector
    install -Dm755 "build/EasyTierConnector" "${pkgdir}/opt/etconnector/EasyTierConnector"
    
    # 安装 etcore 预编译二进制
    install -Dm755 "etcore/linux/easytier-cli" "${pkgdir}/opt/etconnector/etcore/easytier-cli"
    install -Dm755 "etcore/linux/easytier-deamon" "${pkgdir}/opt/etconnector/etcore/easytier-deamon"
    
    # 安装图标
    install -Dm644 "assets/favicon.svg" "${pkgdir}/opt/etconnector/favicon.svg"
    install -Dm644 "assets/favicon.png" "${pkgdir}/opt/etconnector/favicon.png"
    
    # 安装桌面文件（Exec 指向 /usr/bin symlink，Icon 指向 /opt 下的图标）
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/etconnector.desktop" <<DESKTOP_EOF
[Desktop Entry]
Type=Application
Name=ET Connector
Comment=EasyTier Web Connector
Exec=/usr/bin/EasyTierConnector
Icon=/opt/etconnector/favicon.png
Terminal=false
Categories=Utility;Qt;Web;Network;Internet;
DESKTOP_EOF
    
    # 创建 /usr/bin symlink（方便命令行调用）
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/etconnector/EasyTierConnector" "${pkgdir}/usr/bin/EasyTierConnector"
}
