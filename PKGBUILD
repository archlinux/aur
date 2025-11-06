# ======================== 包元数据 ========================
# 维护者信息
maintainer="Nexus Xian <xyhctatrl@gamil.com>"

# 软件包名称。通常使用 -cli 或 -bin 后缀来区分 Go 应用。
pkgname=shiroha-cli

# 软件包版本。必须与您的 Git Tag 保持一致，但通常省略前缀 'v'。
pkgver=1.3.1

# 包发布版本。从 1 开始，每次 PKGBUILD 更新时递增。
pkgrel=2

# 软件包描述。
pkgdesc="A powerful CLI tool for bootstrapping and managing Gin-based web APIs.基于gin的goWeb脚手架"

# 您的项目 URL。
url="https://github.com/NexusXian/shiroha"

# 许可证。必须和您项目中的 LICENSE 文件保持一致。
license=('MIT')

# 支持的架构。Go 应用通常支持 x86_64 和 aarch64。
arch=('x86_64' 'aarch64')

# 运行时依赖。构建 Go 程序只需要 Go 本身。
depends=('go')

# ----------------------- 源码获取 -----------------------
# 使用 GitHub 的 Tag 压缩包 URL 获取源码。
# ${url}/archive/refs/tags/v$pkgver.tar.gz 是标准的 GitHub Tag 压缩包路径。
# 格式: <本地解压名>::<远程URL>
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")

# 校验码列表。必须与下载的 tar.gz 文件匹配。
# 初始为空，稍后使用 makepkg -g 生成。
sha256sums=('72a900e037342f5e12f14541786d0893af9d22440a4ceb367ac52f1222416697')

# ======================== 构建函数 ========================
build() {
    # 进入源码目录。GitHub 解压后的目录名是 'shiroha-0.1.0' (即 <repo>-<tag>)。
    cd "$srcdir/shiroha-$pkgver"

    # 使用 go build 编译。
    # -v: 详细输出。
    # -ldflags="-s -w": 优化标志，用于减小二进制文件大小（移除调试信息）。
    # -o shiroha: 指定输出文件名为 shiroha。
    # ./main.go: 您的 CLI 主入口文件路径。
    echo "Starting Go build for shiroha..."
    go build -v -ldflags="-s -w" -o shiroha ./main.go
}


# ======================== 打包安装函数 ========================
package() {
    # 再次进入源码目录
    cd "$srcdir/shiroha-$pkgver"

    # 1. 安装可执行文件
    # install -Dm755: D-创建目录；m755-设置文件权限为 rwxr-xr-x (可执行)
    # "$pkgdir"/usr/bin/shiroha: Arch Linux 中可执行文件路径
    echo "Installing shiroha executable to /usr/bin..."
    install -Dm755 shiroha "$pkgdir"/usr/bin/shiroha

    # 2. 安装许可证文件
    # install -Dm644: D-创建目录；m644-设置文件权限为 rw-r--r-- (只读)
    # "$pkgdir"/usr/share/licenses/$pkgname/: Arch Linux 中许可证文件的标准路径
    echo "Installing LICENSE to /usr/share/licenses..."
    # 假设您的项目根目录包含 LICENSE 文件
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
