# Maintainer: Your Name <your.email@example.com>
# 青简输入法 Linux/Fcitx5 官方支持版（Rust Server + Fcitx5 插件 + 离线数据模型）
#
# 官方源码自 2026-09 已正式合入 Linux 支持（PR #90）：
# 1. 源码直接使用官方仓库（qingjian-team/qingjian），全树构建。
# 2. Rust Server 官方二进制名为 qingjian-linux-server（打包提供 qingjian-server 软链接兼容）。
# 3. 数据包使用官方 release 发布的版本化 tag（data-v1），sha256 与官方 data.lock 一致。
# 4. 资源文件安装至 /usr/share/qingjian/resources/，匹配官方 paths.rs 自动发现机制。

pkgname=fcitx5-qingjian-git
_pkgname=fcitx5-qingjian
pkgver=0.1.1.r194.g7ff5d27
pkgrel=1
pkgdesc="青简输入法 Linux/Fcitx5 官方支持版（Rust Server + Fcitx5 插件 + 离线数据模型）"
arch=('x86_64')
url="https://github.com/qingjian-team/qingjian"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'openssl' 'gcc-libs' 'glibc')
makedepends=('cargo' 'cmake' 'extra-cmake-modules' 'pkgconf' 'git' 'nlohmann-json')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"

source=(
  "qingjian::git+https://github.com/qingjian-team/qingjian.git"
  "qingjian-data-v1.tar.gz::https://github.com/qingjian-team/qingjian/releases/download/data-v1/qingjian-data.tar.gz"
  "model-v1.qjm::https://github.com/qingjian-team/qingjian/releases/download/data-v1/model.qjm"
  "qingjian-server.service"
)
noextract=("qingjian-data-v1.tar.gz")
sha256sums=('SKIP'
            '4b9eaa7c37f188eab5a52ad400267564eaae2e6bd049165e1389e0317d51d432'
            'eed5bd0bda0c7bd8b43d1acb2dc4678d4bbe295bd47b2b0d4eeace0af9daff4d'
            '819c81dfaa4308ea9c3a84b16bcee5672ebc4d1c737a676cc42367ea929e4bd6')

pkgver() {
  cd "${srcdir}/qingjian"
  git describe --tags --long --match="v[0-9]*" 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "0.1.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/qingjian"
  # 预拉取依赖（crates.io 直连不稳，建议在 ~/.cargo/config.toml 配置镜像）
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/qingjian"

  # 1. 编译 Linux 后端 Server
  cargo build --frozen --release -p qingjian-linux-server

  # 2. 编译 Fcitx5 C++ 插件 (qingjian.so)
  cmake -B "${srcdir}/build-fcitx5" -S apps/linux/fcitx5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "${srcdir}/build-fcitx5"
}

package() {
  cd "${srcdir}/qingjian"

  # 1. 安装 Rust Server 进程（保留 qingjian-server 软链接以保证兼容性）
  install -Dm755 "target/release/qingjian-linux-server" "${pkgdir}/usr/bin/qingjian-linux-server"
  ln -sf qingjian-linux-server "${pkgdir}/usr/bin/qingjian-server"

  # 2. 安装 Fcitx5 插件 (qingjian.so 与 qingjian.conf)
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build-fcitx5"

  # 3. 安装资源（词库、整句模型、辅助资源）
  # 官方 paths.rs 优先定位 /usr/share/qingjian/resources/
  local resdir="${pkgdir}/usr/share/qingjian/resources"
  install -d "${resdir}/data/generated"
  install -d "${resdir}/data/model"
  install -d "${resdir}/assets"

  # 解包词库并清理 macOS 隐藏元数据
  bsdtar -xzf "${srcdir}/qingjian-data-v1.tar.gz" -C "${resdir}/data/generated"
  find "${resdir}/data/generated" -name '._*' -delete

  # 安装整句模型文件
  install -Dm644 "${srcdir}/model-v1.qjm" "${resdir}/data/model/model.qjm"

  # 复制辅助资源（表情、等级词典等）
  cp -r assets/* "${resdir}/assets/"

  # 建立兼容软链接，使 /usr/share/qingjian/data 指向 resources/data
  ln -sf resources/data "${pkgdir}/usr/share/qingjian/data"
  ln -sf resources/assets "${pkgdir}/usr/share/qingjian/assets"

  # 安装桌面图标
  install -Dm644 "assets/icon/logo.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qingjian.png"

  # 4. 安装 Systemd User 守护服务
  install -Dm644 "${srcdir}/qingjian-server.service" \
    "${pkgdir}/usr/lib/systemd/user/qingjian-server.service"

  # 5. 安装 License 许可协议
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

