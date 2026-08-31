# Maintainer: Myqfeng <viagrahuang@outlook.com>

pkgname=qteasytier
pkgver=3.2.0
pkgrel=1
pkgdesc="基于 EasyTier, 一款美观实用的远程联机工具!"
arch=('x86_64')
options=('!debug')
url="https://cnb.cool/myqfeng/qteasytier/qt-easy-tier"
license=('LGPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'polkit')
makedepends=('base-devel' 'cmake' 'git' 'qt6-base' 'qt6-declarative' 'qt6-svg' 'ninja')
install=qteasytier.install
source=("${pkgname}::git+https://cnb.cool/myqfeng/qteasytier/qt-easy-tier#branch=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/usr -DCLONE_DAEMON_FROM=CNB
    cmake --build build -j"$(nproc)"
}

package() {
    cd "${srcdir}/${pkgname}"

    # 主程序
    install -Dm755 "build/Output/appQtEasyTier" \
        "${pkgdir}/opt/qteasytier/appQtEasyTier"

    # 后端守护进程
    install -Dm755 "build/Output/qtet-daemon" \
        "${pkgdir}/opt/qteasytier/qtet-daemon"

    # 动态库
    for lib in build/Output/*.so; do
        [ -f "$lib" ] && install -Dm644 "$lib" "${pkgdir}/opt/qteasytier/"
    done

    # 图标
    install -Dm644 "assets/favicon/qtet.png" \
        "${pkgdir}/opt/qteasytier/qtet.png"

    # systemd 服务
    install -Dm644 "assets/package/linux/qtet-daemon.service" \
        "${pkgdir}/etc/systemd/system/qtet-daemon.service"

    # 桌面文件
    install -Dm644 "assets/package/linux/qteasytier.desktop" \
        "${pkgdir}/usr/share/applications/qteasytier.desktop"

    # 创建 /usr/bin 软链接
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/qteasytier/appQtEasyTier" \
        "${pkgdir}/usr/bin/appQtEasyTier"
}
