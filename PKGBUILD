# Maintainer: Your Name <your.email@example.com>
pkgname=xjtutoolbox
pkgver=1.2.3
pkgrel=1
pkgdesc="XJTUToolBox - A powerful utility tool"
arch=('x86_64' 'aarch64')
url="https://github.com/yan-xiaoo/XJTUToolBox"
license=('MIT')
# 编译依赖 uv 和基础构建工具
makedepends=('python' 'curl' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yan-xiaoo/XJTUToolBox/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('066ee0f212201bd4aee5704bbbc99833d28ae299ddc01459da7e24161efb07d5')

build() {
    cd "XJTUToolBox-${pkgver}"
    # 在独立环境中安装 uv 并构建
    curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR="$srcdir/.local/bin" sh
    export PATH="$srcdir/.local/bin:$PATH"
    uv python pin 3.12
    uv sync --locked --all-extras --dev
    uv run build.py
}

package() {
    cd "XJTUToolBox-${pkgver}"
    # 将打包好的文件复制到系统目录
    install -d "${pkgdir}/opt/XJTUToolbox"
    cp -r dist/XJTUToolbox/* "${pkgdir}/opt/XJTUToolbox/"
    
    # 建立软链接和桌面快捷方式 (假设 build.py 输出了这些)
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/XJTUToolbox/XJTUToolbox "${pkgdir}/usr/bin/xjtutoolbox"
}
