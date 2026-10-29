# Maintainer: Your Name <your.email@example.com>
# 青简输入法 Linux/Fcitx5 官方支持版（Rust Server + Fcitx5 插件 + 离线数据模型）
#
# 官方源码自 2026-09 已正式合入 Linux 支持（PR #90）：
# 1. 源码直接使用官方仓库（qingjian-team/qingjian），全树构建。
# 2. Rust Server 官方二进制名为 qingjian-linux-server（打包提供 qingjian-server 软链接兼容），并提供 qingjian-settings 设置程序。
# 3. 数据包使用官方 release 发布的版本化 tag（data-v8），sha256 与官方 data.lock 一致，内置含章神经整句模型。
# 4. 资源文件安装至 /usr/share/qingjian/resources/，匹配官方 paths.rs 自动发现机制。

pkgname=fcitx5-qingjian-git
_pkgname=fcitx5-qingjian
pkgver=0.3.1.r102.g96a021ed
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
  "qingjian-data-v8.tar.gz::https://github.com/qingjian-team/qingjian/releases/download/data-v8/qingjian-data.tar.gz"
  "qingjian-server.service"
)
noextract=("qingjian-data-v8.tar.gz")
sha256sums=('SKIP'
            'c8aef81032b8cb2ca9f66e53a13f530b540c0ea5570ac5a9876dc71838868116'
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

  # 1. 编译 Linux 后端 Server 与设置程序
  cargo build --frozen --release -p qingjian-linux-server -p qingjian-settings

  # 2. 编译 Fcitx5 C++ 插件 (qingjian.so)
  cmake -B "${srcdir}/build-fcitx5" -S apps/linux/fcitx5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build "${srcdir}/build-fcitx5"
}

package() {
  cd "${srcdir}/qingjian"

  # 1. 安装 Rust Server 与设置程序（保留 qingjian-server 软链接以保证兼容性）
  install -Dm755 "target/release/qingjian-linux-server" "${pkgdir}/usr/bin/qingjian-linux-server"
  ln -sf qingjian-linux-server "${pkgdir}/usr/bin/qingjian-server"
  install -Dm755 "target/release/qingjian-settings" "${pkgdir}/usr/bin/qingjian-settings"

  # 2. 安装 Fcitx5 插件 (qingjian.so 与 qingjian.conf)
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build-fcitx5"

  # 3. 安装资源（词库、含章整句模型、辅助资源）
  # 官方 paths.rs 优先定位 /usr/share/qingjian/resources/
  local resdir="${pkgdir}/usr/share/qingjian/resources"
  install -dm755 "${resdir}"

  # 解包词库和模型数据并清理 macOS 隐藏元数据
  bsdtar --no-xattrs --no-mac-metadata -xzf "${srcdir}/qingjian-data-v8.tar.gz" -C "${resdir}"
  find "${resdir}/data" -name '._*' -delete

  # 复制辅助资源（表情、等级词典等）
  cp -r assets "${resdir}"

  # 建立兼容软链接，使 /usr/share/qingjian/data 指向 resources/data
  ln -sf resources/data "${pkgdir}/usr/share/qingjian/data"
  ln -sf resources/assets "${pkgdir}/usr/share/qingjian/assets"

  # 安装桌面图标（各标准尺寸）
  for size in 16 22 24 32 48 64 128 256; do
    if [[ -f "assets/icon/linux/hicolor/${size}x${size}/apps/qingjian.png" ]]; then
      install -Dm644 "assets/icon/linux/hicolor/${size}x${size}/apps/qingjian.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/qingjian.png"
    fi
  done

  # 安装桌面应用入口（设置程序）
  install -Dm644 apps/settings/linux/qingjian-settings.desktop \
    "${pkgdir}/usr/share/applications/qingjian-settings.desktop"

  # 4. 安装 Systemd User 守护服务
  install -Dm644 "${srcdir}/qingjian-server.service" \
    "${pkgdir}/usr/lib/systemd/user/qingjian-server.service"

  # 5. 安装 License 许可协议
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 assets/stroke/LICENSE-CNS11643.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CNS11643.txt"
}

