# Maintainer: cheapl <cheapl@icloud.com>
pkgname=meshlab-bin
pkgver=2025.07
pkgrel=4
pkgdesc="3D triangular meshes processing and editing tool (pre-built binary version)"
arch=('x86_64' 'aarch64')
url="https://www.meshlab.net/"
license=('GPL')
depends=('libx11' 'libxcb' 'libgl' 'glu' 'fontconfig' 'hicolor-icon-theme' 'shared-mime-info')
provides=('meshlab')
conflicts=('meshlab')
options=(!strip !debug)

source_x86_64=("https://github.com/cnr-isti-vclab/meshlab/releases/download/MeshLab-${pkgver}/MeshLab${pkgver}-linux_x86_64.tar.gz")
source_aarch64=("https://github.com/cnr-isti-vclab/meshlab/releases/download/MeshLab-${pkgver}/MeshLab${pkgver}-linux_aarch64.tar.gz")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    # 1. 创建目标目录
    install -d "${pkgdir}/opt/meshlab"
    install -d "${pkgdir}/usr/bin"

    # 2. 将所有文件复制到 /opt/meshlab
    cp -a "${srcdir}/"* "${pkgdir}/opt/meshlab/" 2>/dev/null || true

    # 3. 修复权限：给所有文件赋予读取和执行权限 (解决之前的权限报警) [cite: 2]
    chmod -R 755 "${pkgdir}/opt/meshlab/"

    # 4. 重新编写启动脚本 (核心修复点)
    # 我们不再调用根目录的 AppRun，而是直接调用 usr/bin/meshlab
    cat > "${pkgdir}/usr/bin/meshlab" <<EOF
#!/bin/sh
# 定义绝对路径
MESHLAB_HOME="/opt/meshlab"

# A. 核心库路径：解决 "libmeshlab-common-gui.so: No such file" 错误 [cite: 2]
export LD_LIBRARY_PATH="\$MESHLAB_HOME/usr/lib:\$LD_LIBRARY_PATH"

# B. Qt 插件路径：确保界面渲染正常
export QT_PLUGIN_PATH="\$MESHLAB_HOME/usr/plugins"

# C. MeshLab 插件路径：解决 OBJ/STL 无法识别的问题
# 根据 tree 结构，IO 插件就在这个目录下
export MESHLAB_PLUGINS_PATH="\$MESHLAB_HOME/usr/lib/meshlab/plugins"

# D. 切换到二进制文件目录运行，以确保它能加载旁边的 qt.conf
cd "\$MESHLAB_HOME/usr/bin"
exec ./meshlab "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/meshlab"

    # 5. 安装图标和 .desktop 文件
    install -Dm644 "${pkgdir}/opt/meshlab/meshlab.png" "${pkgdir}/usr/share/pixmaps/meshlab.png"
    install -Dm644 "${pkgdir}/opt/meshlab/meshlab.desktop" "${pkgdir}/usr/share/applications/meshlab.desktop"

    # 6. 修正 .desktop 路径
    sed -i 's|Exec=.*|Exec=/usr/bin/meshlab|' "${pkgdir}/usr/share/applications/meshlab.desktop"
    sed -i 's|Icon=.*|Icon=meshlab|' "${pkgdir}/usr/share/applications/meshlab.desktop"
}
