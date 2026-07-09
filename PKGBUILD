# Maintainer: Myqfeng <viagrahuang@outlook.com>

pkgname=easytier-connector
pkgver=1.1.1
pkgrel=1
pkgdesc="基于 Qt6 的系统托盘应用程序，用于连接 EasyTier Web 控制台（配置服务器）。EasyTier Web Connector based on Qt6."
arch=('x86_64')
options=('!debug')
url="https://gitee.com/qteasytier/easytier-connector"
license=('LGPL3')
depends=('qt6-base' 'qt6-svg')
makedepends=('cmake' 'git')
install=easytier-connector.install
source=("${pkgname}::git+https://gitee.com/qteasytier/easytier-connector.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/usr
    cmake --build build -j"$(nproc)"
}

package() {
    cd "${srcdir}/${pkgname}"

    # 主程序
    install -Dm755 "build/Output/EasyTierConnector" \
        "${pkgdir}/opt/etconnector/EasyTierConnector"

    # 后端守护进程
    install -Dm755 "build/Output/qtet-connector-daemon" \
        "${pkgdir}/opt/etconnector/qtet-connector-daemon"

    # 动态库
    for lib in build/Output/*.so; do
        [ -f "$lib" ] && install -Dm644 "$lib" "${pkgdir}/opt/etconnector/"
    done

    # 图标
    install -Dm644 "favicon/favicon-open.png" \
        "${pkgdir}/opt/etconnector/favicon-open.png"

    # systemd 服务
    install -Dm644 "assets/easytier-connector.service" \
        "${pkgdir}/etc/systemd/system/easytier-connector.service"

    # 桌面文件
    install -Dm644 "assets/etconnector.desktop" \
        "${pkgdir}/usr/share/applications/etconnector.desktop"

    # 创建 /usr/bin 软链接
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/etconnector/EasyTierConnector" \
        "${pkgdir}/usr/bin/EasyTierConnector"
}
