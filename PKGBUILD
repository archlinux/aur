pkgname=nekoray-qt6
pkgver=4.0.1
pkgrel=1
pkgdesc="基于Qt的跨平台GUI代理配置管理器（后端：sing-box）"
arch=('x86_64')
url="https://github.com/MatsuriDayo/nekoray"
license=('GPL3')
depends=('qt6-base' 'qt6-svg' 'qt6-tools' 'yaml-cpp' 'zxing-cpp' 'protobuf' 'abseil-cpp' 'openssl')
makedepends=('cmake' 'ninja' 'go' 'git')
optdepends=('sing-geoip-db: NekoBox 的 geoip 数据库'
            'sing-geosite-db: NekoBox 的 geosite 数据库')
source=("git+${url}.git#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
    cd "nekoray"
    git submodule update --init --recursive

    # 检查QHotkey的CMakeLists.txt是否存在，如果不存在，尝试指定路径初始化子模块
    if [[ ! -f "3rdparty/QHotkey/CMakeLists.txt" ]]; then
    echo "QHotkey not found, initializing submodule separately..."
    git submodule update --init --recursive 3rdparty/QHotkey
    fi

    # 修改 QHotkey 的 CMakeLists.txt
    sed -i '1s/VERSION 3.1/VERSION 3.1...3.5/' 3rdparty/QHotkey/CMakeLists.txt


}

build() {

    cd "nekoray"
    # 构建 Go 部分（仅 Linux）
    ./libs/get_source.sh
    GOOS=linux GOARCH=amd64 ./libs/build_go.sh
    ./libs/build_public_res.sh

    # 构建 CPP 部分
    mkdir -p build
    cd build
    cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr/lib/nekoray" -DQT_VERSION_MAJOR=6 ..
    ninja
}
PKGDIR="$(pwd)"
package() {

    mkdir -p  "${pkgdir}/opt/nekoray"
    cd "$srcdir/nekoray"
    # 安装二进制文件
     install -Dt ${pkgdir}/opt/nekoray -m755 deployment/linux64/nekobox_core
     install -Dt ${pkgdir}/opt/nekoray -m755 build/nekobox
    # 安装其他文件
    cp -r "deployment/public_res/." "${pkgdir}/opt/nekoray/"
    # 安装桌图标
    install -Dm644 "res/public/nekobox.png" "${pkgdir}/usr/share/pixmaps/nekoray.png"

    cd "$PKGDIR"
    # 安装桌面文件 
    install -Dm644 "nekoray.desktop" "${pkgdir}/usr/share/applications/nekoray.desktop"

}
