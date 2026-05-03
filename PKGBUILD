# Maintainer: Myqfeng <viagrahuang@outlook.com>

pkgname=easytier-connector
pkgver=0.3.3
pkgrel=4
pkgdesc="EasyTier Web Connector based on Qt6"
arch=('x86_64')
url="https://gitee.com/myqfeng/et-connector"
license=('LGPL3')
depends=('qt6-base' 'qt6-svg')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://gitee.com/viah6341/etc-download/releases/download/${pkgver}/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/et-connector_v${pkgver}"
    rm -rf build Install
    mkdir -p build && cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release \
             -DCMAKE_INSTALL_PREFIX="${srcdir}/et-connector_v${pkgver}/Install"
    cmake --build .
    cmake --install .
}

package() {
    cd "${srcdir}/et-connector_v${pkgver}"

    # 从 Install/bin 复制主程序和 etcore 到 /opt/etconnector
    install -Dm755 "Install/bin/EasyTierConnector" "${pkgdir}/opt/etconnector/EasyTierConnector"
    install -Dm755 "Install/bin/etcore/easytier-cli" "${pkgdir}/opt/etconnector/etcore/easytier-cli"
    install -Dm755 "Install/bin/etcore/easytier-deamon" "${pkgdir}/opt/etconnector/etcore/easytier-deamon"

    # 从 deb 目录复制图标
    install -Dm644 "package/linux/deb/opt/etconnector/favicon.png" "${pkgdir}/opt/etconnector/favicon.png"

    # 从 deb 目录复制桌面文件
    install -Dm644 "package/linux/deb/usr/share/applications/etconnector.desktop" "${pkgdir}/usr/share/applications/etconnector.desktop"

    # 创建 /usr/bin symlink
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/etconnector/EasyTierConnector" "${pkgdir}/usr/bin/EasyTierConnector"
}
